#!/bin/bash

# Notable bash things here:
# 1. How to read a file line by line. The while-loop takes a command arg.
# 2. Declaration of array variable is not needed
# 3. How to increment an index counter
# 4. How to use an integer value stored in a variable
# 5. How to dereference an element in an array

#declare -a arr
i=0
while read -r line ; do
    arr[$i]="$line"
    let i++
done < '/usr/share/dict/words'

word="${arr[$((RANDOM % $i))]}"

echo "$word"
