// Author : Foez Ahmed (foez.official@gmail.com)
// This file is part of squared-studio:axi
// Copyright (c) 2024 squared-studio
// Licensed under the MIT License
// See LICENSE file in the project root for full license information

`ifndef AXI_DEFAULT_PARAM_PKG_SV
`define AXI_DEFAULT_PARAM_PKG_SV 1

package axi_default_param_pkg;

  `include "axi4l_typedef.svh"
  parameter int AXI4L_ADDR_WIDTH = 32;
  parameter int AXI4L_DATA_WIDTH = 64;
  `AXI4L_T(axi4l, AXI4L_ADDR_WIDTH, AXI4L_DATA_WIDTH)

  `include "axi4_typedef.svh"
  `AXI4_T(sni, 64, 1024, 2, 2, 2, 2, 2)
  `AXI4_T(mni, 64, 1024, 4, 4, 2, 2, 2)

  typedef struct packed {
    logic [1:0] h;
    logic [1:0] v;
  } grid_id_t;
  `AXI4_T(grid, 64, 1024, 4, 4, 2, 2, 2)

endpackage

`endif
