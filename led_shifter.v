module LedShifter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n,
    output  reg [7:0] leds
);

localparam CICLO = CLK_FREQ / 4;
reg [31:0] cont;

always @( posedge clk or negedge rst_n ) 
begin
    if( !rst_n )
    begin
        leds = 8'b00011111;
        cont = 0;
    end
    else
    begin
        if( cont >= CICLO - 1 ) 
        begin
          cont <= 0;
          leds <= { leds[6:0], leds[7] };  
        end
        else
        begin
            cont <= cont + 1;
        end
    end
    
end
    
endmodule
