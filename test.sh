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
./mazeGame doesntExist.txt > tmp
if grep -q "Error: Bad filename" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing bad permissions - "
./mazeGame data/removedPerm.txt > tmp
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
if grep -q "Error: Invalid maze shape, must be square" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing invalid size (Small) - "
./mazeGame data/tooSmall.txt > tmp
if grep -q "Error: Invalid maze size, must be between 5 and 100 characters in both directions" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing invalid size (Large) - "
./mazeGame data/tooLarge.txt > tmp
if grep -q "Error: Invalid maze size, must be between 5 and 100 characters in both directions" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing invalid maze symbols - "
./mazeGame data/invalidSymbols.txt > tmp
if grep -q "Error: Invalid symbols used in maze, only #, space, S and E allowed" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing invalid number of start and end symbols - "
./mazeGame data/invalidStartEnd.txt > tmp
if grep -q "Error: Invalid number of start or end symbols" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing no possible route - "
./mazeGame data/noRoute.txt > tmp
if grep -q "Error: No possible route from S to E" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "\n~~ Move Validity~~"

echo -n "Testing move to # space"
echo "w" | timeout 0.2s ./mazeGame data/normal.txt > tmp
if grep -q "Error: Cannot move in that direction" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing move out of bounds"
echo "w" | timeout 0.2s ./mazeGame data/noEdge.txt > tmp
if grep -q "Error: Cannot move in that direction" tmp;
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

echo -n "Testing successful update of player character (before move) - "
./mazeGame data/normal.txt > tmp
if grep -q "#####
#O#E#
# # #
#   #
#####" tmp ;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing successful update of player character (after move) - "
echo "s" | timeout 0.2s ./mazeGame data/normal.txt > tmp
if grep -q "#####
#S#E#
#O# #
#   #
#####" tmp ;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing successful maze traversal - "
timeout 0.2s ./mazeGame data/normal.txt < inputs/correct_traversal.in > tmp
if grep -q "Congratulations, you have completed the maze!" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

chmod +r data/removedPerms.txt

rm -f tmp