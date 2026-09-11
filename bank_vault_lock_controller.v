`timescale 1ns / 1ps
//======================================================
// bank_vault_lock_controller.v
// Spartan-6 XC6SLX9-TQG144 Mini board, 12 MHz onboard clock.
//
// Unlock truth table (verified against reference table):
//   Unlock = (P & VP[1]) | (P & VP[0]) | (Open & P) | (Open & VP[1] & VP[0])
//======================================================
module bank_vault_lock_controller(
    input            clk,     // 12 MHz onboard oscillator, P87
    input            P,       // President switch,        P81 (SW2)
    input      [1:0] VP,      // VP[1]=P82(SW3), VP[0]=P83(SW4)
    input            Open,    // Bank Open switch,         P80 (SW1)
    output reg [7:0] LED = 8'b0,   // 8 discrete LEDs, active HIGH
    output           Unlock   // RGB Green LED, P94, active HIGH
    );

    // Combinational unlock condition - single source of truth
    assign Unlock = (P & VP[1]) | (P & VP[0]) | (Open & P) | (Open & VP[1] & VP[0]);

    // 0.5 s blink clock derived from the 12 MHz input
    wire slow_clock;
    clock_half_sec U0 (
        .clk        (clk),
        .clock_half (slow_clock)
    );

    // Blink all 8 LEDs together while unlocked, otherwise off.
    // Uses the Unlock wire directly instead of re-deriving the
    // expression, so the blink condition can never drift out of
    // sync with the Unlock output.
    always @(posedge slow_clock) begin
        if (Unlock)
            LED <= ~LED;
        else
            LED <= 8'b0000_0000;
    end

endmodule
