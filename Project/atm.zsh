#!/bin/zsh


# this function displays the menu
displayMenu() {
    echo "*** Welcome To Cal Poly's ATM System ***"
    echo "(1) Transfer from checking account to savings account"
    echo "(2) Transfer from savings account to checking account"
    echo "(3) Savings account balance"
    echo "(4) Checking account balance"
    echo "(5) Withdraw Cash from either account"
    echo "(6) Exit"
    echo "==> Please select option (1-6):"
}

# this function asks a user for his/her 3-digit PIN
askPin() {
    echo "*** Welcome to Cal Poly's ATM ****"
    echo "Please enter your PIN:"
}

# this function clears the screen
clearScreen() {
#    clear=(`clear`)
#    echo $clear
    clear
}

# this function verifies the user's PIN
verifyPin() {
    defaultPin=111   # we assume that the legal PIN is 111
    index=0
    while [ $index -ne 3 ]
    do
        askPin
        read userPin
        if [ $userPin -eq $defaultPin ] ; then
            return
        else
            clearScreen
            index=`expr $index + 1`
        fi
    done
    # if 3 attempts are failed, then terminate the script
    echo "Too many illegal PINs. Try later again"
    exit 0
}

# this function displays the current balance of the savins account
displaySavings() {
    echo "savings account balance: \$${savings}.00"
    `sleep 2`
}

displayChecking() {
    echo "checking account balance: \$${checking}.00"
    `sleep 2`
}

transferChkToSav() {
    echo "The amount \$: "
    read trfAmount
    if [ $trfAmount -gt $checking ] ; then
        clearScreen
        echo "Transaction not completed"
        echo "Current balance: ${checking}.00"
        `sleep 2`
        return
    fi
    checking=`expr $checking - $trfAmount`
    savings=`expr $savings + $trfAmount`
    `sleep 2`
}

transferSavToChk() {
    echo "The amount \$: "
    read trfAmount
    if [ $trfAmount -gt $savings ] ; then
        clearScreen
        echo "Transaction not completed"
        echo "Current balance: ${savings}.00"
        `sleep 2`
        return
    fi

    savings=`expr $savings - $trfAmount`
    checking=`expr $checking + $trfAmount`
    `sleep 2`
}

withdrawSav() {
    clearScreen
    echo "The amount \$: "
    read amount
    if [ $amount -gt $savings ] ; then
        clearScreen
        echo "Transaction not completed"
        echo "Current balance: ${savings}.00"
        `sleep 2`
        return
    fi
    savings=`expr $savings - $amount`
    `sleep 2`
}

withdrawChK() {
    clearScreen
    echo "The amount \$: "
    read amount
    if [ $amount -gt $checking ] ; then
        clearScreen
        echo "Transaction not completed"
        echo "Current balance: ${checking}.00"
        `sleep 2`
        return
    fi
    checking=`expr $checking - $amount`
    `sleep 2`
}

withdraw() {
    echo "Please enter 1 or 2"
    echo "(1) Withdraw from the Saving account"
    echo "(2) Withdraw from the Checking account"
    read input
    case $input in
        1)
            withdrawSav ;;
        2)
            withdrawChK ;;
    esac
}

checkChkBal() {
        echo "checeking $checking"
        withdrawAmt=$1
        if [ $withdrawAmt -gt $checking ] ; then
        echo "Transaction not completed"
        echo "Current checking account balance: ${checking}.00"
        fi
}

terminateScript() {
    clearScreen
    echo "Thank you for using the ATM system."
    `sleep 2`
    clearScreen
    exit 0
}

# Main Part of the Program

# initial balance of checking and savings account
checking=1000
savings=1000

# verify a 3-digit PIN
verifyPin

# do the main part
while :
do
    clearScreen
    displayMenu
    read userInput
    clearScreen
    case $userInput in
        1)
            transferChkToSav ;;
        2)
            transferSavToChk ;;
        3)
            displaySavings ;;
        4)
            displayChecking ;;
        5)
            withdraw ;;
        6)
            terminateScript ;;
    esac
done


