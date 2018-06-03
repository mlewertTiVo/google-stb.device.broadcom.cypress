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

add_lunch_combo aosp_cypress-userdebug
