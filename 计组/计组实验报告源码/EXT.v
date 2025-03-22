module EXT(
    input [4:0] iimm_shamt, // 立即数移位量
    input [11:0] iimm,  // 12位立即数（I-type指令）
    input [11:0] simm, // 12位立即数（S-type指令）
    input [11:0] bimm, // 12位立即数（B-type指令）
    input [19:0] uimm, // 20位立即数（U-type指令）
    input [19:0] jimm, // 20位立即数（J-type指令）
    input [5:0]	 EXTOp, // 符号扩展控制信号
    output reg [31:0] immout // 扩展后的32位立即数
);

always @(*)begin
    if(EXTOp == 6'b010000)begin
        immout = { {20{ iimm[11]}},iimm[11:0]}; // I-type指令的符号扩展
    end
    else if(EXTOp == 6'b001000)begin
        immout ={ {20{ simm[11]}},simm[11:0]}; // S-type指令的符号扩展
    end
    else begin
        immout = 32'hFFFFFFFF; // 默认值
    end
end
endmodule