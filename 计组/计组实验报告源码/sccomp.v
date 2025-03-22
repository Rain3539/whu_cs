`timescale 1ns / 1ps
module sccomp(
    input clk, // 时钟信号
    input rstn, // 复位信号
    input [15:0] sw_i, // 输入开关信号
    output [7:0] disp_seg_o, // 数码管段选信号
    output [7:0] disp_an_o // 数码管位选信号
);
reg [31:0] clkdiv; // 时钟分频计数器
wire Clk_CPU; // CPU时钟

always @(posedge clk or negedge rstn) begin
    if (!rstn)
        clkdiv <= 0;
    else
        clkdiv <= clkdiv + 1'b1;
end

assign Clk_CPU = (sw_i[15]) ? clkdiv[27] : clkdiv[25]; // 根据开关选择CPU时钟频率

reg [63:0] display_data; // 数码管显示数据
reg [5:0] led_data_addr; // LED数据地址
reg [63:0] led_disp_data; // LED显示数据
parameter LED_DATA_NUM = 19; // LED数据数量
parameter ROM_ADDR_NUM = 64; // ROM地址数量
reg [63:0] LED_DATA [18:0]; // LED数据存储

initial begin
    // 初始化LED数据
    LED_DATA[0] = 64'hC6F6F6F0C6F6F6F0;
    LED_DATA[1] = 64'hF9F6F6CFF9F6F6CF;
    // ... 其他LED数据初始化
end

wire [31:0] instr; // 指令
reg [31:0] reg_data; // 寄存器数据
reg [31:0] alu_disp_data; // ALU显示数据
reg [31:0] dmem_data; // 内存数据
reg [63:0] rom_addr; // ROM地址
reg [5:0] reg_addr; // 寄存器地址
reg [2:0] alu_addr; // ALU地址
reg [5:0] dmem_addr; // 内存地址

// 指令译码
wire[6:0] Op = instr[6:0];  // 操作码
wire[6:0] Funct7 = instr[31:25]; // funct7字段
wire[2:0] Funct3 = instr[14:12]; // funct3字段
wire[4:0] rs1 = instr[19:15];  // 源寄存器1
wire[4:0] rs2 = instr[24:20];  // 源寄存器2
wire[4:0] rd = instr[11:7];  // 目标寄存器
wire[11:0] iimm=instr[31:20]; // I-type指令立即数
wire[11:0] simm={instr[31:25],instr[11:7]}; // S-type指令立即数

// 控制模块实例化
wire RegWrite,MemWrite,ALUSrc;
wire [5:0]EXTOp;
wire [4:0] ALUOp;
wire [2:0] DMType;
wire [1:0] WDSel;
Ctrl U_Ctrl(.Op(Op),.Funct7(Funct7),.Funct3(Funct3),.Zero(Zero),.RegWrite(RegWrite),.MemWrite(MemWrite),.EXTOp(EXTOp),.ALUOp(ALUOp),.ALUSrc(ALUSrc),.DMType(DMType),.WDSel(WDSel));

// 符号扩展模块实例化
wire[4:0] iimm_shamt;
wire[11:0] bimm;
wire[19:0] uimm,jimm;
wire[31:0] immout;
EXT U_EXT(.iimm_shamt(iimm_shamt),.iimm(iimm),.simm(simm),.bimm(bimm),.uimm(uimm),.jimm(jimm),.EXTOp(EXTOp),.immout(immout));

// 寄存器文件实例化
reg[31:0] WD;
wire[31:0] RD1, RD2;
always @(*)
begin
	case(WDSel)
		2'b00: WD<=aluout; // 选择ALU结果
		2'b01: WD<=dout; // 选择内存数据
	endcase
end
RF U_RF(.clk(Clk_CPU),.rst(rstn),.RFWr(RegWrite),.sw_i(sw_i),.A1(rs1),.A2(rs2),.A3(rd),.WD(WD),.RD1(RD1),.RD2(RD2));

// ALU实例化
wire signed [31:0] A,B,aluout;
wire Zero;
assign A = RD1;
assign B = (ALUSrc)? immout:RD2;
ALU U_ALU(.A(A),.B(B),.ALUOp(ALUOp),.C(aluout),.Zero(Zero));

// 内存模块实例化
parameter DM_DATA_NUM = 16;
wire [31:0] dout;
DM U_DM(.clk(Clk_CPU),.DMWr(MemWrite),.addr(aluout),.din(RD2),.DMType(DMType),.dout(dout));

// 生成LED显示数据
always @(posedge Clk_CPU or negedge rstn) begin  
    if (!rstn) begin
        led_data_addr <= 6'd0;
        led_disp_data <= 64'b1;
        rom_addr <= 1'b0;
        reg_addr = 6'b0;
        alu_addr = 3'b0;
        dmem_addr = 6'b0;
    end else if (sw_i[0] == 1'b1) begin
        if (led_data_addr == LED_DATA_NUM) begin
            led_data_addr <= 6'd0;
            led_disp_data <= 64'b1;
        end 
        else begin
            led_disp_data <= LED_DATA[led_data_addr];
            led_data_addr <= led_data_addr + 1'b1;
        end
    end else if(sw_i[14]==1'b1) begin
        if(rom_addr==ROM_ADDR_NUM)
            begin
            rom_addr <=  1'b0;   
            end  
        else if(sw_i[1] == 1'b0)begin      
            led_data_addr <= led_data_addr;
            rom_addr=rom_addr+1'b1;
         end
         else begin
            led_data_addr <= led_data_addr;
            rom_addr = rom_addr;
         end
    end else if(sw_i[13]==1'b1) begin
            reg_data = U_RF.rf[reg_addr];  
            reg_addr = reg_addr+1'b1;                                                                                                            
     end else if(sw_i[12]==1'b1)begin
                case(alu_addr)
                3'b000:alu_disp_data = U_ALU.A;
                3'b001:alu_disp_data = U_ALU.B;
                3'b010:alu_disp_data = U_ALU.C;
                3'b011:alu_disp_data = U_ALU.Zero;   
                default:alu_disp_data = 32'hFFFFFFFF;
                endcase
                alu_addr =