//libraries
#include <stdio.h>
//structs
typedef struct {
int rows;
int columns;
char mazeCharacters[100][100];
} __MAZE;

typedef struct {
int position[2];
int atEnd
} __PLAYER;
//functions and procedures
int validShape (mazeFile) {
    //iterate through each row to check they are all the same length
    //iterate through each column to check they are the same length
    //if so then return 1
    //else return 0
}

int getRows (mazeFile) {

}

int getColumns (mazeFile) {
    
}

int validSize (rows, columns) {
    //if rows and columns are both between 5 and 100 return 1 
    //else return 0
}

int validSymbols (rows, columns, mazeCharacters) {
    //iterate through mazeCharacters a number of times decided by the values of rows and columns
    //for each character, check if it is a #, ' ', s or e
}

int validEdges (rows, columns, mazeCharacters) {
    //iterate through mazeCharacters a number of times decided by the values of rows and columns
    //check that none of the edges = ' '
    //if this is true return 1
    //else return 0
}

int validStartAndEndNumber (rows, columns, mazeCharacters) {
    //iterate through mazeCharacters a number of times decided by the values of rows and columns
    //keep count of the number of s and e characters
    //if there is one of each return 1
    //else return 0
}

int *getStart (mazeCharacters) {
    //iterate through mazeCharacters until a character = s
    //return the position of the s
}

int validMove (position, input) {
    //based on the button pressed check if the character in the direction required is a # 
    //return 0 if it is #
    //return 1 otherwise
}

updatePlayerCharacter (position, mazeCharacters) {
//change position in mazeCharacters to player symbol
}

//main
int main(int argc, char *argv[]) {
//open file
    //check file opened correctly
    //if not then error message

//initialize maze 
//call validShape
    //if it returns 0 then show an error
//set maze.columns to the result of getColumns
//set maze.rows to the result of getColumns
//turn file into maze.mazeCharacters[][]
    
//call validSize
//call validSymbols
//call validEdges
//call validStartAndEndNumber

//initialize player
    //set position to value of getStart

//call updatePlayerCharacter

//loop until player is on e
    //display maze
    //loop until a valid move has been done
    //wait for input
    //call validMove
    //if move is valid then change position accordingly
    //call updatePlayerCharacter
    //make valid move boolean true
    //else do nothing
    
}