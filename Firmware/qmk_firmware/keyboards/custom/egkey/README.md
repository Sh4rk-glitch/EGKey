EGKey QMK scaffold
===================

This folder contains a minimal QMK keyboard scaffold for the EGKey PCB.

Important: This scaffold uses placeholder pin mappings. Replace `MATRIX_ROW_PINS` and
`MATRIX_COL_PINS` in `config.h` with the actual pins from your PCB before building.

Quick steps to build and flash (recommended: use WSL or QMK MSYS):

1. From the qmk_firmware root (WSL / MSYS):

   ```powershell
   qmk compile -kb custom/egkey -km default
   ```

2. To flash using QMK CLI (replace COM3 with your Pro Micro port):

   ```powershell
   qmk flash -kb custom/egkey -km default -p COM3
   ```

Or use QMK Toolbox: build a `.hex` then open QMK Toolbox, put your Pro Micro into
bootloader (double-tap reset or short RST to GND), then load the hex and flash.
