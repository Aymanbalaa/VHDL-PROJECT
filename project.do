# Set the working directory
cd C:/path/to/project/directory

# Compile the VHDL files
vcom -93 -work work PeopleCounter.vhd
vcom -93 -work work PeopleCounter_TB.vhd

# Simulate the design
vsim -gui work.PeopleCounter_TB

# Set the simulation time
add wave -position insertpoint sim:/PeopleCounter_TB/*
force -freeze sim:/PeopleCounter_TB/clk_tb 0 0, 1 5ns -r 10ns
force -freeze sim:/PeopleCounter_TB/reset_tb 1 0, 0 20ns -r 30ns

# Increment count
force -freeze sim:/PeopleCounter_TB/photocell_in_tb 2'b00 40ns
run 10ns
force -freeze sim:/PeopleCounter_TB/photocell_in_tb 2'b01 50ns
run 10ns
force -freeze sim:/PeopleCounter_TB/photocell_in_tb 2'b01 60ns
run 10ns

# Decrement count
force -freeze sim:/PeopleCounter_TB/photocell_in_tb 2'b10 70ns
run 10ns
force -freeze sim:/PeopleCounter_TB/photocell_in_tb 2'b10 80ns
run 10ns

# Increment count again
force -freeze sim:/PeopleCounter_TB/photocell_in_tb 2'b01 90ns
run 10ns
force -freeze sim:/PeopleCounter_TB/photocell_in_tb 2'b01 100ns
run 10ns

# Reset count
force -freeze sim:/PeopleCounter_TB/reset_tb 0 110ns
run 10ns

# Increment count after reset
force -freeze sim:/PeopleCounter_TB/photocell_in_tb 2'b01 120ns
run 10ns
force -freeze sim:/PeopleCounter_TB/photocell_in_tb 2'b01 130ns
run 10ns

# Decrement count after reset
force -freeze sim:/PeopleCounter_TB/photocell_in_tb 2'b10 140ns
run 10ns

# End of simulation
quit -sim
