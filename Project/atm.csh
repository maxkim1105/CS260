#!/bin/csh
# Usage: ATM service

clear
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
    # displays the menu
    echo "*** Welcome To Cal Poly's ATM System ***"
    echo "(1) Transfer from checking account to savings account"
    echo "(2) Transfer from savings account to checking account"
    echo "(3) Savings account balance"
    echo "(4) Checking account balance"
    echo "(5) Withdraw Cash from either account"
    echo "(6) Exit"
    echo "==> Please select option (1-6):"
    set userInput = $<

    # lets the user choose his/her option
    switch ($userInput)
    # transfer from the checking to savings account
    case 1:
	clear
	echo "Enter the amount:"
	set trfAmount = $<
	if ( $trfAmount > $checking ) then
	    clear
	    echo "Transaction not completed"
	    echo "Current balance: ${checking}.00"
	    sleep 2
	    breaksw
	endif
	@ checking = ($checking - $trfAmount)
	@ savings = ($savings + $trfAmount)
	sleep 2
	breaksw
	
    # transfer from the savings to cheking account
    case 2:
	clear
	echo "Enter the amount:"
	set trfAmount = $<
	if ( $trfAmount > $savings ) then
	    clear
	    echo "Transaction not completed"
	    echo "Current balance: ${savings}.00"
	    sleep 2
	    breaksw
	endif
	@ savings = ($savings - $trfAmount)
	@ checking = ($checking + $trfAmount)
	sleep 2
	breaksw
	
    # displays the balance of the savings account
    case 3:
	clear
	echo "savings account balance: "\$"${savings}.00"
	sleep 2
	breaksw
	
    # displays the balance of the checking account	
    case 4:
        clear
	echo "checking account balance: "\$"${checking}.00"
	sleep 2
	breaksw
  
    # withdraw cash from either the checking or savings account
    case 5:
	clear
	echo "Please enter 1 or 2"
	echo "(1) Withdraw from the Saving account"
	echo "(2) Withdraw from the Checking account"
	set input = $<
	
	# withdraw from the savings account
	if ( $input == 1 ) then
	    clear
	    echo "The amount "\$": "
	    set amount = $<
	    if ( $amount > $savings ) then
		clear
		echo "Transaction not completed"
		echo "Current balance: ${savings}.00"
		sleep 2
	    else
		@ savings = ($savings - $amount)
		sleep 2
	    endif    
	# withdraw from the checking account
	else if ( $input == 2 ) then
	    clear
	    echo "The amount "\$": "
	    set amount = $<
	    if ( $amount > $checking ) then
		clear
		echo "Transaction not completed"
		echo "Current balance: ${checking}.00"
		sleep 2
	    else
		@ checking = ($checking - $amount)
		sleep 2
	    endif 
    	endif
	breaksw
	
    # terminate the script
    case 6:
        clear
        echo "Thank you for using the ATM system."
	sleep 2
        clear
	exit 0
   endsw

   
end

clear
