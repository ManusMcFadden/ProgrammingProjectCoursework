//libraries
#include <stdio.h>
//structs
typedef struct {
int rows;
int columns;
char mazeCharacters[100][100];
int start[2];
int end[2];
} __MAZE;

typedef struct {
int position[2];
} __PLAYER;
//functions and procedures
validShape (mazeFile) {
    //iterate through each row to check they are all the same length
    //iterate through each column to check they are the same length
    //if not then display error message
}

int getRows (mazeFile) {
    //return rows
}

int getColumns (mazeFile) {
    //return columns
}

validSize (rows, columns) {
    //check if rows and columns are both between 5 and 100
    //else return error message
}

validSymbols (rows, columns, mazeCharacters) {
    //iterate through mazeCharacters a number of times decided by the values of rows and columns
    //for each character, check if it is a #, ' ', S or E
    //else return an error message
}

validStartAndEndNumber (rows, columns, mazeCharacters) {
    //iterate through mazeCharacters a number of times decided by the values of rows and columns
    //keep count of the number of s and e characters
    //else return an error message
}

validRoute (rows, columns, mazeCharacters) {
    //initialize new identical maze
    //perform depth first search
    //if there is a route then return 1
    //else return 0

}

int *getStart (mazeCharacters) {
    //iterate through mazeCharacters until a character = s
    //return the position of the S
}

int validInput (input) {
    //if input is WASD then return 1
    //else display message and return 0
}

int validMove (position, input) {
    //based on the button pressed check if the character in the direction required is a # or if it exceeds the limits of the map 
    //return 0 if it does either of these
    //else display message and return 1
}

updatePlayerCharacter (position, mazeCharacters) {
//change position in mazeCharacters to player symbol
//change start in mazeCharacters to player S
}

//main
int main(int argc, char *argv[]) {
//if not 2 arguments
//then return error message

//open file
    //check file opened correctly
    //if not then error message
    //else print file opened successfully message

//check if file is empty
//if it is return an error message


//initialize maze 
//call validShape
//set maze.columns to the result of getColumns
//set maze.rows to the result of getColumns
//turn file into maze.mazeCharacters[][]
    
//call validSize
//call validSymbols
//call validStartAndEndNumber
//call validRoute

//initialize player
    //set position to value of getStart

//call updatePlayerCharacter

//loop until player is on e
    //display maze
    //loop until a valid move has been done
        //wait for input
        //call validInput
        //call validMove
        //if move is valid then change position accordingly
            //call updatePlayerCharacter
            //make valid move boolean true
    
//print winning message
}