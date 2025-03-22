module ALU(
    input signed [31:0] 	A, B, // ALU的输入操作数
    input [4:0]  			ALUOp, // ALU操作码，决定ALU执行的操作
    output reg signed [31:0] 	C, // ALU的计算结果
    output reg  		Zero // 零标志位，当C为0时置1
);
always @(*) begin
    case(ALUOp)
        5'b00011: C = A+B; // 加法操作
        5'b00001: C = A-B; // 减法操作
    endcase
    Zero = (C == 0)? 1:0; // 如果结果为0，Zero置1
end
endmodule