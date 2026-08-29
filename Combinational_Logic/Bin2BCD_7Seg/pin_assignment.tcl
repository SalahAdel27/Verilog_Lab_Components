# 7-Segment Display Units (seg_units)
# Index mapping: [0]->a, [1]->b, [2]->c, [3]->d, [4]->e, [5]->f, [6]->g
set_location_assignment PIN_W17  -to seg_units[0]
set_location_assignment PIN_V18  -to seg_units[1]
set_location_assignment PIN_AG17 -to seg_units[2]
set_location_assignment PIN_AG16 -to seg_units[3]
set_location_assignment PIN_AH17 -to seg_units[4]
set_location_assignment PIN_AG18 -to seg_units[5]
set_location_assignment PIN_AH18 -to seg_units[6]

# 7-Segment Display Tens (seg_tens)
set_location_assignment PIN_AF16 -to seg_tens[0]
set_location_assignment PIN_V16  -to seg_tens[1]
set_location_assignment PIN_AE16 -to seg_tens[2]
set_location_assignment PIN_AD17 -to seg_tens[3]
set_location_assignment PIN_AE18 -to seg_tens[4]
set_location_assignment PIN_AE17 -to seg_tens[5]
set_location_assignment PIN_V17  -to seg_tens[6]

# 7-Segment Display Hundreds (seg_hundreds)
set_location_assignment PIN_AA21 -to seg_hundreds[0]
set_location_assignment PIN_AB17 -to seg_hundreds[1]
set_location_assignment PIN_AA18 -to seg_hundreds[2]
set_location_assignment PIN_Y17  -to seg_hundreds[3]
set_location_assignment PIN_Y18  -to seg_hundreds[4]
set_location_assignment PIN_AF18 -to seg_hundreds[5]
set_location_assignment PIN_W16  -to seg_hundreds[6]

# Binary Inputs (bin_in)
set_location_assignment PIN_AB30 -to bin_in[0]
set_location_assignment PIN_Y27  -to bin_in[1]
set_location_assignment PIN_AB28 -to bin_in[2]
set_location_assignment PIN_AC30 -to bin_in[3]
set_location_assignment PIN_W25  -to bin_in[4]
set_location_assignment PIN_V25  -to bin_in[5]
set_location_assignment PIN_AC28 -to bin_in[6]
set_location_assignment PIN_AD30 -to bin_in[7]