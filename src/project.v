/*
 * Copyright (c) 2024 Konrad Beckmann
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_kbeckmann_01 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  // assign uo_out  = 8'b00000000;
  assign uio_out = 8'b00000000;
  assign uio_oe  = 8'b00000000;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, ui_in, uio_in};

  reg [7:0] counter;
  assign uo_out = counter;

  always @(posedge clk) begin
    if (~rst_n) begin
      counter <= 8'b00000000;
    end else begin
      counter <= counter + 1;
    end
  end

endmodule
