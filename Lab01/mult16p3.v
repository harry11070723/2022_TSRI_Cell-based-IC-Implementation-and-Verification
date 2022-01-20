module mult16p3(a, b, clk, p);

        input [15:0] a;
        input [15:0] b;
        input        clk;
        output[31:0] p;

        reg [15:0] a_reg0, a_reg1, a_reg2, b_reg0;
        reg [ 7:0] b_reg1;
        reg [ 3:0] b_reg2;
        reg [23:0] p_reg1;
        reg [27:0] p_reg2;

        wire[19:0] t1, t2;

        assign t1 = a_reg1 * b_reg1[3:0];
        assign t2 = a_reg2 * b_reg2;
        assign #1 p = {t2, 12'b0} + p_reg2;

        always @(posedge clk)
          begin
                a_reg0 <= a;
                b_reg0 <= b;

                a_reg1 <= a_reg0;
                b_reg1 <= b_reg0[15:8];
                p_reg1 <= a_reg0 * b_reg0[7:0];

                a_reg2 <= a_reg1;
                b_reg2 <= b_reg1[7:4];
                p_reg2 <= {t1, 8'b0} + p_reg1;
          end

endmodule
