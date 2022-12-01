# DON'T TOUCH THE FOLLOWING CONFIGURATION VARIABLES

### This makes sure that the core rings are outside the boundaries of your block.

"MAGIC_ZEROIZE_ORIGIN": 0,
"FP_SIZING": "absolute",
"RUN_CVC": 0,

"DIE_AREA": "0 0 3000 3000",
"CORE_AREA": "21.5 21.5 2978.5 2978.5",

"FP_DEF_TEMPLATE": "dir::fixed_dont_change/user_project_wrapper_gf180mcu.def",

"UNIT": 2.4,
"FP_IO_VEXTEND": "expr::2 * $UNIT",
"FP_IO_HEXTEND": "expr::2 * $UNIT",
"FP_IO_VLENGTH": "expr::$UNIT",
"FP_IO_HLENGTH": "expr::$UNIT",

"FP_IO_VTHICKNESS_MULT": 4,
"FP_IO_HTHICKNESS_MULT": 4,

"FP_PDN_CORE_RING": 1,
"FP_PDN_CORE_RING_VWIDTH": 3.1,
"FP_PDN_CORE_RING_HWIDTH": 3.1,
"FP_PDN_CORE_RING_VSPACING": 1.7,
"FP_PDN_CORE_RING_HSPACING": 1.7,
"FP_PDN_VWIDTH": 3.1,
"FP_PDN_HWIDTH": 3.1,
"FP_PDN_HPITCH": "expr (60 + abs(int($FP_PDN_HPITCH_MULT)) * 30)",
"FP_PDN_VSPACING": "expr (5 * $FP_PDN_CORE_RING_VWIDTH)",
"FP_PDN_HSPACING": 26.9,
"FP_PDN_CORE_RING_VOFFSET": 14,
"FP_PDN_CORE_RING_HOFFSET": 14,

"SYNTH_USE_PG_PINS_DEFINES": "USE_POWER_PINS",

"FP_DEF_TEMPLATE": "dir::fixed_dont_change/user_project_wrapper_gf180mcu.def"

"VDD_NETS": ["vdd"],
"GND_NETS": ["vss"],






