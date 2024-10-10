# axi_grid_vh_join (module)

### Author : Foez Ahmed (foez.official@gmail.com)

## TOP IO
<img src="./axi_grid_vh_join_top.svg">

## Description

The `axi_grid_vh_join` module is designed to join vertical and horizontal channels in an AXI grid.
It prioritizes the vertical channel over the horizontal channel based on the `prioritize_v` signal.

## Parameters
|Name|Type|Dimension|Default Value|Description|
|-|-|-|-|-|
|grid_id_t|type||axi_default_param_pkg::grid_id_t|Type for grid ID|
|chan_t|type||axi_default_param_pkg::grid_id_t|Type for channel|
|NI_ID|grid_id_t||'0|Network Interface ID|

## Ports
|Name|Direction|Type|Dimension|Description|
|-|-|-|-|-|
|clk_i|input|logic||Clock input|
|arst_ni|input|logic||Asynchronous reset (active low)|
|v_did_i|input|grid_id_t||Vertical destination ID|
|v_sid_i|input|grid_id_t||Vertical source ID|
|v_chan_i|input|chan_t||Vertical channel|
|v_valid_i|input|logic||Vertical valid signal|
|v_ready_o|output|logic||Vertical ready signal|
|h_did_i|input|grid_id_t||Horizontal destination ID|
|h_sid_i|input|grid_id_t||Horizontal source ID|
|h_chan_i|input|chan_t||Horizontal channel|
|h_valid_i|input|logic||Horizontal valid signal|
|h_ready_o|output|logic||Horizontal ready signal|
|did_o|output|grid_id_t||Output destination ID|
|sid_o|output|grid_id_t||Output source ID|
|chan_o|output|chan_t||Output channel|
|valid_o|output|logic||Output valid signal|
|ready_i|input|logic||Input ready signal|
