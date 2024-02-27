import random
from collections import deque

def generate_maze(width, height):
    maze = [['#' for _ in range(width)] for _ in range(height)]

    # Generate paths
    for i in range(1, height - 1):
        for j in range(1, width - 1):
            if random.random() < 0.7:  # Adjust this probability to control density of paths
                maze[i][j] = ' '

    # Ensure there is a route from start to end
    visited = set()
    stack = deque([(1, 1)])
    while stack:
        x, y = stack.pop()
        if (x, y) in visited:
            continue
        visited.add((x, y))
        if (x, y) == (height - 2, width - 2):
            break
        for dx, dy in [(0, 1), (1, 0), (0, -1), (-1, 0)]:
            nx, ny = x + dx, y + dy
            if 0 <= nx < height and 0 <= ny < width and maze[nx][ny] == ' ':
                stack.append((nx, ny))

    for i in range(1, height - 1):
        for j in range(1, width - 1):
            if (i, j) not in visited and maze[i][j] == ' ':
                maze[i][j] = '#'

    # Place the start and end points
    maze[1][1] = 'S'
    maze[height - 2][width - 2] = 'E'

    return maze

def save_maze_to_file(maze, filename):
    with open(filename, 'w') as f:
        for row in maze:
            f.write(''.join(row) + '\n')

if __name__ == "__main__":
    width = 101
    height = 101
    maze = generate_maze(width, height)
    save_maze_to_file(maze, 'maze.txt')
