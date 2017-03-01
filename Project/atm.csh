#!/bin/csh
# Usage: ATM service

# initial balance of checking and savings account
set checking = 1000
set savings = 1000

# verify a 3-digit PIN
set defaultPin = 111
set index = 0
while ( $index != 3 )
    echo "*** Welcome to Cal Poly's ATM ****"
    echo "Please enter your PIN:"
    set userPin = $<
    if ( $userPin == $defaultPin ) then
	break
    else
	clear
	@ index = ($index + 1)
    endif

    if ( $index == 3 ) then
	echo "Too many illegal PINs. Try later again"
	exit 0
    endif
end

set flag = "true"
while ($flag == "true")
    clear
    echo "*** Welcome To Cal Poly's ATM System ***"
    echo "(1) Transfer from checking account to savings account"
    echo "(2) Transfer from savings account to checking account"
    echo "(3) Savings account balance"
    echo "(4) Checking account balance"
    echo "(5) Withdraw Cash from either account"
    echo "(6) Exit"
    echo "==> Please select option (1-6):"
    set hi = $<
    echo "POTATO"
end
