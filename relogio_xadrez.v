module relogio_xadrez 
#(parameter CLOCK_FREQ = 50000000) // Parâmetro do divisor de clock
(
  input carga, reset, clock, j1, j2,
  input [6:0] chaves,
  output j1_fim, j2_fim,
  output [7:0] an, dec_ddp
);
  wire carga_int;
  wire j1_int, j2_int;
  
  wire [5:0] d1,d2,d3,d4,d5,d6,d7,d8;

  // instanciação dos detectores de borda
  edge_detector ed1 (.clock(clock), .reset(reset), .din(carga), .rising(carga_int));
  edge_detector ed2 (.clock(clock), .reset(reset), .din(j1), .rising(j1_int));
  edge_detector ed3 (.clock(clock), .reset(reset), .din(j2), .rising(j2_int));

  // instanciação do cronometro duplo
  cronometro_duplo #(.CLOCK_FREQ(CLOCK_FREQ)) cron (.carga_int(carga_int), .clock(clock), .reset(reset), .an(an), .dec_ddp(dec_ddp), .j1_int(j1_int), .j2_int(j2_int), .chaves(chaves), .j1_fim(j1_fim), .j2_fim(j2_fim));

endmodule

