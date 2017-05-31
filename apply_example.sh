#!/bin/bash

function apply_fn() {
    ($1 $2)
    let ret=$?
    return $ret
}

function apply_all() {
    func=$1
    shift
    i=0
    for item in "$@"
    do
        ret_arr[$i]=$( $func $item )
        let i++
    done
}

function double_num() {
    let ret=($1 * 2)
    return $ret
}

function triple_num() {
    ret_val=$(($1 * 3))
    echo "$ret_val"
    return $ret_val
}

# Read in an array of numbers from a file
i=0
while read -r line
do
    for item in $line
    do
        arr[$i]=$item
        let i++
    done
done < '/dev/stdin'

echo "Initial array: ${arr[@]}"

# Testing the double_num function works right
i=0
for item in "${arr[@]}"
do
    double_num $item
    echo $?
    let i++
done

# Applying a function to each element in the array
i=0
for item in "${arr[@]}"
do
    apply_fn double_num item
    arr[$i]=$?
    let i++
done

echo "Processed array: ${arr[@]}"

apply_all triple_num "${arr[@]}"
new_arr="${ret_arr[@]}"

echo "Apply_all array: ${new_arr[@]}"
