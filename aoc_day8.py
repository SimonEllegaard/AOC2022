import os

input = open(os.getcwd() + "\\aoc_day8.txt").read().strip()
lines = []
for line in input.split('\n'):
    line = line.strip()
    lines.append((line))

def check_direction(dir, line_index, tree_index, tree):
    if dir == 'up':
        if lines[:line_index] == []:
            return True
        if list(filter(lambda l: l[tree_index] >= tree, lines[:line_index])) == []:
            return True
        return False
    if dir == 'down':
        if lines[line_index+1:] == []:
            return True
        if list(filter(lambda l: l[tree_index] >= tree, lines[line_index+1:])) == []:
            return True
        return False
    if dir == 'left':
        if list(filter(lambda l: l >= tree, lines[line_index][:tree_index])) == []:
            return True
        return False
    if dir == 'right':
        if list(filter(lambda l: l >= tree, lines[line_index][tree_index+1:])) == []:
            return True
        return False

count = 0
line_index = 0
for line in lines:
    tree_index = 0
    for tree in line:
        vis = check_direction('up', line_index, tree_index, tree)
        if not vis:
            vis = check_direction('down', line_index, tree_index, tree)
        if not vis:
            vis = check_direction('left', line_index, tree_index, tree)
        if not vis:
            vis = check_direction('right', line_index, tree_index, tree)
        if vis:
            count += 1
        tree_index += 1
    line_index += 1
#part 1
print(count)

def get_distance(dir, line_index, tree_index, tree):
    if dir == 'up':
        if lines[:line_index] == []:
            return 0
        res = 0
        for t in reversed(list(map(lambda l: l[tree_index], lines[:line_index]))):
            res += 1
            if t >= tree:
                break
        return res
    if dir == 'down':
        if lines[line_index+1:] == []:
            return 0
        res = 0
        for t in list(map(lambda l: l[tree_index], lines[line_index+1:])):
            res += 1
            if t >= tree:
                break
        return res
    if dir == 'left':
        res = 0
        for t in reversed(list(lines[line_index][:tree_index])):
            res += 1
            if t >= tree:
                break
        return res
    if dir == 'right':
        res = 0
        for t in list(lines[line_index][tree_index+1:]):
            res += 1
            if t >= tree:
                break
        return res
highest_score = 0
line_index = 0
for line in lines:
    tree_index = 0
    for tree in line:
        up_distance = get_distance('up', line_index, tree_index, tree)
        down_distance = get_distance('down', line_index, tree_index, tree)
        left_distance = get_distance('left', line_index, tree_index, tree)
        right_distance = get_distance('right', line_index, tree_index, tree)
        tree_score = up_distance * down_distance * left_distance * right_distance
        if tree_score > highest_score:
            highest_score = tree_score
        tree_index += 1
    line_index += 1
#part 2
print(highest_score)