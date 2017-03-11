#!/bin/bash

displayMenu() {
    echo "(1) Listing of records in alphabetical order of first name"
    echo "(2) Listing of records in alphabetical order of last name"
    echo "(3) Listing of records in reverse alphabetical order of first name"
    echo "(4) Listing of records in reverse alphabetical order of last name"
    echo "(5) Search for a record by Last Name and print out the result."
    echo "(6) Search for a record by birthday in a given year."
    echo "(7) Search for a record by birthday in a given month."
}

lastNameSort(){
    lnameSort=`cat data.txt | sort -k 2`
    echo "$lnameSort"
}

lastNameSortReverse(){
    lnameSortR=`cat data.txt | sort -r -k 2`
    echo "$lnameSortR"
}

firstNameSort(){
    fnameSort=`cat data.txt | sort`
    echo "$fnameSort"
}

firstNameSortReverse() {
    fnameSortR=`cat data.txt | sort -r`
    echo "$fnameSortR"
}

# get data.txt file using a shell command
getData(){
    data=`cat data.txt`
    return $data
}

searchLastName(){
    lastName=$1
    result=$(awk -F'[: ]' -v lastName="$lastName" '$2 == lastName' data.txt)
    echo "$result"
}

searchYear(){
    year=$1
    echo "In the function, the argument is $year"
    result=$(awk -F'[:/]' -v year="$year" '$7 == year' data.txt)
    echo "$result"
}

searchMonth(){
    month=$1
    result=$(awk -F'[:/]' -v month="$month" '$5 == month' data.txt)
    echo "$result"
}


displayMenu
read input

if [ $input -eq 1 ]
then
    firstNameSort
elif [ $input -eq 2 ]
then
    lastNameSort
elif [ $input -eq 3 ]
then
    firstNameSortReverse
elif [ $input -eq 4 ]
then
    lastNameSortReverse
elif [ $input -eq 5 ]
then
    echo "Enter the last name:"
    read name
    searchLastName $name
elif [ $input -eq 6 ]
then
    echo "Enter the year:"
    read year
    echo "Passing $year to a function"
    searchYear $year
elif [ $input -eq 7 ]
then
    echo "Enter the month:"
    read month
    searchMonth $month
fi






