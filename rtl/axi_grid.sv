/*
Write a markdown documentation for this systemverilog module:
Author : Foez Ahmed (foez.official@gmail.com)
<br>This file is part of squared-studio:axi
<br>Copyright (c) 2024 squared-studio
<br>Licensed under the MIT License
<br>See LICENSE file in the project root for full license information
*/

`include "axi4_typedef.svh"
`include "axi_grid_macros.svh"
`include "axi_default_param_pkg.sv"

module axi_grid #(
    parameter bit IS_PIPELINED = 1,
    parameter type sni_req_t = axi_default_param_pkg::sni_req_t,
    parameter type sni_resp_t = axi_default_param_pkg::sni_resp_t,
    parameter type mni_req_t = axi_default_param_pkg::mni_req_t,
    parameter type mni_resp_t = axi_default_param_pkg::mni_resp_t,
    parameter int NUM_ROW = 3,
    parameter int NUM_COL = 3,
    parameter int NUM_MNI = 4,
    parameter int NUM_SNI = 3,
    parameter int MNI_INDEX[NUM_ROW][NUM_COL] = '{'{0, 3, -1}, '{-1, 1, -1}, '{-1, -1, 2}},
    parameter int SNI_INDEX[NUM_ROW][NUM_COL] = '{'{-1, -1, 0}, '{1, -1, -1}, '{-1, 2, -1}}
) (
    input logic clk_i,
    input logic arst_ni,

    input  sni_req_t  sni_req_i [NUM_SNI],
    output sni_resp_t sni_resp_o[NUM_SNI],

    output mni_req_t  mni_req_o [NUM_MNI],
    input  mni_resp_t mni_resp_i[NUM_MNI]
);

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-TYPEDEFS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  `define CLOG2M(__VAL__) ( ($clog2(``__VAL__``) > 1) ? $clog2(``__VAL__``) : 1)

  `AXI4_T(grid, $bits(mni_req_o[0].ar.addr), $bits(mni_resp_i[0].r.data),
          $bits(mni_req_o[0].ar.id), $bits(mni_req_o[0].aw.id), $bits(mni_req_o[0].aw.user),
          $bits(mni_req_o[0].w.user), $bits(mni_resp_i[0].b.user))
  // grid_aw_chan_t
  // grid_w_chan_t
  // grid_b_chan_t
  // grid_ar_chan_t
  // grid_r_chan_t
  // grid_req_t
  // grid_resp_t

  typedef struct packed {
    logic [`CLOG2M(NUM_ROW)-1:0] h;
    logic [`CLOG2M(NUM_COL)-1:0] v;
  } grid_id_t;

  grid_id_t      h_awsid  [NUM_COL+1];
  grid_id_t      h_awdid  [NUM_COL+1];
  grid_aw_chan_t h_awchan [NUM_COL+1];
  logic          h_awvalid[NUM_COL+1];
  logic          h_awready[NUM_COL+1];

  grid_id_t      h_wsid   [NUM_COL+1];
  grid_id_t      h_wdid   [NUM_COL+1];
  grid_w_chan_t  h_wchan  [NUM_COL+1];
  logic          h_wvalid [NUM_COL+1];
  logic          h_wready [NUM_COL+1];

  grid_id_t      h_bdid   [NUM_COL+1];
  grid_b_chan_t  h_bchan  [NUM_COL+1];
  logic          h_bvalid [NUM_COL+1];
  logic          h_bready [NUM_COL+1];

  grid_id_t      h_ardid  [NUM_COL+1];
  grid_ar_chan_t h_archan [NUM_COL+1];
  logic          h_arvalid[NUM_COL+1];
  logic          h_arready[NUM_COL+1];

  grid_id_t      h_rdid   [NUM_COL+1];
  grid_r_chan_t  h_rchan  [NUM_COL+1];
  logic          h_rvalid [NUM_COL+1];
  logic          h_rready [NUM_COL+1];

  grid_id_t      v_awsid  [NUM_ROW+1];
  grid_id_t      v_awdid  [NUM_ROW+1];
  grid_aw_chan_t v_awchan [NUM_ROW+1];
  logic          v_awvalid[NUM_ROW+1];
  logic          v_awready[NUM_ROW+1];

  grid_id_t      v_wsid   [NUM_ROW+1];
  grid_id_t      v_wdid   [NUM_ROW+1];
  grid_w_chan_t  v_wchan  [NUM_ROW+1];
  logic          v_wvalid [NUM_ROW+1];
  logic          v_wready [NUM_ROW+1];

  grid_id_t      v_bdid   [NUM_ROW+1];
  grid_b_chan_t  v_bchan  [NUM_ROW+1];
  logic          v_bvalid [NUM_ROW+1];
  logic          v_bready [NUM_ROW+1];

  grid_id_t      v_ardid  [NUM_ROW+1];
  grid_ar_chan_t v_archan [NUM_ROW+1];
  logic          v_arvalid[NUM_ROW+1];
  logic          v_arready[NUM_ROW+1];

  grid_id_t      v_rdid   [NUM_ROW+1];
  grid_r_chan_t  v_rchan  [NUM_ROW+1];
  logic          v_rvalid [NUM_ROW+1];
  logic          v_rready [NUM_ROW+1];

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-LOCALPARAMS GENERATED
  //////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-TYPEDEFS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-SIGNALS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-ASSIGNMENTS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  assign h_awsid[0]         = h_awsid[NUM_COL];
  assign h_awdid[0]         = h_awdid[NUM_COL];
  assign h_awchan[0]        = h_awchan[NUM_COL];
  assign h_awvalid[0]       = h_awvalid[NUM_COL];
  assign h_awready[NUM_COL] = h_awready[0];
  assign h_wsid[0]          = h_wsid[NUM_COL];
  assign h_wdid[0]          = h_wdid[NUM_COL];
  assign h_wchan[0]         = h_wchan[NUM_COL];
  assign h_wvalid[0]        = h_wvalid[NUM_COL];
  assign h_wready[NUM_COL]  = h_wready[0];
  assign h_bdid[0]          = h_bdid[NUM_COL];
  assign h_bchan[0]         = h_bchan[NUM_COL];
  assign h_bvalid[0]        = h_bvalid[NUM_COL];
  assign h_bready[NUM_COL]  = h_bready[0];
  assign h_ardid[0]         = h_ardid[NUM_COL];
  assign h_archan[0]        = h_archan[NUM_COL];
  assign h_arvalid[0]       = h_arvalid[NUM_COL];
  assign h_arready[NUM_COL] = h_arready[0];
  assign h_rdid[0]          = h_rdid[NUM_COL];
  assign h_rchan[0]         = h_rchan[NUM_COL];
  assign h_rvalid[0]        = h_rvalid[NUM_COL];
  assign h_rready[NUM_COL]  = h_rready[0];
  assign h_awsid[0]         = h_awsid[NUM_ROW];
  assign h_awdid[0]         = h_awdid[NUM_ROW];
  assign h_awchan[0]        = h_awchan[NUM_ROW];
  assign h_awvalid[0]       = h_awvalid[NUM_ROW];
  assign h_awready[NUM_ROW] = h_awready[0];
  assign h_wsid[0]          = h_wsid[NUM_ROW];
  assign h_wdid[0]          = h_wdid[NUM_ROW];
  assign h_wchan[0]         = h_wchan[NUM_ROW];
  assign h_wvalid[0]        = h_wvalid[NUM_ROW];
  assign h_wready[NUM_ROW]  = h_wready[0];
  assign h_bdid[0]          = h_bdid[NUM_ROW];
  assign h_bchan[0]         = h_bchan[NUM_ROW];
  assign h_bvalid[0]        = h_bvalid[NUM_ROW];
  assign h_bready[NUM_ROW]  = h_bready[0];
  assign h_ardid[0]         = h_ardid[NUM_ROW];
  assign h_archan[0]        = h_archan[NUM_ROW];
  assign h_arvalid[0]       = h_arvalid[NUM_ROW];
  assign h_arready[NUM_ROW] = h_arready[0];
  assign h_rdid[0]          = h_rdid[NUM_ROW];
  assign h_rchan[0]         = h_rchan[NUM_ROW];
  assign h_rvalid[0]        = h_rvalid[NUM_ROW];
  assign h_rready[NUM_ROW]  = h_rready[0];

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-RTLS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  for (genvar row = 0; row < NUM_ROW; row++) begin : gen_row
    for (genvar col = 0; col < NUM_COL; col++) begin : gen_col
      if (MNI_INDEX[row][col] != -1) begin : gen_mni
        ////////////////////////////////////////////////////////////
        axi_grid_mni #(
            .req_t(mni_req_t),
            .resp_t(mni_resp_t),
            .grid_id_t(grid_id_t),
            .grid_aw_chan_t(grid_aw_chan_t),
            .grid_w_chan_t(grid_w_chan_t),
            .grid_b_chan_t(grid_b_chan_t),
            .grid_ar_chan_t(grid_ar_chan_t),
            .grid_r_chan_t(grid_r_chan_t),
            .NI_ID('{h: row, v: col})
        ) u_mni (
            .clk_i,
            .arst_ni,
            .req_o      (mni_req_o[MNI_INDEX[row][col]]),
            .resp_i     (mni_resp_i[MNI_INDEX[row][col]]),
            .h_awsid_i  (h_awsid[row]),
            .h_awdid_i  (h_awdid[row]),
            .h_awchan_i (h_awchan[row]),
            .h_awvalid_i(h_awvalid[row]),
            .h_awready_o(h_awready[row]),
            .h_wsid_i   (h_wsid[row]),
            .h_wdid_i   (h_wdid[row]),
            .h_wchan_i  (h_wchan[row]),
            .h_wvalid_i (h_wvalid[row]),
            .h_wready_o (h_wready[row]),
            .h_bdid_i   (h_bdid[row]),
            .h_bchan_i  (h_bchan[row]),
            .h_bvalid_i (h_bvalid[row]),
            .h_bready_o (h_bready[row]),
            .h_ardid_i  (h_ardid[row]),
            .h_archan_i (h_archan[row]),
            .h_arvalid_i(h_arvalid[row]),
            .h_arready_o(h_arready[row]),
            .h_rdid_i   (h_rdid[row]),
            .h_rchan_i  (h_rchan[row]),
            .h_rvalid_i (h_rvalid[row]),
            .h_rready_o (h_rready[row]),
            .v_awsid_i  (v_awsid[col]),
            .v_awdid_i  (v_awdid[col]),
            .v_awchan_i (v_awchan[col]),
            .v_awvalid_i(v_awvalid[col]),
            .v_awready_o(v_awready[col]),
            .v_wsid_i   (v_wsid[col]),
            .v_wdid_i   (v_wdid[col]),
            .v_wchan_i  (v_wchan[col]),
            .v_wvalid_i (v_wvalid[col]),
            .v_wready_o (v_wready[col]),
            .v_bdid_i   (v_bdid[col]),
            .v_bchan_i  (v_bchan[col]),
            .v_bvalid_i (v_bvalid[col]),
            .v_bready_o (v_bready[col]),
            .v_ardid_i  (v_ardid[col]),
            .v_archan_i (v_archan[col]),
            .v_arvalid_i(v_arvalid[col]),
            .v_arready_o(v_arready[col]),
            .v_rdid_i   (v_rdid[col]),
            .v_rchan_i  (v_rchan[col]),
            .v_rvalid_i (v_rvalid[col]),
            .v_rready_o (v_rready[col]),
            .h_awsid_o  (h_awsid[row+1]),
            .h_awdid_o  (h_awdid[row+1]),
            .h_awchan_o (h_awchan[row+1]),
            .h_awvalid_o(h_awvalid[row+1]),
            .h_awready_i(h_awready[row+1]),
            .h_wsid_o   (h_wsid[row+1]),
            .h_wdid_o   (h_wdid[row+1]),
            .h_wchan_o  (h_wchan[row+1]),
            .h_wvalid_o (h_wvalid[row+1]),
            .h_wready_i (h_wready[row+1]),
            .h_bdid_o   (h_bdid[row+1]),
            .h_bchan_o  (h_bchan[row+1]),
            .h_bvalid_o (h_bvalid[row+1]),
            .h_bready_i (h_bready[row+1]),
            .h_ardid_o  (h_ardid[row+1]),
            .h_archan_o (h_archan[row+1]),
            .h_arvalid_o(h_arvalid[row+1]),
            .h_arready_i(h_arready[row+1]),
            .h_rdid_o   (h_rdid[row+1]),
            .h_rchan_o  (h_rchan[row+1]),
            .h_rvalid_o (h_rvalid[row+1]),
            .h_rready_i (h_rready[row+1]),
            .v_awsid_o  (v_awsid[col+1]),
            .v_awdid_o  (v_awdid[col+1]),
            .v_awchan_o (v_awchan[col+1]),
            .v_awvalid_o(v_awvalid[col+1]),
            .v_awready_i(v_awready[col+1]),
            .v_wsid_o   (v_wsid[col+1]),
            .v_wdid_o   (v_wdid[col+1]),
            .v_wchan_o  (v_wchan[col+1]),
            .v_wvalid_o (v_wvalid[col+1]),
            .v_wready_i (v_wready[col+1]),
            .v_bdid_o   (v_bdid[col+1]),
            .v_bchan_o  (v_bchan[col+1]),
            .v_bvalid_o (v_bvalid[col+1]),
            .v_bready_i (v_bready[col+1]),
            .v_ardid_o  (v_ardid[col+1]),
            .v_archan_o (v_archan[col+1]),
            .v_arvalid_o(v_arvalid[col+1]),
            .v_arready_i(v_arready[col+1]),
            .v_rdid_o   (v_rdid[col+1]),
            .v_rchan_o  (v_rchan[col+1]),
            .v_rvalid_o (v_rvalid[col+1]),
            .v_rready_i (v_rready[col+1])
        );
        ////////////////////////////////////////////////////////////
      end else if (SNI_INDEX[row][col] != -1) begin : gen_sni
        ////////////////////////////////////////////////////////////
        axi_grid_sni #(
            .req_t(sni_req_t),
            .resp_t(sni_resp_t),
            .grid_id_t(grid_id_t),
            .grid_aw_chan_t(grid_aw_chan_t),
            .grid_w_chan_t(grid_w_chan_t),
            .grid_b_chan_t(grid_b_chan_t),
            .grid_ar_chan_t(grid_ar_chan_t),
            .grid_r_chan_t(grid_r_chan_t),
            .NI_ID('{h: row, v: col})
        ) u_sni (
            .clk_i,
            .arst_ni,
            .req_i      (sni_req_i[SNI_INDEX[row][col]]),
            .resp_o     (sni_resp_o[SNI_INDEX[row][col]]),
            .h_awsid_i  (h_awsid[row]),
            .h_awdid_i  (h_awdid[row]),
            .h_awchan_i (h_awchan[row]),
            .h_awvalid_i(h_awvalid[row]),
            .h_awready_o(h_awready[row]),
            .h_wsid_i   (h_wsid[row]),
            .h_wdid_i   (h_wdid[row]),
            .h_wchan_i  (h_wchan[row]),
            .h_wvalid_i (h_wvalid[row]),
            .h_wready_o (h_wready[row]),
            .h_bdid_i   (h_bdid[row]),
            .h_bchan_i  (h_bchan[row]),
            .h_bvalid_i (h_bvalid[row]),
            .h_bready_o (h_bready[row]),
            .h_ardid_i  (h_ardid[row]),
            .h_archan_i (h_archan[row]),
            .h_arvalid_i(h_arvalid[row]),
            .h_arready_o(h_arready[row]),
            .h_rdid_i   (h_rdid[row]),
            .h_rchan_i  (h_rchan[row]),
            .h_rvalid_i (h_rvalid[row]),
            .h_rready_o (h_rready[row]),
            .v_awsid_i  (v_awsid[col]),
            .v_awdid_i  (v_awdid[col]),
            .v_awchan_i (v_awchan[col]),
            .v_awvalid_i(v_awvalid[col]),
            .v_awready_o(v_awready[col]),
            .v_wsid_i   (v_wsid[col]),
            .v_wdid_i   (v_wdid[col]),
            .v_wchan_i  (v_wchan[col]),
            .v_wvalid_i (v_wvalid[col]),
            .v_wready_o (v_wready[col]),
            .v_bdid_i   (v_bdid[col]),
            .v_bchan_i  (v_bchan[col]),
            .v_bvalid_i (v_bvalid[col]),
            .v_bready_o (v_bready[col]),
            .v_ardid_i  (v_ardid[col]),
            .v_archan_i (v_archan[col]),
            .v_arvalid_i(v_arvalid[col]),
            .v_arready_o(v_arready[col]),
            .v_rdid_i   (v_rdid[col]),
            .v_rchan_i  (v_rchan[col]),
            .v_rvalid_i (v_rvalid[col]),
            .v_rready_o (v_rready[col]),
            .h_awsid_o  (h_awsid[row+1]),
            .h_awdid_o  (h_awdid[row+1]),
            .h_awchan_o (h_awchan[row+1]),
            .h_awvalid_o(h_awvalid[row+1]),
            .h_awready_i(h_awready[row+1]),
            .h_wsid_o   (h_wsid[row+1]),
            .h_wdid_o   (h_wdid[row+1]),
            .h_wchan_o  (h_wchan[row+1]),
            .h_wvalid_o (h_wvalid[row+1]),
            .h_wready_i (h_wready[row+1]),
            .h_bdid_o   (h_bdid[row+1]),
            .h_bchan_o  (h_bchan[row+1]),
            .h_bvalid_o (h_bvalid[row+1]),
            .h_bready_i (h_bready[row+1]),
            .h_ardid_o  (h_ardid[row+1]),
            .h_archan_o (h_archan[row+1]),
            .h_arvalid_o(h_arvalid[row+1]),
            .h_arready_i(h_arready[row+1]),
            .h_rdid_o   (h_rdid[row+1]),
            .h_rchan_o  (h_rchan[row+1]),
            .h_rvalid_o (h_rvalid[row+1]),
            .h_rready_i (h_rready[row+1]),
            .v_awsid_o  (v_awsid[col+1]),
            .v_awdid_o  (v_awdid[col+1]),
            .v_awchan_o (v_awchan[col+1]),
            .v_awvalid_o(v_awvalid[col+1]),
            .v_awready_i(v_awready[col+1]),
            .v_wsid_o   (v_wsid[col+1]),
            .v_wdid_o   (v_wdid[col+1]),
            .v_wchan_o  (v_wchan[col+1]),
            .v_wvalid_o (v_wvalid[col+1]),
            .v_wready_i (v_wready[col+1]),
            .v_bdid_o   (v_bdid[col+1]),
            .v_bchan_o  (v_bchan[col+1]),
            .v_bvalid_o (v_bvalid[col+1]),
            .v_bready_i (v_bready[col+1]),
            .v_ardid_o  (v_ardid[col+1]),
            .v_archan_o (v_archan[col+1]),
            .v_arvalid_o(v_arvalid[col+1]),
            .v_arready_i(v_arready[col+1]),
            .v_rdid_o   (v_rdid[col+1]),
            .v_rchan_o  (v_rchan[col+1]),
            .v_rvalid_o (v_rvalid[col+1]),
            .v_rready_i (v_rready[col+1])
        );
        ////////////////////////////////////////////////////////////
      end else begin : gen_xni
        ////////////////////////////////////////////////////////////
        axi_grid_xni #(
            .IS_PIPELINED(IS_PIPELINED),
            .grid_id_t(grid_id_t),
            .grid_aw_chan_t(grid_aw_chan_t),
            .grid_w_chan_t(grid_w_chan_t),
            .grid_b_chan_t(grid_b_chan_t),
            .grid_ar_chan_t(grid_ar_chan_t),
            .grid_r_chan_t(grid_r_chan_t),
            .NI_ID('{h: row, v: col})
        ) u_xni (
            .clk_i,
            .arst_ni,
            .h_awsid_i  (h_awsid[row]),
            .h_awdid_i  (h_awdid[row]),
            .h_awchan_i (h_awchan[row]),
            .h_awvalid_i(h_awvalid[row]),
            .h_awready_o(h_awready[row]),
            .h_wsid_i   (h_wsid[row]),
            .h_wdid_i   (h_wdid[row]),
            .h_wchan_i  (h_wchan[row]),
            .h_wvalid_i (h_wvalid[row]),
            .h_wready_o (h_wready[row]),
            .h_bdid_i   (h_bdid[row]),
            .h_bchan_i  (h_bchan[row]),
            .h_bvalid_i (h_bvalid[row]),
            .h_bready_o (h_bready[row]),
            .h_ardid_i  (h_ardid[row]),
            .h_archan_i (h_archan[row]),
            .h_arvalid_i(h_arvalid[row]),
            .h_arready_o(h_arready[row]),
            .h_rdid_i   (h_rdid[row]),
            .h_rchan_i  (h_rchan[row]),
            .h_rvalid_i (h_rvalid[row]),
            .h_rready_o (h_rready[row]),
            .v_awsid_i  (v_awsid[col]),
            .v_awdid_i  (v_awdid[col]),
            .v_awchan_i (v_awchan[col]),
            .v_awvalid_i(v_awvalid[col]),
            .v_awready_o(v_awready[col]),
            .v_wsid_i   (v_wsid[col]),
            .v_wdid_i   (v_wdid[col]),
            .v_wchan_i  (v_wchan[col]),
            .v_wvalid_i (v_wvalid[col]),
            .v_wready_o (v_wready[col]),
            .v_bdid_i   (v_bdid[col]),
            .v_bchan_i  (v_bchan[col]),
            .v_bvalid_i (v_bvalid[col]),
            .v_bready_o (v_bready[col]),
            .v_ardid_i  (v_ardid[col]),
            .v_archan_i (v_archan[col]),
            .v_arvalid_i(v_arvalid[col]),
            .v_arready_o(v_arready[col]),
            .v_rdid_i   (v_rdid[col]),
            .v_rchan_i  (v_rchan[col]),
            .v_rvalid_i (v_rvalid[col]),
            .v_rready_o (v_rready[col]),
            .h_awsid_o  (h_awsid[row+1]),
            .h_awdid_o  (h_awdid[row+1]),
            .h_awchan_o (h_awchan[row+1]),
            .h_awvalid_o(h_awvalid[row+1]),
            .h_awready_i(h_awready[row+1]),
            .h_wsid_o   (h_wsid[row+1]),
            .h_wdid_o   (h_wdid[row+1]),
            .h_wchan_o  (h_wchan[row+1]),
            .h_wvalid_o (h_wvalid[row+1]),
            .h_wready_i (h_wready[row+1]),
            .h_bdid_o   (h_bdid[row+1]),
            .h_bchan_o  (h_bchan[row+1]),
            .h_bvalid_o (h_bvalid[row+1]),
            .h_bready_i (h_bready[row+1]),
            .h_ardid_o  (h_ardid[row+1]),
            .h_archan_o (h_archan[row+1]),
            .h_arvalid_o(h_arvalid[row+1]),
            .h_arready_i(h_arready[row+1]),
            .h_rdid_o   (h_rdid[row+1]),
            .h_rchan_o  (h_rchan[row+1]),
            .h_rvalid_o (h_rvalid[row+1]),
            .h_rready_i (h_rready[row+1]),
            .v_awsid_o  (v_awsid[col+1]),
            .v_awdid_o  (v_awdid[col+1]),
            .v_awchan_o (v_awchan[col+1]),
            .v_awvalid_o(v_awvalid[col+1]),
            .v_awready_i(v_awready[col+1]),
            .v_wsid_o   (v_wsid[col+1]),
            .v_wdid_o   (v_wdid[col+1]),
            .v_wchan_o  (v_wchan[col+1]),
            .v_wvalid_o (v_wvalid[col+1]),
            .v_wready_i (v_wready[col+1]),
            .v_bdid_o   (v_bdid[col+1]),
            .v_bchan_o  (v_bchan[col+1]),
            .v_bvalid_o (v_bvalid[col+1]),
            .v_bready_i (v_bready[col+1]),
            .v_ardid_o  (v_ardid[col+1]),
            .v_archan_o (v_archan[col+1]),
            .v_arvalid_o(v_arvalid[col+1]),
            .v_arready_i(v_arready[col+1]),
            .v_rdid_o   (v_rdid[col+1]),
            .v_rchan_o  (v_rchan[col+1]),
            .v_rvalid_o (v_rvalid[col+1]),
            .v_rready_i (v_rready[col+1])
        );
        ////////////////////////////////////////////////////////////
      end
    end
  end

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-INITIAL CHECKS
  //////////////////////////////////////////////////////////////////////////////////////////////////

`ifdef SIMULATION
  string instance_name = $sformatf("%m");
  initial begin
    string grid_index;
    bit is_fatal;
    bit mni_found[NUM_MNI];
    bit sni_found[NUM_SNI];

    $sformat(grid_index, "\033[7;36m%s grid index:\033[0m", instance_name);
    for (int row = 0; row < NUM_ROW; row++) begin
      for (int col = 0; col < NUM_COL; col++) begin
        if (col == 0) $sformat(grid_index, "%s\n\033[7;36m:\033[0m\t", grid_index);
        else $sformat(grid_index, "%s\t", grid_index);

        if ((MNI_INDEX[row][col] == -1) && (SNI_INDEX[row][col] == -1)) begin
          $sformat(grid_index, "%s-", grid_index);
        end else if ((MNI_INDEX[row][col] != -1) && (SNI_INDEX[row][col] == -1)) begin
          $sformat(grid_index, "%s\033[1;35mMNI%0d\033[0m", grid_index, MNI_INDEX[row][col]);
        end else if ((MNI_INDEX[row][col] == -1) && (SNI_INDEX[row][col] != -1)) begin
          $sformat(grid_index, "%s\033[1;32mSNI%0d\033[0m", grid_index, SNI_INDEX[row][col]);
        end else begin
          $sformat(grid_index, "%s\033[1;31mMNI%0d SNI%0d\033[0m", grid_index, MNI_INDEX[row][col],
                   SNI_INDEX[row][col]);
          is_fatal = 1;
        end
      end
    end

    $display(grid_index);

    if (is_fatal) $fatal(1, "\033[1;31mINDEX POSITION CONFLICT\033[0m");

    foreach (MNI_INDEX[i, j]) begin
      if (MNI_INDEX[i][j] != -1) begin
        if (MNI_INDEX[i][j] < NUM_MNI) begin
          if (mni_found[MNI_INDEX[i][j]] == 0) mni_found[MNI_INDEX[i][j]] = 1;
          else begin
            is_fatal = 1;
            $display("\033[1;31mMNI%0d already used\033[0m", MNI_INDEX[i][j]);
          end
        end else begin
          $display("\033[1;31mMNI%0d is out of range\033[0m", MNI_INDEX[i][j]);
        end
      end
    end
    foreach (SNI_INDEX[i, j]) begin
      if (SNI_INDEX[i][j] != -1) begin
        if (SNI_INDEX[i][j] < NUM_SNI) begin
          if (sni_found[SNI_INDEX[i][j]] == 0) sni_found[SNI_INDEX[i][j]] = 1;
          else begin
            is_fatal = 1;
            $display("\033[1;31mSNI%0d already used\033[0m", SNI_INDEX[i][j]);
          end
        end else begin
          $display("\033[1;31mSNI%0d is out of range\033[0m", SNI_INDEX[i][j]);
        end
      end
    end

    if (is_fatal) $fatal(1, "\033[1;31mINDEX CONFLICT\033[0m");

    foreach (mni_found[i])
    if (mni_found[i] == 0) $fatal(1, "\033[1;31mINDEX MNI%0d MISSING\033[0m", i);
    foreach (sni_found[i])
    if (sni_found[i] == 0) $fatal(1, "\033[1;31mINDEX SNI%0d MISSING\033[0m", i);

    if (($bits(sni_req_i[0].ar.id) + $clog2(NUM_SNI)) > $bits(mni_req_o[0].ar.id)) begin
      $fatal(1, "\033[1;31mINCOMPATIBLE ID WIDTHS. NUM_SNI:%0d SNI_IRW:%0d MNI_IRW:%0d\033[0m",
             NUM_SNI, $bits(sni_req_i[0].ar.id), $bits(mni_req_o[0].ar.id));
    end

    if (($bits(sni_req_i[0].aw.id) + $clog2(NUM_SNI)) > $bits(mni_req_o[0].aw.id)) begin
      $fatal(1, "\033[1;31mINCOMPATIBLE ID WIDTHS. NUM_SNI:%0d SNI_IWW:%0d MNI_IWW:%0d\033[0m",
             NUM_SNI, $bits(sni_req_i[0].aw.id), $bits(mni_req_o[0].aw.id));
    end

    if ($bits(sni_req_i[0].ar.addr) > $bits(mni_req_o[0].ar.addr)) begin
      $fatal(1, "\033[1;31mINCOMPATIBLE ADDR WIDTHS. SNI_AW:%0d MNI_AW:%0d\033[0m",
             $bits(sni_req_i[0].ar.addr), $bits(mni_req_o[0].ar.addr));
    end

    if ($bits(sni_resp_o[0].r.data) > $bits(mni_resp_i[0].r.data)) begin
      $fatal(1, "\033[1;31mINCOMPATIBLE DATA WIDTHS. SNI_DW:%0d MNI_DW:%0d\033[0m",
             $bits(sni_resp_o[0].r.data), $bits(mni_resp_i[0].r.data));
    end

    if ($bits(sni_req_i[0].aw.user) > $bits(mni_req_o[0].aw.user)) begin
      $fatal(1, "\033[1;31mINCOMPATIBLE USER WIDTHS. SNI_UREQW:%0d MNI_UREQW:%0d\033[0m",
             $bits(sni_req_i[0].aw.user), $bits(mni_req_o[0].aw.user));
    end

    if ($bits(sni_req_i[0].w.user) > $bits(mni_req_o[0].w.user)) begin
      $fatal(1, "\033[1;31mINCOMPATIBLE USER WIDTHS. SNI_UDTAW:%0d MNI_UDTAW:%0d\033[0m",
             $bits(sni_req_i[0].w.user), $bits(mni_req_o[0].w.user));
    end

    if ($bits(sni_resp_o[0].b.user) > $bits(mni_resp_i[0].b.user)) begin
      $fatal(1, "\033[1;31mINCOMPATIBLE USER WIDTHS. SNI_URSPW:%0d MNI_URSPW:%0d\033[0m",
             $bits(sni_resp_o[0].b.user), $bits(mni_resp_i[0].b.user));
    end

  end
`endif  // SIMULATION

endmodule
