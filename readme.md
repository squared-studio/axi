# SystemVerilog IP Design & Verification

## Repository Structure
The repository is structured into several directories, each with a distinct role:

- **docs**: Contains all the documentation files.

- **inc**: Houses include files, which are incorporated into other SystemVerilog files using the ``` `include``` directive. These files, which may or may not be part of the RTL, are further categorized into folders based on their protocol or use case. **Note that this does not include certain include files located in the Testbench directory.**

- **intf**: Stores SystemVerilog interfaces, which are recommended solely for verification purposes and not for RTL design. We favor structured IOs for requests and responses to facilitate connections, as opposed to using interfaces.

- **rtl**: This is where all the design source files are located.

- **sub**: Contains all git repository submodules. **Please note the submodule files that do not belong to `Squared-Studio sv-genesis` files structure are not compiled automatically. They must be manually added in the compile order within the **`config/*/xvlog`** for each Testbench (TB). **`config/*/xvlog`** file is auto-generated next to the TB top file.**

- **tb**: All the Testbenches (TBs) are stored here. Each TB should be in a separate directory that corresponds to the name of the Device Under Test (DUT) module, suffixed with `_tb`. The Testbenches are utilized to verify the design functionality under various scenarios.

## How-to
To know how to use different commands on this repo, type `make help` or just `make` at the repo root and further details with be printed on the terminal.

## RTL
[axi4l_gpio ](./docs/rtl/axi4l_gpio.md)<br>
[axi_fifo ](./docs/rtl/axi_fifo.md)<br>
[axi_grid ](./docs/rtl/axi_grid.md)<br>
[axi_grid_mni ](./docs/rtl/axi_grid_mni.md)<br>
[axi_grid_sni ](./docs/rtl/axi_grid_sni.md)<br>
[axi_grid_vh_join ](./docs/rtl/axi_grid_vh_join.md)<br>
[axi_grid_vh_split ](./docs/rtl/axi_grid_vh_split.md)<br>
[axi_grid_xni ](./docs/rtl/axi_grid_xni.md)<br>

## INCLUDE
[axi4l_typedef.svh](./docs/inc/axi4l_typedef.svh.md)<br>
[axi4_typedef.svh](./docs/inc/axi4_typedef.svh.md)<br>
[vip/axi4l_pkg.sv](./docs/inc/vip/axi4l_pkg.sv.md)<br>

