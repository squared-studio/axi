/*
Write a markdown documentation for this systemverilog module:
Author : Foez Ahmed (foez.official@gmail.com)
<br>This file is part of squared-studio:axi
<br>Copyright (c) 2025 squared-studio
<br>Licensed under the MIT License
<br>See LICENSE file in the project root for full license information
*/

`include "axi_grid_macros.svh"
`include "axi_default_param_pkg.sv"

module axi_grid_xni #(
    parameter bit       IS_PIPELINED   = 1,
    parameter type      grid_id_t      = axi_default_param_pkg::grid_id_t,
    parameter type      grid_aw_chan_t = axi_default_param_pkg::grid_aw_chan_t,
    parameter type      grid_w_chan_t  = axi_default_param_pkg::grid_w_chan_t,
    parameter type      grid_b_chan_t  = axi_default_param_pkg::grid_b_chan_t,
    parameter type      grid_ar_chan_t = axi_default_param_pkg::grid_ar_chan_t,
    parameter type      grid_r_chan_t  = axi_default_param_pkg::grid_r_chan_t,
    parameter grid_id_t NI_ID          = '0
) (
    input logic clk_i,
    input logic arst_ni,
    `AXI_GRID_MODULE_PORTS
);

  `AXI_GRID_VH_JOIN_SPLIT_INST_FULL

  `define AXI_GRID_XNI_PIPELINE(__CHAN__)                                                         \
    pipeline #(                                                                                   \
        .ELEM_WIDTH(                                                                              \
            $bits(``__CHAN__``did_o)                                                              \
          + $bits(``__CHAN__``sid_o)                                                              \
          + $bits(``__CHAN__``chan_o))                                                            \
    ) u_pipeline_``__CHAN__`` (                                                                   \
        .arst_ni(arst_ni),                                                                        \
        .clk_i(clk_i),                                                                            \
        .rst_i('1),                                                                               \
        .elem_in_i({``__CHAN__``did_i, ``__CHAN__``sid_i, ``__CHAN__``chan_i}),                   \
        .elem_in_valid_i(``__CHAN__``valid_i),                                                    \
        .elem_in_ready_o(``__CHAN__``ready_o),                                                    \
        .elem_out_o({``__CHAN__``did_o, ``__CHAN__``sid_o, ``__CHAN__``chan_o}),                  \
        .elem_out_valid_o(``__CHAN__``valid_o),                                                   \
        .elem_out_ready_i(``__CHAN__``ready_i)                                                    \
    );                                                                                            \


  `define AXI_GRID_O_I(__SIG__) assign ``__SIG__``_o = ``__SIG__``_i;

  `define AXI_GRID_O_I_CHAN(__CHAN__)                                                             \
    `AXI_GRID_O_I(``__CHAN__``did)                                                                \
    `AXI_GRID_O_I(``__CHAN__``sid)                                                                \
    `AXI_GRID_O_I(``__CHAN__``chan)                                                               \
    `AXI_GRID_O_I(``__CHAN__``valid)                                                              \
    `AXI_GRID_O_I(``__CHAN__``ready)                                                              \


  if (IS_PIPELINED) begin : gen_pipeline
    `AXI_GRID_XNI_PIPELINE(aw)
    `AXI_GRID_XNI_PIPELINE(w)
    `AXI_GRID_XNI_PIPELINE(b)
    `AXI_GRID_XNI_PIPELINE(ar)
    `AXI_GRID_XNI_PIPELINE(r)
  end else begin : gen_direct
    `AXI_GRID_O_I_CHAN(aw)
    `AXI_GRID_O_I_CHAN(w)
    `AXI_GRID_O_I_CHAN(b)
    `AXI_GRID_O_I_CHAN(ar)
    `AXI_GRID_O_I_CHAN(r)
  end

endmodule
