`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module tb;

  reg clock, reset, carga, j1, j2;
  reg [6:0] chaves;

  localparam PERIOD_100MHZ = 10;  

  initial
  begin
    clock = 1'b1;
    forever #(PERIOD_100MHZ/2) clock = ~clock;
  end

  initial
  begin
    reset = 1'b1;
    carga = 1'b0;
    j1    = 1'b0;
    j2    = 1'b0;
    chaves = 7'd5;
    #73;
    reset = 1'b0;
    #60;
    carga = 1'b1;
    #269;
    j2 = 1'b1;
    #23;
    carga = 1'b0;
    #75;
    j2 = 1'b0;
    #5502;
    j2 = 1'b1;
    #98;
    j2 = 1'b0;
    #5902;
    j1 = 1'b1;
    #98;
    j1 = 1'b0;
    #12902;
    j2 = 1'b1;
    #98;
    j2 = 1'b0;
    #4902;
    j1 = 1'b1;
    #98;
    j1 = 1'b0;
  end
  
  relogio_xadrez #(.CLOCK_FREQ(4)) DUT (.clock(clock), .reset(reset), .carga(carga), .j1(j1), .j2(j2), .chaves(chaves), .an(), .dec_ddp());

endmodule