#pragma once

/*
 * EGKey config.h
 * Matrix and pin mapping set from the Pro Micro pad -> MCU mapping you provided.
 */

#define VENDOR_ID       0xFEED
#define PRODUCT_ID      0x0001
#define DEVICE_VER      0x0001
#define MANUFACTURER    Shourya Mishra
#define PRODUCT         EGKey

#define MATRIX_ROWS 10
#define MATRIX_COLS 6

/*
 * Pin mapping (converted to QMK pin tokens):
 * - Columns (col0..col5): P14, P16, P10, P7, P8, P9
 * - Rows (row0..row9): P21, P20, P19, P18, P15, P01, P00, P04, P05, P06
 *
 * Conversion rules used: PDn -> Dn, PFn -> Fn, PBn -> Bn, etc.
 * NOTE: PB8..PB11 are unusual names for an ATmega32U4 port B; if the
 * compiler fails, please double-check those pads in KiCad and send the
 * corrected port-bit names.
 */

/* Columns */
#define MATRIX_COL_PINS { B7, B5, D5, B11, D4, D6 }

/* Rows */
#define MATRIX_ROW_PINS { F4, F5, F6, F7, B6, D3, D2, B8, B9, B10 }

/* Diode direction: default to COL2ROW. If your diodes' cathodes face the rows,
 * change to ROW2COL. A photo of the diodes (showing the black stripe) will
 * let me confirm.
 */
#define DIODE_DIRECTION COL2ROW

/* No per-key RGB on this board */

/* Bootloader for many Pro Micro clones; change if yours uses a different bootloader. */
#define BOOTLOADER   caterina
