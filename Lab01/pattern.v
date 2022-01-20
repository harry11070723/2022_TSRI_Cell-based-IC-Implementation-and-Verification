module pattern;

    parameter TOTAL = 3000;

    reg [15:0] a, b;
    reg [31:0] p;

    integer i, sf;

    initial

        begin
          sf = $fopen("mult16p3.dat");
          for (i=0; i<TOTAL; i=i+1)
            begin
          a = $random;
          b = $random;
          p = a * b;
          $fdisplay(sf, "%b_%b_%b", a, b, p);
        end
          $fclose(sf);
    end

endmodule
