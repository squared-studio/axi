`ifndef AXI_GRID_MACROS_SVH
`define AXI_GRID_MACROS_SVH

`define AXI_GRID_MODULE_PORTS                                                                     \
                                                                                                  \
  input  grid_id_t      h_awsid_i,                                                                \
  input  grid_id_t      h_awdid_i,                                                                \
  input  grid_aw_chan_t h_awchan_i,                                                               \
  input  logic          h_awvalid_i,                                                              \
  output logic          h_awready_o,                                                              \
  input  grid_id_t      h_wsid_i,                                                                 \
  input  grid_id_t      h_wdid_i,                                                                 \
  input  grid_w_chan_t  h_wchan_i,                                                                \
  input  logic          h_wvalid_i,                                                               \
  output logic          h_wready_o,                                                               \
  input  grid_id_t      h_bdid_i,                                                                 \
  input  grid_b_chan_t  h_bchan_i,                                                                \
  input  logic          h_bvalid_i,                                                               \
  output logic          h_bready_o,                                                               \
  input  grid_id_t      h_ardid_i,                                                                \
  input  grid_ar_chan_t h_archan_i,                                                               \
  input  logic          h_arvalid_i,                                                              \
  output logic          h_arready_o,                                                              \
  input  grid_id_t      h_rdid_i,                                                                 \
  input  grid_r_chan_t  h_rchan_i,                                                                \
  input  logic          h_rvalid_i,                                                               \
  output logic          h_rready_o,                                                               \
                                                                                                  \
  input  grid_id_t      v_awsid_i,                                                                \
  input  grid_id_t      v_awdid_i,                                                                \
  input  grid_aw_chan_t v_awchan_i,                                                               \
  input  logic          v_awvalid_i,                                                              \
  output logic          v_awready_o,                                                              \
  input  grid_id_t      v_wsid_i,                                                                 \
  input  grid_id_t      v_wdid_i,                                                                 \
  input  grid_w_chan_t  v_wchan_i,                                                                \
  input  logic          v_wvalid_i,                                                               \
  output logic          v_wready_o,                                                               \
  input  grid_id_t      v_bdid_i,                                                                 \
  input  grid_b_chan_t  v_bchan_i,                                                                \
  input  logic          v_bvalid_i,                                                               \
  output logic          v_bready_o,                                                               \
  input  grid_id_t      v_ardid_i,                                                                \
  input  grid_ar_chan_t v_archan_i,                                                               \
  input  logic          v_arvalid_i,                                                              \
  output logic          v_arready_o,                                                              \
  input  grid_id_t      v_rdid_i,                                                                 \
  input  grid_r_chan_t  v_rchan_i,                                                                \
  input  logic          v_rvalid_i,                                                               \
  output logic          v_rready_o,                                                               \
                                                                                                  \
  output grid_id_t      h_awsid_o,                                                                \
  output grid_id_t      h_awdid_o,                                                                \
  output grid_aw_chan_t h_awchan_o,                                                               \
  output logic          h_awvalid_o,                                                              \
  input  logic          h_awready_i,                                                              \
  output grid_id_t      h_wsid_o,                                                                 \
  output grid_id_t      h_wdid_o,                                                                 \
  output grid_w_chan_t  h_wchan_o,                                                                \
  output logic          h_wvalid_o,                                                               \
  input  logic          h_wready_i,                                                               \
  output grid_id_t      h_bdid_o,                                                                 \
  output grid_b_chan_t  h_bchan_o,                                                                \
  output logic          h_bvalid_o,                                                               \
  input  logic          h_bready_i,                                                               \
  output grid_id_t      h_ardid_o,                                                                \
  output grid_ar_chan_t h_archan_o,                                                               \
  output logic          h_arvalid_o,                                                              \
  input  logic          h_arready_i,                                                              \
  output grid_id_t      h_rdid_o,                                                                 \
  output grid_r_chan_t  h_rchan_o,                                                                \
  output logic          h_rvalid_o,                                                               \
  input  logic          h_rready_i,                                                               \
                                                                                                  \
  output grid_id_t      v_awsid_o,                                                                \
  output grid_id_t      v_awdid_o,                                                                \
  output grid_aw_chan_t v_awchan_o,                                                               \
  output logic          v_awvalid_o,                                                              \
  input  logic          v_awready_i,                                                              \
  output grid_id_t      v_wsid_o,                                                                 \
  output grid_id_t      v_wdid_o,                                                                 \
  output grid_w_chan_t  v_wchan_o,                                                                \
  output logic          v_wvalid_o,                                                               \
  input  logic          v_wready_i,                                                               \
  output grid_id_t      v_bdid_o,                                                                 \
  output grid_b_chan_t  v_bchan_o,                                                                \
  output logic          v_bvalid_o,                                                               \
  input  logic          v_bready_i,                                                               \
  output grid_id_t      v_ardid_o,                                                                \
  output grid_ar_chan_t v_archan_o,                                                               \
  output logic          v_arvalid_o,                                                              \
  input  logic          v_arready_i,                                                              \
  output grid_id_t      v_rdid_o,                                                                 \
  output grid_r_chan_t  v_rchan_o,                                                                \
  output logic          v_rvalid_o,                                                               \
  input  logic          v_rready_i                                                                \


`define AXI_GRID_CONNECT(__ROW__, __COL__)                                                        \
                                                                                                  \
  .h_awsid_i   ( h_awsid   [``__ROW__``] ),                                                       \
  .h_awdid_i   ( h_awdid   [``__ROW__``] ),                                                       \
  .h_awchan_i  ( h_awchan  [``__ROW__``] ),                                                       \
  .h_awvalid_i ( h_awvalid [``__ROW__``] ),                                                       \
  .h_awready_o ( h_awready [``__ROW__``] ),                                                       \
  .h_wsid_i    ( h_wsid    [``__ROW__``] ),                                                       \
  .h_wdid_i    ( h_wdid    [``__ROW__``] ),                                                       \
  .h_wchan_i   ( h_wchan   [``__ROW__``] ),                                                       \
  .h_wvalid_i  ( h_wvalid  [``__ROW__``] ),                                                       \
  .h_wready_o  ( h_wready  [``__ROW__``] ),                                                       \
  .h_bdid_i    ( h_bdid    [``__ROW__``] ),                                                       \
  .h_bchan_i   ( h_bchan   [``__ROW__``] ),                                                       \
  .h_bvalid_i  ( h_bvalid  [``__ROW__``] ),                                                       \
  .h_bready_o  ( h_bready  [``__ROW__``] ),                                                       \
  .h_ardid_i   ( h_ardid   [``__ROW__``] ),                                                       \
  .h_archan_i  ( h_archan  [``__ROW__``] ),                                                       \
  .h_arvalid_i ( h_arvalid [``__ROW__``] ),                                                       \
  .h_arready_o ( h_arready [``__ROW__``] ),                                                       \
  .h_rdid_i    ( h_rdid    [``__ROW__``] ),                                                       \
  .h_rchan_i   ( h_rchan   [``__ROW__``] ),                                                       \
  .h_rvalid_i  ( h_rvalid  [``__ROW__``] ),                                                       \
  .h_rready_o  ( h_rready  [``__ROW__``] ),                                                       \
                                                                                                  \
  .v_awsid_i   ( v_awsid   [``__COL__``] ),                                                       \
  .v_awdid_i   ( v_awdid   [``__COL__``] ),                                                       \
  .v_awchan_i  ( v_awchan  [``__COL__``] ),                                                       \
  .v_awvalid_i ( v_awvalid [``__COL__``] ),                                                       \
  .v_awready_o ( v_awready [``__COL__``] ),                                                       \
  .v_wsid_i    ( v_wsid    [``__COL__``] ),                                                       \
  .v_wdid_i    ( v_wdid    [``__COL__``] ),                                                       \
  .v_wchan_i   ( v_wchan   [``__COL__``] ),                                                       \
  .v_wvalid_i  ( v_wvalid  [``__COL__``] ),                                                       \
  .v_wready_o  ( v_wready  [``__COL__``] ),                                                       \
  .v_bdid_i    ( v_bdid    [``__COL__``] ),                                                       \
  .v_bchan_i   ( v_bchan   [``__COL__``] ),                                                       \
  .v_bvalid_i  ( v_bvalid  [``__COL__``] ),                                                       \
  .v_bready_o  ( v_bready  [``__COL__``] ),                                                       \
  .v_ardid_i   ( v_ardid   [``__COL__``] ),                                                       \
  .v_archan_i  ( v_archan  [``__COL__``] ),                                                       \
  .v_arvalid_i ( v_arvalid [``__COL__``] ),                                                       \
  .v_arready_o ( v_arready [``__COL__``] ),                                                       \
  .v_rdid_i    ( v_rdid    [``__COL__``] ),                                                       \
  .v_rchan_i   ( v_rchan   [``__COL__``] ),                                                       \
  .v_rvalid_i  ( v_rvalid  [``__COL__``] ),                                                       \
  .v_rready_o  ( v_rready  [``__COL__``] ),                                                       \
                                                                                                  \
  .h_awsid_o   ( h_awsid   [``__ROW__`` + 1] ),                                                   \
  .h_awdid_o   ( h_awdid   [``__ROW__`` + 1] ),                                                   \
  .h_awchan_o  ( h_awchan  [``__ROW__`` + 1] ),                                                   \
  .h_awvalid_o ( h_awvalid [``__ROW__`` + 1] ),                                                   \
  .h_awready_i ( h_awready [``__ROW__`` + 1] ),                                                   \
  .h_wsid_o    ( h_wsid    [``__ROW__`` + 1] ),                                                   \
  .h_wdid_o    ( h_wdid    [``__ROW__`` + 1] ),                                                   \
  .h_wchan_o   ( h_wchan   [``__ROW__`` + 1] ),                                                   \
  .h_wvalid_o  ( h_wvalid  [``__ROW__`` + 1] ),                                                   \
  .h_wready_i  ( h_wready  [``__ROW__`` + 1] ),                                                   \
  .h_bdid_o    ( h_bdid    [``__ROW__`` + 1] ),                                                   \
  .h_bchan_o   ( h_bchan   [``__ROW__`` + 1] ),                                                   \
  .h_bvalid_o  ( h_bvalid  [``__ROW__`` + 1] ),                                                   \
  .h_bready_i  ( h_bready  [``__ROW__`` + 1] ),                                                   \
  .h_ardid_o   ( h_ardid   [``__ROW__`` + 1] ),                                                   \
  .h_archan_o  ( h_archan  [``__ROW__`` + 1] ),                                                   \
  .h_arvalid_o ( h_arvalid [``__ROW__`` + 1] ),                                                   \
  .h_arready_i ( h_arready [``__ROW__`` + 1] ),                                                   \
  .h_rdid_o    ( h_rdid    [``__ROW__`` + 1] ),                                                   \
  .h_rchan_o   ( h_rchan   [``__ROW__`` + 1] ),                                                   \
  .h_rvalid_o  ( h_rvalid  [``__ROW__`` + 1] ),                                                   \
  .h_rready_i  ( h_rready  [``__ROW__`` + 1] ),                                                   \
                                                                                                  \
  .v_awsid_o   ( v_awsid   [``__COL__`` + 1] ),                                                   \
  .v_awdid_o   ( v_awdid   [``__COL__`` + 1] ),                                                   \
  .v_awchan_o  ( v_awchan  [``__COL__`` + 1] ),                                                   \
  .v_awvalid_o ( v_awvalid [``__COL__`` + 1] ),                                                   \
  .v_awready_i ( v_awready [``__COL__`` + 1] ),                                                   \
  .v_wsid_o    ( v_wsid    [``__COL__`` + 1] ),                                                   \
  .v_wdid_o    ( v_wdid    [``__COL__`` + 1] ),                                                   \
  .v_wchan_o   ( v_wchan   [``__COL__`` + 1] ),                                                   \
  .v_wvalid_o  ( v_wvalid  [``__COL__`` + 1] ),                                                   \
  .v_wready_i  ( v_wready  [``__COL__`` + 1] ),                                                   \
  .v_bdid_o    ( v_bdid    [``__COL__`` + 1] ),                                                   \
  .v_bchan_o   ( v_bchan   [``__COL__`` + 1] ),                                                   \
  .v_bvalid_o  ( v_bvalid  [``__COL__`` + 1] ),                                                   \
  .v_bready_i  ( v_bready  [``__COL__`` + 1] ),                                                   \
  .v_ardid_o   ( v_ardid   [``__COL__`` + 1] ),                                                   \
  .v_archan_o  ( v_archan  [``__COL__`` + 1] ),                                                   \
  .v_arvalid_o ( v_arvalid [``__COL__`` + 1] ),                                                   \
  .v_arready_i ( v_arready [``__COL__`` + 1] ),                                                   \
  .v_rdid_o    ( v_rdid    [``__COL__`` + 1] ),                                                   \
  .v_rchan_o   ( v_rchan   [``__COL__`` + 1] ),                                                   \
  .v_rvalid_o  ( v_rvalid  [``__COL__`` + 1] ),                                                   \
  .v_rready_i  ( v_rready  [``__COL__`` + 1] )                                                    \


