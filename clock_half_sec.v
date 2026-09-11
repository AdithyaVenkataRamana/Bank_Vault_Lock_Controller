`timescale 1ns / 1ps
//======================================================
// clock_half_sec.v
// Generates a 0.5-second period toggle (1 Hz square wave)
// from a 12 MHz input clock (Spartan-6 Mini board, clk = P87).
//
// 12,000,000 cycles/sec x 0.5 sec = 6,000,000 cycles per
// half period -> count 0 .. 5,999,999 then toggle.
//
// NOTE: The original tutorial used 49_999_999 because that
// board's clock was 100 MHz (50,000,000 cycles = 0.5 s).
// On this 12 MHz board that same constant gives a ~4.17 s
// half-period (~8.3 s full blink), which is why the LEDs
// looked like they weren't blinking.
//======================================================
module clock_half_sec(
    input  clk,                    // 12 MHz onboard oscillator (P87)
    output reg clock_half = 1'b0   // 1 Hz-ish square wave, 0.5s high / 0.5s low
    );

    // 6,000,000 needs at least 23 bits (2^23 = 8,388,608)
    reg [22:0] count = 23'd0;

    always @(posedge clk) begin
        if (count == 23'd5_999_999) begin
            count      <= 23'd0;
            clock_half <= ~clock_half;
        end else begin
            count <= count + 23'd1;
        end
    end

endmodule
