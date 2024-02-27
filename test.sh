#!/bin/bash

chmod -r data/removedPerms.txt

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
./studentData doesntExist.txt > tmp
if grep -q "Error: Bad filename" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing bad permissions - "
./studentData data/removedPerm.txt > tmp
if grep -q "Error: Bad filename" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing file loads successfully - "
./mazeGame data/normal.txt > tmp
if grep -q "File data/normal.txt successfully loaded." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing file is not empty - "
./mazeGame data/empty.txt > tmp
if grep -q "Error: File is empty" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "\n~~ Maze Validity~~"

echo -n "Testing invalid maze shape - "
./mazeGame data/invalidShape.txt > tmp
if grep -q "Error: Invalid maze shape" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "\n~~ Bad user inputs ~~"

echo -n "Testing bad user input (wrong) - "
echo "1" | timeout 0.2s ./mazeGame data/normal.txt > tmp
if grep -q "Error: Invalid input" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing bad user input (empty) - "
echo "" | timeout 0.2s ./mazeGame data/normal.txt > tmp
if grep -q "Error: Invalid input" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "\n~~ Success ~~"

    echo -n "Testing successful maze traversal "
    timeout 0.2s ./mazeGame data/normal.txt < inputs/correct_traversal.in > tmp
    if grep -q "Congratulations, you have completed the maze!" tmp;
    then
        echo "PASS"
    else
        echo "FAIL"
    fi

chmod +r data/removedPerms.txt

rm -f tmp