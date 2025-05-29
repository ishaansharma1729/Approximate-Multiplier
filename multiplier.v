`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2025 20:11:23
// Design Name: 
// Module Name: multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier(input [3:0] A, input [3:0] B, output [7:0] result

    );
    wire pp01,pp02,pp03,pp10,pp11,pp12,pp13,pp20,pp21,pp22,pp23,pp30,pp31,pp32,pp33;
    wire c2, c3, c41,c42, c51,c52, c61,c62, c7;
    wire x3,x4,x5,x6;
    assign pp01 = A[0] & B[1];
    assign pp02 = A[0] & B[2];
    assign pp03 = A[0] & B[3];    
    assign pp10 = A[1] & B[0];
    assign pp11 = A[1] & B[1];
    assign pp12 = A[1] & B[2];
    assign pp13 = A[1] & B[3];
    
    assign pp20 = A[2] & B[0];
    assign pp21 = A[2] & B[1];
    assign pp22 = A[2] & B[2];
    assign pp23 = A[2] & B[3];
    assign pp30 = A[3] & B[0];
    assign pp31 = A[3] & B[1];
    assign pp32 = A[3] & B[2];
    assign pp33 = A[3] & B[3];
    assign result[0]=A[0]&B[0];
    assign result[1]=pp01^pp10;
    assign c2=pp01&pp10;
    a_compress comp1(pp11,pp20,pp02,c2,result[2],c3);
    a_compress comp2(pp21,pp12,pp30,pp03,x3,c41);
    ha ha2(x3,c3,result[3],c42);
    fa fa0(pp13,pp31,pp22,x4,c51);
    fa fa1(c41,c42,x4,result[4],c52);
    fa fa2(pp32,pp23,c51,x5,c61);
    ha ha4(x5,c52,result[5],c62);
    fa fa3(pp33,c61,c62,result[6],result[7]);
    
endmodule

module a_compress (input a,input b,input c,input d, output s, output cout);
    assign cout=a+b;
    assign s=~((a^b)|(~(c|d)));
endmodule
module fa(input a, input b,input c, output s,output cout);
    assign s=a^b^c;
    assign cout=a&b|b&c|c&a;
endmodule
module ha(input a,input b, output s,output cout);
    assign s=a^b;
    assign cout=a&b;
endmodule