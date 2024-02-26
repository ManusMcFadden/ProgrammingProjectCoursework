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
timeout 0.2s ./studentData data/removedPerm.csv > tmp
if grep -q "Error: Bad filename" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi








chmod +r data/bad_perms.csv

rm -f tmp