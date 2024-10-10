/*
The `axi_grid_vh_join` module is designed to join vertical and horizontal channels in an AXI grid.
It prioritizes the vertical channel over the horizontal channel based on the `prioritize_v` signal.
Author : Foez Ahmed (foez.official@gmail.com)
*/

`include "axi_default_param_pkg.sv"

module axi_grid_vh_join #(
    parameter type grid_id_t = axi_default_param_pkg::grid_id_t,  // Type for grid ID
    parameter type chan_t    = axi_default_param_pkg::grid_id_t   // Type for channel
) (
    input logic clk_i,   // Clock input
    input logic arst_ni, // Asynchronous reset (active low)

    input  grid_id_t v_did_i,    // Vertical destination ID
    input  grid_id_t v_sid_i,    // Vertical source ID
    input  chan_t    v_chan_i,   // Vertical channel
    input  logic     v_valid_i,  // Vertical valid signal
    output logic     v_ready_o,  // Vertical ready signal

    input  grid_id_t h_did_i,    // Horizontal destination ID
    input  grid_id_t h_sid_i,    // Horizontal source ID
    input  chan_t    h_chan_i,   // Horizontal channel
    input  logic     h_valid_i,  // Horizontal valid signal
    output logic     h_ready_o,  // Horizontal ready signal

    output grid_id_t did_o,    // Output destination ID
    output grid_id_t sid_o,    // Output source ID
    output chan_t    chan_o,   // Output channel
    output logic     valid_o,  // Output valid signal
    input  logic     ready_i   // Input ready signal
);

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-SIGNALS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  logic prioritize_v;  // Signal to prioritize vertical channel
  logic grant_v;  // Grant signal for vertical channel

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-ASSIGNMENTS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  always_comb begin
    case ({
      prioritize_v, v_valid_i, h_valid_i
    })
      3'b010, 3'b110, 3'b111: grant_v = '1;
      default: grant_v = '0;
    endcase
  end

  always_comb did_o = grant_v ? v_did_i : h_did_i;
  always_comb sid_o = grant_v ? v_sid_i : h_sid_i;
  always_comb chan_o = grant_v ? v_chan_i : h_chan_i;
  always_comb valid_o = grant_v ? v_valid_i : h_valid_i;
  always_comb v_ready_o = grant_v ? ready_i : '0;
  always_comb h_ready_o = grant_v ? '0 : ready_i;

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-SEQUENTIALS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  always_ff @(posedge clk_i or negedge arst_ni) begin
    if (~arst_ni) begin
      prioritize_v <= '0;
    end else begin
      case ({
        v_valid_i, v_ready_o, h_valid_i, h_ready_o
      })
        4'b0011, 4'b1011: prioritize_v <= '1;
        4'b1100, 4'b1110: prioritize_v <= '0;
        default: prioritize_v <= prioritize_v;
      endcase
    end
  end

endmodule
