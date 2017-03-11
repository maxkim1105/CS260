#!/bin/bash

echo "enter"
read year
echo "In the function, the argument is $year"
result=$(awk -F'[: ]' -v year="$year" '$7 == year' data.txt)
echo "$result"
