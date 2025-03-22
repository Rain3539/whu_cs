module DM(
    input clk,  // 100MHz时钟
    input DMWr,  // 内存写使能信号
    input [5:0]	addr, // 内存地址
    input [31:0] din, // 写入内存的数据
    input [2:0]	DMType, // 内存读写类型
    output reg [31:0] dout // 从内存读取的数据
);
reg[7:0] dmem[6:0]; // 内存存储单元

always @(posedge clk) begin
    if(DMWr)begin
        case(DMType)
            3'b000:begin // 写入32位字               
            dmem[addr] = din[7:0];
            dmem[addr + 1] = din[15:8];
            dmem[addr + 2] = din[23:16];
            dmem[addr + 3] = din[31:24];end
            3'b001:begin // 写入16位半字
            dmem[addr] = din[7:0];
            dmem[addr + 1] = din[15:8];end
            3'b011:dmem[addr] <= din[7:0]; // 写入8位字节
        endcase
    end
end

always @(*)begin
    case(DMType)
        3'b000:dout = {dmem[addr + 3][7:0],dmem[addr + 2][7:0],dmem[addr + 1][7:0],dmem[addr][7:0]}; // 读取32位字
        3'b001:dout = {{16{dmem[addr + 1][7]}},dmem[addr + 1][7:0],dmem[addr][7:0]}; // 读取16位半字
        3'b011:dout = {{24{dmem[addr][7]}},dmem[addr][7:0]}; // 读取8位字节
    endcase
end
endmodule