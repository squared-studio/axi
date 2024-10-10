/*
Write a markdown documentation for this systemverilog module:
Author : Foez Ahmed (foez.official@gmail.com)
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

  if (IS_PIPELINED) begin : gen_pipeline
  end else begin : gen_direct
    assign awdid_o   = awdid_i;
    assign awsid_o   = awsid_i;
    assign awchan_o  = awchan_i;
    assign awvalid_o = awvalid_i;
    assign awready_o = awready_i;
    assign wdid_o    = wdid_i;
    assign wsid_o    = wsid_i;
    assign wchan_o   = wchan_i;
    assign wvalid_o  = wvalid_i;
    assign wready_o  = wready_i;
    assign bdid_o    = bdid_i;
    assign bsid_o    = bsid_i;
    assign bchan_o   = bchan_i;
    assign bvalid_o  = bvalid_i;
    assign bready_o  = bready_i;
    assign ardid_o   = ardid_i;
    assign arsid_o   = arsid_i;
    assign archan_o  = archan_i;
    assign arvalid_o = arvalid_i;
    assign arready_o = arready_i;
    assign rdid_o    = rdid_i;
    assign rsid_o    = rsid_i;
    assign rchan_o   = rchan_i;
    assign rvalid_o  = rvalid_i;
    assign rready_o  = rready_i;
  end

endmodule
