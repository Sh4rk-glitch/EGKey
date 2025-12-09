EGKey QMK scaffold
===================

This folder contains a minimal QMK keyboard scaffold for the EGKey PCB.

Important: This scaffold uses conservative pin mappings to allow an initial
build. Verify `MATRIX_ROW_PINS` and `MATRIX_COL_PINS` in `config.h` against
your schematic and KiCad before using the board in production.

Quick steps to build and flash (recommended: use WSL or QMK MSYS):

1. From the qmk_firmware root (WSL / MSYS):

   ```bash
   qmk compile -kb egkey -km dm9records_ergoinu_layout_2025-12-07
   ```

2. To flash using QMK CLI (replace COM3 with your Pro Micro port):

   ```powershell
   qmk flash -kb egkey -km dm9records_ergoinu_layout_2025-12-07 -p COM3
   ```

Or use QMK Toolbox: build a `.hex` then open QMK Toolbox, put your Pro Micro into
bootloader (double-tap reset or short RST to GND), then load the hex and flash.
