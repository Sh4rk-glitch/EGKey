#include QMK_KEYBOARD_H

/*
 * Default keymap: simple placeholders for a 10x6 matrix (60 positions).
 * Your board has 58 physical keys — the last two positions are set to KC_NO.
 * Replace keycodes with your desired layout.
 */

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = {
        { KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5    },
        { KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T    },
        { KC_CAPS, KC_A,    KC_S,    KC_D,    KC_F,    KC_G    },
        { KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B    },
        { KC_LCTL, KC_LALT, KC_LGUI, KC_SPC,  KC_SPC,  KC_NO   },

        { KC_NO,   KC_6,    KC_7,    KC_8,    KC_9,    KC_0    },
        { KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_BSLS },
        { KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT },
        { KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT },
        { KC_ENT,  KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO   }
    }
};
