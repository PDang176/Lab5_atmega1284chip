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

test "PINA: 0xFF => PORTC: 0x00, state: Wait_Press"
set state = Start
setPINA 0xFF
continue 5
expectPORTC 0x00
expect state Wait_Press
checkResult

test "PINA: 0xFE => PORTC: 0x01, state: Wait_Release"
set state = Wait_Press
setPINA 0xFE
continue 5
expectPORTC 0x01
expect state Wait_Release
checkResult

test "PINA: 0xFF, 0xFE, 0xFF => PORTC: 0x02, state: Wait_Press"
setPINA 0xFF
continue 5
setPINA 0xFE
continue 5
setPINA 0xFF
continue 5
expectPORTC 0x02
expect state Wait_Press
checkResult

test "PINA: 0xFD => PORTC: 0x01, state: Wait_Release"
setPINA 0xFD
continue 5
expectPORTC 0x01
expect state Wait_Release
checkResult

test "(Starting at counter = 0x07) PINA: 0xFD, 0xFF => PORTC: 0x06, state: Wait_Press"
set state = Wait_Press
set counter = 0x07
continue 5
setPINA 0xFD
continue 5
setPINA 0xFF
continue 5
expectPORTC 0x06
expect state Wait_Press
checkResult

test "PINA: 0xFC, 0xFF => PORTC: 0x00, state: Wait_Press"
setPINA 0xFC
continue 5
setPINA 0xFF
continue 5
expectPORTC 0x00
expect state Wait_Press
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
