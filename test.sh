#!/bin/bash

chmod -r data/removedPerms.csv

echo -e "~~ Argument Tests ~~"

echo -n "Testing no arguments - "
./mazeGame > tmp
if grep -q "Usage: mazeGame <filename>" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing 2 arguments - "
./mazeGame x x > tmp
if grep -q "Usage: mazeGame <filename>" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "\n~~ File Handling~~"

echo -n "Testing bad filename - "
./studentData doesntExist.csv > tmp
if grep -q "Error: Bad filename" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing bad permissions - "
./studentData data/removedPerm.csv > tmp
if grep -q "Error: Bad filename" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing file loads successfully - "
./mazeGame data/normal.csv > tmp
if grep -q "File data/normal.csv successfully loaded." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "\n~~ Bad user inputs ~~"

echo -n "Testing bad user input (wrong) - "
echo "1" | timeout 0.2s ./mazeGame data/normal.csv > tmp
if grep -q "Error: Invalid input" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing bad user input (empty) - "
echo "" | timeout 0.2s ./studentData data/normal.csv > tmp
if grep -q "Error: Invalid input" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "\n~~ Success ~~"

    echo -n "Testing successful maze traversal "
    echo "1" | timeout 0.2s ./studentData data/good_1_85.csv > tmp
    if grep -q "00291   Smith   John   85" tmp;
    then
        echo "PASS"
    else
        echo "FAIL"
    fi

empty file
function tests







chmod +r data/bad_perms.csv

rm -f tmp