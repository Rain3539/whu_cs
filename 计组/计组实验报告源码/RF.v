module RF(
    input	clk, // 时钟信号
    input	rst, // 复位信号
    input	RFWr, // 寄存器写使能信号
    input 	[15:0] sw_i, // 输入开关信号
    input 	[4:0] A1, A2, A3, // 寄存器地址
    input 	[31:0] WD, // 写入寄存器的数据
    output  [31:0] RD1, RD2 // 从寄存器读取的数据
);
reg[31:0] rf[31:0]; // 32个32位寄存器
integer i;

always @(posedge clk or negedge rst) begin
    if(!rst)begin
        for (i = 0; i < 32; i = i + 1) begin  
            rf[i] <= i; // 复位时初始化寄存器
        end                    
    end else if(RFWr && (!sw_i[1]))begin
        rf[A3] <= WD; // 写入寄存器
    end           
end

assign RD1 = (A1!=0)? rf[A1]:0; // 读取寄存器A1的值
assign RD2 = (A2!=0)? rf[A2]:0; // 读取寄存器A2的值
endmodule