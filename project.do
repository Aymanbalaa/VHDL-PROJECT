

# Set the simulation time
add wave *
force -freeze max_occupancy 6'b 001000

# Increment count
force -freeze photocell_in 2'b00
run
force -freeze photocell_in 2'b01
run
force -freeze photocell_in 2'b01
run

# Decrement count
force -freeze photocell_in 2'b10
run
force -freeze photocell_in 2'b10
run

# Increment count again
force -freeze photocell_in 2'b01
run
force -freeze photocell_in 2'b01
run

# Reset count
force -freeze reset 0
run

# Increment count after reset
force -freeze photocell_in 2'b01
run
force -freeze photocell_in 2'b01
run

# Decrement count after reset
force -freeze photocell_in 2'b10
run

# End of simulation
quit -sim
