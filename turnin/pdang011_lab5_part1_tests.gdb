# Test file for "Lab5_atmega1284chip"


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

test "PINA: 0xFF => PORTC: 0x40"
setPINA 0xFF
continue 5
expectPORTC 0x40
checkResult

test "PINA: 0xFE => PORTC: 0x60"
setPINA 0xFE
continue 5
expectPORTC 0x60
checkResult

test "PINA: 0xFD => PORTC: 0x60"
setPINA 0xFD
continue 5
expectPORTC 0x60
checkResult

test "PINA: 0xFC => PORTC: 0x70"
setPINA 0xFC
continue 5
expectPORTC 0x70
checkResult

test "PINA: 0xFB => PORTC: 0x70"
setPINA 0xFB
continue 5
expectPORTC 0x70
checkResult

test "PINA: 0xFA => PORTC: 0x38"
setPINA 0xFA
continue 5
expectPORTC 0x38
checkResult

test "PINA: 0xF9 => PORTC: 0x38"
setPINA 0xF9
continue 5
expectPORTC 0x38
checkResult

test "PINA: 0xF8 => PORTC: 0x3C"
setPINA 0xF8
continue 5
expectPORTC 0x3C
checkResult

test "PINA: 0xF7 => PORTC: 0x3C"
setPINA 0xF7
continue 5
expectPORTC 0x3C
checkResult

test "PINA: 0xF6 => PORTC: 0x3C"
setPINA 0xF6
continue 5
expectPORTC 0x3C
checkResult

test "PINA: 0xF5 => PORTC: 0x3E"
setPINA 0xF5
continue 5
expectPORTC 0x3E
checkResult

test "PINA: 0xF4 => PORTC: 0x3E"
setPINA 0xF4
continue 5
expectPORTC 0x3E
checkResult

test "PINA: 0xF3 => PORTC: 0x3E"
setPINA 0xF3
continue 5
expectPORTC 0x3E
checkResult

test "PINA: 0xF2 => PORTC: 0x3F"
setPINA 0xF2
continue 5
expectPORTC 0x3F
checkResult

test "PINA: 0xF1 => PORTC: 0x3F"
setPINA 0xF1
continue 5
expectPORTC 0x3F
checkResult

test "PINA: 0xF0 => PORTC: 0x3F"
setPINA 0xF0
continue 5
expectPORTC 0x3F
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