`define AXI_GRID_VH_JOIN_SPLIT_INST(__CHAN__)                                                     \
                                                                                                  \
  axi_grid_vh_join #(                                                                             \
    .grid_id_t(grid_id_t),                                                                        \
    .chan_t(grid_``__CHAN__``_chan_t)                                                             \
  ) u_axi_grid_vh_join_``__CHAN__`` (                                                             \
    .clk_i(clk_i),                                                                                \
    .arst_ni(arst_ni),                                                                            \
    .v_did_i(v_``__CHAN__``did_i),                                                                \
    .v_sid_i(v_``__CHAN__``sid_i),                                                                \
    .v_chan_i(v_``__CHAN__``chan_i),                                                              \
    .v_valid_i(v_``__CHAN__``valid_i),                                                            \
    .v_ready_o(v_``__CHAN__``ready_o),                                                            \
    .h_did_i(h_``__CHAN__``did_i),                                                                \
    .h_sid_i(h_``__CHAN__``sid_i),                                                                \
    .h_chan_i(h_``__CHAN__``chan_i),                                                              \
    .h_valid_i(h_``__CHAN__``valid_i),                                                            \
    .h_ready_o(h_``__CHAN__``ready_o),                                                            \
    .did_o(``__CHAN__``did_i),                                                                    \
    .sid_o(``__CHAN__``sid_i),                                                                    \
    .chan_o(``__CHAN__``chan_i),                                                                  \
    .valid_o(``__CHAN__``valid_i),                                                                \
    .ready_i(``__CHAN__``ready_o)                                                                 \
  );                                                                                              \
                                                                                                  \
  axi_grid_vh_split #(                                                                            \
    .grid_id_t(grid_id_t),                                                                        \
    .chan_t(grid_``__CHAN__``_chan_t),                                                            \
    .NI_ID(NI_ID)                                                                                 \
  ) u_axi_grid_vh_split_``__CHAN__`` (                                                            \
    .did_i(``__CHAN__``did_o),                                                                    \
    .sid_i(``__CHAN__``sid_o),                                                                    \
    .chan_i(``__CHAN__``chan_o),                                                                  \
    .valid_i(``__CHAN__``valid_o),                                                                \
    .ready_o(``__CHAN__``ready_i),                                                                \
    .v_did_o(v_``__CHAN__``did_o),                                                                \
    .v_sid_o(v_``__CHAN__``sid_o),                                                                \
    .v_chan_o(v_``__CHAN__``chan_o),                                                              \
    .v_valid_o(v_``__CHAN__``valid_o),                                                            \
    .v_ready_i(v_``__CHAN__``ready_i),                                                            \
    .h_did_o(h_``__CHAN__``did_o),                                                                \
    .h_sid_o(h_``__CHAN__``sid_o),                                                                \
    .h_chan_o(h_``__CHAN__``chan_o),                                                              \
    .h_valid_o(h_``__CHAN__``valid_o),                                                            \
    .h_ready_i(h_``__CHAN__``ready_i)                                                             \
  );                                                                                              \


`define AXI_GRID_VH_JOIN_SPLIT_INST_FULL                                                          \
                                                                                                  \
  grid_id_t      awdid_i;                                                                         \
  grid_id_t      awsid_i;                                                                         \
  grid_aw_chan_t awchan_i;                                                                        \
  logic          awvalid_i;                                                                       \
  logic          awready_o;                                                                       \
  grid_id_t      wdid_i;                                                                          \
  grid_id_t      wsid_i;                                                                          \
  grid_w_chan_t  wchan_i;                                                                         \
  logic          wvalid_i;                                                                        \
  logic          wready_o;                                                                        \
  grid_id_t      bdid_i;                                                                          \
  grid_id_t      bsid_i = '0;                                                                     \
  grid_b_chan_t  bchan_i;                                                                         \
  logic          bvalid_i;                                                                        \
  logic          bready_o;                                                                        \
  grid_id_t      ardid_i;                                                                         \
  grid_id_t      arsid_i = '0;                                                                    \
  grid_ar_chan_t archan_i;                                                                        \
  logic          arvalid_i;                                                                       \
  logic          arready_o;                                                                       \
  grid_id_t      rdid_i;                                                                          \
  grid_id_t      rsid_i = '0;                                                                     \
  grid_r_chan_t  rchan_i;                                                                         \
  logic          rvalid_i;                                                                        \
  logic          rready_o;                                                                        \
                                                                                                  \
  grid_id_t      awdid_o;                                                                         \
  grid_id_t      awsid_o;                                                                         \
  grid_aw_chan_t awchan_o;                                                                        \
  logic          awvalid_o;                                                                       \
  logic          awready_i;                                                                       \
  grid_id_t      wdid_o;                                                                          \
  grid_id_t      wsid_o;                                                                          \
  grid_w_chan_t  wchan_o;                                                                         \
  logic          wvalid_o;                                                                        \
  logic          wready_i;                                                                        \
  grid_id_t      bdid_o;                                                                          \
  grid_id_t      bsid_o;                                                                          \
  grid_b_chan_t  bchan_o;                                                                         \
  logic          bvalid_o;                                                                        \
  logic          bready_i;                                                                        \
  grid_id_t      ardid_o;                                                                         \
  grid_id_t      arsid_o;                                                                         \
  grid_ar_chan_t archan_o;                                                                        \
  logic          arvalid_o;                                                                       \
  logic          arready_i;                                                                       \
  grid_id_t      rdid_o;                                                                          \
  grid_id_t      rsid_o;                                                                          \
  grid_r_chan_t  rchan_o;                                                                         \
  logic          rvalid_o;                                                                        \
  logic          rready_i;                                                                        \
                                                                                                  \
  `AXI_GRID_VH_JOIN_SPLIT_INST(aw)                                                                \
  `AXI_GRID_VH_JOIN_SPLIT_INST(w)                                                                 \
  `AXI_GRID_VH_JOIN_SPLIT_INST(b)                                                                 \
  `AXI_GRID_VH_JOIN_SPLIT_INST(ar)                                                                \
  `AXI_GRID_VH_JOIN_SPLIT_INST(r)                                                                 \



`endif
