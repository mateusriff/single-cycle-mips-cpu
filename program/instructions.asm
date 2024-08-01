# Initialize $t0
LI $t0, 0000000000000000  # Load 0 into $t0

# Store constants into memory
LI $t1, 00101000           # Load 40 into $t1
SW $t1, 0000000000000000($t0)  # Store 40 into memory at address in $t0 (0x00000000)
LI $t1, 00100110           # Load 38 into $t1
SW $t1, 0000000000000004($t0)  # Store 38 into memory at address in $t0 + 4 (0x00000004)

# Load values for comparison
LW $s0, 0000000000000000($t0)  # Load value from memory address in $t0 (0x00000000) into $s0
LW $s1, 0000000000000004($t0)  # Load value from memory address in $t0 + 4 (0x00000004) into $s1

# Perform set less than comparison
SLT $s2, $s0, $s1  # $s2 = ($s0 < $s1)

# Branch based on comparison result
BEQ $s2, $t0, set_one  # Branch to set_one if $s2 == $t0 (0)

# This is the path if the condition was false
LI $t1, 00000001           # Load 1 into $t1
SW $t1, 000000000000000C($t0)  # Store 1 into memory at address in $t0 + 12 (0x0000000C)

J end

# Branch target
set_one:
    LI $t1, 00000000           # Load 0 into $t1
    SW $t1, 000000000000000C($t0)  # Store 0 into memory at address in $t0 + 12 (0x0000000C)

end:
    LW $s3, 000000000000000C($t0)  # Load value from memory address in $t0 + 12 (0x0000000C) into $s3