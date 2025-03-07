/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_devinatkin_santiago_alu (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output reg  [7:0] uo_out,   // Dedicated outputs
    input  wire       clk,      // Clock
    input  wire       rst_n     // Active-low reset
);

    wire [3:0] a = ui_in[3:0];  // Lower 4 bits
    wire [3:0] b = ui_in[7:4];  // Upper 4 bits
    wire [4:0] sum = a + b;     // 4-bit addition with carry

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            uo_out <= 8'b0;
        else
            uo_out <= {3'b0, sum}; // Assign sum to the lower 5 bits of output, zero pad the rest
    end

endmodule
