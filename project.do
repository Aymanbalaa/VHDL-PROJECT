add wave *

-- Reset the system
force reset 1
run 2

-- Test scenario 1: Increment occupancy
force photocell_X 1
force photocell_Y 0
force max_occupancy "001100"
run 2

-- Test scenario 2: Decrement occupancy
force photocell_X 0
force photocell_Y 1
run 2

-- Test scenario 3: Room is full (red light active)
force photocell_X 1
force photocell_Y 0
run 2

-- Test scenario 4: Reset the system
force reset 0
run 2

-- Test scenario 5: Increment occupancy
force photocell_X 1
force photocell_Y 0
run 2

-- Test scenario 6: Decrement occupancy
force photocell_X 0
force photocell_Y 1
run 2

-- Test scenario 7: Room is full (red light active)
force photocell_X 1
force photocell_Y 0
run 2
