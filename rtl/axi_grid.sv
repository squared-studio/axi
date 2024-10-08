/*
Write a markdown documentation for this systemverilog module:
Author : Foez Ahmed (foez.official@gmail.com)
*/

`include "addr_map.svh"

module axi_grid #(
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
  //-LOCALPARAMS GENERATED
  //////////////////////////////////////////////////////////////////////////////////////////////////

  for (genvar row = 0; row < NUM_ROW; row++) begin : gen_row
    for (genvar col = 0; col < NUM_COL; col++) begin : gen_col
      if (MNI_INDEX[row][col] != -1) begin : gen_mni
        axi_grid_mni #(
            .req_t (mni_req_t),
            .resp_t(mni_resp_t)
        ) u_ni (
            .clk_i,
            .arst_ni,
            .req_o (mni_req_o[MNI_INDEX[row][col]]),
            .resp_i(mni_resp_i[MNI_INDEX[row][col]])
        );
      end else if (SNI_INDEX[row][col] != -1) begin : gen_sni
        axi_grid_sni #(
            .req_t (sni_req_t),
            .resp_t(sni_resp_t)
        ) u_ni (
            .clk_i,
            .arst_ni,
            .req_i (sni_req_i[SNI_INDEX[row][col]]),
            .resp_o(sni_resp_o[SNI_INDEX[row][col]])
        );
      end else begin : gen_xni
        axi_grid_xni #() u_ni (
            .clk_i,
            .arst_ni
        );
      end
    end
  end

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-TYPEDEFS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-SIGNALS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-ASSIGNMENTS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-RTLS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-METHODS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-SEQUENTIALS
  //////////////////////////////////////////////////////////////////////////////////////////////////

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
          $sformat(grid_index, "%s\033[1;35mM%0d\033[0m", grid_index, MNI_INDEX[row][col]);
        end else if ((MNI_INDEX[row][col] == -1) && (SNI_INDEX[row][col] != -1)) begin
          $sformat(grid_index, "%s\033[1;32mS%0d\033[0m", grid_index, SNI_INDEX[row][col]);
        end else begin
          $sformat(grid_index, "%s\033[1;31mM%0d S%0d\033[0m", grid_index, MNI_INDEX[row][col],
                   SNI_INDEX[row][col]);
          is_fatal = 1;
        end
      end
    end

    $display(grid_index);

    if (is_fatal) $fatal(1, "INDEX POSITION CONFLICT");

    foreach (MNI_INDEX[i, j]) begin
      if (MNI_INDEX[i][j] != -1) begin
        if (MNI_INDEX[i][j] < NUM_MNI) begin
          if (mni_found[MNI_INDEX[i][j]] == 0) mni_found[MNI_INDEX[i][j]] = 1;
          else begin
            is_fatal = 1;
            $display("\033[1;31mM%0d already used\033[0m", MNI_INDEX[i][j]);
          end
        end else begin
          $display("\033[1;31mM%0d is out of range\033[0m", MNI_INDEX[i][j]);
        end
      end
    end
    foreach (SNI_INDEX[i, j]) begin
      if (SNI_INDEX[i][j] != -1) begin
        if (SNI_INDEX[i][j] < NUM_SNI) begin
          if (sni_found[SNI_INDEX[i][j]] == 0) sni_found[SNI_INDEX[i][j]] = 1;
          else begin
            is_fatal = 1;
            $display("\033[1;31mS%0d already used\033[0m", SNI_INDEX[i][j]);
          end
        end else begin
          $display("\033[1;31mS%0d is out of range\033[0m", SNI_INDEX[i][j]);
        end
      end
    end

    if (is_fatal) $fatal(1, "INDEX CONFLICT");

    foreach (mni_found[i]) if (mni_found[i] == 0) $fatal(1, "INDEX M%0d MISSING", i);
    foreach (sni_found[i]) if (sni_found[i] == 0) $fatal(1, "INDEX S%0d MISSING", i);

  end
`endif  // SIMULATION

endmodule
