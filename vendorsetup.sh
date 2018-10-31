add_lunch_combo cypress-userdebug
add_lunch_combo cypress-user

# exact same as 'cypress' but without a|b mode support.
add_lunch_combo cypress_nab-userdebug
add_lunch_combo cypress_nab-user

# 'd' target - cypress with additional features (dual decode)
add_lunch_combo cypressd-userdebug

# 'nvi' targets - 'no vendor image' for legacy layout on O+
add_lunch_combo cypress_nvi-userdebug
add_lunch_combo cypress_nvi-user

# 't' target - cypress (kernel 64, android 32) with tee support.
add_lunch_combo cypresst-userdebug

# 'cypress' with 3GB of memory (instead of 2GB); consequently no dtu.
add_lunch_combo cypress_3gb-userdebug
add_lunch_combo cypress_3gb-user

add_lunch_combo aosp_cypress-userdebug

# 'ms12d' target - cypress with dolby ms12d support
add_lunch_combo cypress_ms12d-userdebug
add_lunch_combo cypress_ms12d-user
