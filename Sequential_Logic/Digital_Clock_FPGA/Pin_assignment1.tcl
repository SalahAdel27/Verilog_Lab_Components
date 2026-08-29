# ==============================================================================
# Clock and Reset
# ==============================================================================
set_location_assignment PIN_AF14 -to clk_ref
set_location_assignment PIN_AA14 -to rst_n

# ==============================================================================
# SECONDS DISPLAYS (HEX0 & HEX1)
# ==============================================================================

# Seconds Units Display (HEX0)
set_location_assignment PIN_W17  -to HEX0[0]
set_location_assignment PIN_V18  -to HEX0[1]
set_location_assignment PIN_AG17 -to HEX0[2]
set_location_assignment PIN_AG16 -to HEX0[3]
set_location_assignment PIN_AH17 -to HEX0[4]
set_location_assignment PIN_AG18 -to HEX0[5]
set_location_assignment PIN_AH18 -to HEX0[6]

# Seconds Tens Display (HEX1)
set_location_assignment PIN_AF16 -to HEX1[0]
set_location_assignment PIN_V16  -to HEX1[1]
set_location_assignment PIN_AE16 -to HEX1[2]
set_location_assignment PIN_AD17 -to HEX1[3]
set_location_assignment PIN_AE18 -to HEX1[4]
set_location_assignment PIN_AE17 -to HEX1[5]
set_location_assignment PIN_V17  -to HEX1[6]

# ==============================================================================
# MINUTES DISPLAYS (HEX2 & HEX3)
# ==============================================================================

# Minutes Units Display (HEX2)
set_location_assignment PIN_AA21 -to HEX2[0]
set_location_assignment PIN_AB17 -to HEX2[1]
set_location_assignment PIN_AA18 -to HEX2[2]
set_location_assignment PIN_Y17  -to HEX2[3]
set_location_assignment PIN_Y18  -to HEX2[4]
set_location_assignment PIN_AF18 -to HEX2[5]
set_location_assignment PIN_W16  -to HEX2[6]

# Minutes Tens Display (HEX3)
set_location_assignment PIN_Y19  -to HEX3[0]
set_location_assignment PIN_W19  -to HEX3[1]
set_location_assignment PIN_AD19 -to HEX3[2]
set_location_assignment PIN_AA20 -to HEX3[3]
set_location_assignment PIN_AC20 -to HEX3[4]
set_location_assignment PIN_AA19 -to HEX3[5]
set_location_assignment PIN_AD20 -to HEX3[6]

# ==============================================================================
# HOURS DISPLAYS (HEX4 & HEX5)
# ==============================================================================

# Hours Units Display (HEX4)
set_location_assignment PIN_AD21 -to HEX4[0]
set_location_assignment PIN_AG22 -to HEX4[1]
set_location_assignment PIN_AE22 -to HEX4[2]
set_location_assignment PIN_AE23 -to HEX4[3]
set_location_assignment PIN_AG23 -to HEX4[4]
set_location_assignment PIN_AF23 -to HEX4[5]
set_location_assignment PIN_AH22 -to HEX4[6]

# Hours Tens Display (HEX5)
set_location_assignment PIN_AF21 -to HEX5[0]
set_location_assignment PIN_AG21 -to HEX5[1]
set_location_assignment PIN_AF20 -to HEX5[2]
set_location_assignment PIN_AG20 -to HEX5[3]
set_location_assignment PIN_AE19 -to HEX5[4]
set_location_assignment PIN_AF19 -to HEX5[5]
set_location_assignment PIN_AB21 -to HEX5[6]