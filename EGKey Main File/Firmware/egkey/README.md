EGKey QMK scaffold
===================

This folder contains a minimal QMK keyboard scaffold for the EGKey PCB.

Important: This scaffold uses placeholder pin mappings. Replace `MATRIX_ROW_PINS` and
`MATRIX_COL_PINS` in `config.h` with the actual pins from your PCB before building.

Quick steps to build and flash (recommended: use WSL or QMK MSYS):

1. Copy this folder into your QMK firmware repo under `keyboards/egkey`:

   - `qmk_firmware/keyboards/egkey`

2. Install QMK build environment (see https://docs.qmk.fm)

3. From the qmk_firmware root (WSL / MSYS):

   ```powershell
   qmk compile -kb egkey -km default
   ```

4. To flash using QMK CLI (replace COM3 with your Pro Micro port):

   ```powershell
   qmk flash -kb egkey -km default -p COM3
   ```

Or use QMK Toolbox: build a `.hex` then open QMK Toolbox, put your Pro Micro into
bootloader (double-tap reset or short RST to GND), then load the hex and flash.


