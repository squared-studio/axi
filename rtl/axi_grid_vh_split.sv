/*
The `axi_grid_vh_split` module is designed to split input signals into vertical and horizontal
channels based on the grid ID. This module is parameterized to allow flexibility in the types of
grid IDs and channels used.
Author : Foez Ahmed (foez.official@gmail.com)
<br>This file is part of squared-studio:axi
<br>Copyright (c) 2025 squared-studio
<br>Licensed under the MIT License
<br>See LICENSE file in the project root for full license information
*/

`include "axi_default_param_pkg.sv"

module axi_grid_vh_split #(
    //Type for grid ID, default is `axi_default_param_pkg::grid_id_t`
    parameter type      grid_id_t = axi_default_param_pkg::grid_id_t,
    //Type for channel, default is `axi_default_param_pkg::grid_id_t`
    parameter type      chan_t    = axi_default_param_pkg::grid_id_t,
    //Grid ID for the network interface, default is `0`
    parameter grid_id_t NI_ID     = '0
) (
    input  grid_id_t did_i,    // Destination ID input
    input  grid_id_t sid_i,    // Source ID input
    input  chan_t    chan_i,   // Channel input
    input  logic     valid_i,  // Valid signal input
    output logic     ready_o,  // Ready signal output

    output grid_id_t v_did_o,    // Vertical channel destination ID output
    output grid_id_t v_sid_o,    // Vertical channel source ID output
    output chan_t    v_chan_o,   // Vertical channel output
    output logic     v_valid_o,  // Vertical channel valid signal output
    input  logic     v_ready_i,  // Vertical channel ready signal input

    output grid_id_t h_did_o,    // Horizontal channel destination ID output
    output grid_id_t h_sid_o,    // Horizontal channel source ID output
    output chan_t    h_chan_o,   // Horizontal channel output
    output logic     h_valid_o,  // Horizontal channel valid signal output
    input  logic     h_ready_i   // Horizontal channel ready signal input
);

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-ASSIGNMENTS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  always_comb v_did_o = did_i;
  always_comb v_sid_o = sid_i;
  always_comb v_chan_o = chan_i;
  always_comb h_did_o = did_i;
  always_comb h_sid_o = sid_i;
  always_comb h_chan_o = chan_i;

  always_comb begin
    v_valid_o = 0;
    h_valid_o = 0;
    if (did_i.h == NI_ID.h && h_ready_i) begin
      h_valid_o = valid_i;
      ready_o   = h_ready_i;
    end else begin
      v_valid_o = valid_i;
      ready_o   = v_ready_i;
    end
  end

endmodule
