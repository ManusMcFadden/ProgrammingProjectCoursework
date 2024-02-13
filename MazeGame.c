#include <stdio.h>
//structs
typedef struct {
int rows;
int columns;
char mazeCharacters[100][100];
} __MAZE;

typedef struct {
int position[2];
char characterAbove;
char characterLeft;
char characterRight;
char characterBelow;
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

}

int validSymbols (rows, columns, mazeCharacters) {
    
}

int validEdges (rows, columns, mazeCharacters) {
    
}

int validStartAndEndNumber (rows, columns, mazeCharacters) {
    
}

position getStart ()
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
}