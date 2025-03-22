module Ctrl(
    input [6:0] Op,  // 操作码
    input [6:0] Funct7,  // funct7字段
    input [2:0] Funct3,    // funct3字段
    input Zero, // 零标志位
    output RegWrite, // 寄存器写使能信号
    output MemWrite, // 内存写使能信号
    output	[5:0]EXTOp,    // 符号扩展控制信号
    output [4:0] ALUOp,    // ALU操作码
    output ALUSrc,  // ALU的B操作数选择信号（选择立即数或寄存器）
    output [2:0] DMType, // 内存读写类型
    output [1:0] WDSel    // 写数据选择信号（选择ALU结果或内存数据）
);

// R-type指令的识别
wire rtype  = ~Op[6]&Op[5]&Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0]; // 0110011
wire i_add=rtype&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&~Funct3[2]&~Funct3[1]&~Funct3[0]; // add 0000000 000
wire i_sub=rtype&~Funct7[6]&Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&~Funct3[2]&~Funct3[1]&~Funct3[0]; // sub 0100000 000

// I-type指令的识别（load）
wire itype_l  = ~Op[6]&~Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0]; // 0000011
wire i_lb=itype_l&~Funct3[2]& ~Funct3[1]& ~Funct3[0]; // lb 000
wire i_lh=itype_l&~Funct3[2]& ~Funct3[1]& Funct3[0];  // lh 001
wire i_lw=itype_l&~Funct3[2]& Funct3[1]& ~Funct3[0];  // lw 010

// I-type指令的识别（立即数操作）
wire itype_r  = ~Op[6]&~Op[5]&Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0]; // 0010011
wire i_addi  =  itype_r& ~Funct3[2]& ~Funct3[1]& ~Funct3[0]; // addi 000 func3

// S-type指令的识别（store）
wire stype  = ~Op[6]&Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];   // 0100011
wire i_sb = stype& ~Funct3[2]& ~Funct3[1]&~Funct3[0]; // sb 000
wire i_sh = stype& ~Funct3[2]&~Funct3[1]&Funct3[0]; // sh 001
wire i_sw = stype& ~Funct3[2]& Funct3[1]&~Funct3[0]; // sw 010

// 控制信号生成
assign RegWrite = rtype | itype_r|itype_l  ; // 寄存器写使能
assign MemWrite = stype;              // 内存写使能
assign ALUSrc = itype_r | stype | itype_l ; // ALU的B操作数选择立即数
assign WDSel[0] = itype_l;   // 写数据选择信号
assign WDSel[1] = 1'b0;

// ALU操作码生成
assign ALUOp[0]= i_add|i_addi|stype|itype_l ;
assign ALUOp[1]= i_add|i_addi|stype|itype_l ;

// 符号扩展控制信号生成
assign EXTOp[5] = 1'b0;
assign EXTOp[4] = itype_l | itype_r;
assign EXTOp[3] = stype; 
assign EXTOp[2] = 1'b0;
assign EXTOp[1] = 1'b0;
assign EXTOp[0] = 1'b0;

// 内存读写类型控制信号生成
assign DMType[2]= 1'b0;
assign DMType[1]=i_lb | i_sb;
assign DMType[0]=i_lh | i_sh | i_lb | i_sb;
endmodule