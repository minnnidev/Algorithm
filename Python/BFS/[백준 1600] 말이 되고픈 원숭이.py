'''
[백준 1600] 말이 되고픈 원숭이
https://www.acmicpc.net/problem/1600

[📌 전략]
- 말처럼 k번 이동할 수 있다 -> k개의 동물원을 만들어 경우의 수를 따져봐야 함
- 원숭이처럼 이동하는 건 자유롭기 때문에 매 경우에 원숭이처럼 이동하는 것도 따져야 함

[✅ 풀이]
1. k+1만큼 말처럼 이동했을 때, 이동한 최소거리를 저장하기 위한 distance 배열 선언
2. bfs 탐색 위한 큐 선언
    - 큐에 들어가는 요소의 형식은 (현재 x 좌표, 현재 y 좌표, 말처럼 이동한 횟수 h_cnt)
    - 아직 말처럼 이동할 기회가 있다면(h_cnt < k) 이동한 정보를 큐에 추가
    - 말처럼 이동할 기회는 고려하지 않고 매번 원숭이처럼 이동한 정보를 큐에 추가
    - popleft한 요소의 좌표가 도착지라면 해당 거리 리턴
    - 탐색을 전부 끝냈지만 도착지에 도달하지 못했다면 -1 리턴

[📝 기록]
LV: 골드3
풀이 시간: 60분 
'''

import sys
from collections import deque

input = sys.stdin.readline

k = int(input())
w, h = map(int, input().strip().split())
board = [[0 for _ in range(w)] for _ in range(h)]
distance = [[[-1 for _ in range(w)] for _ in range(h)] for _ in range(k+1)]

monkey_dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]]
horse_dirs = [[-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]]

for i in range(h):
    board[i] = list(map(int, input().split()))

def bfs(i, j):
    q = deque([[i, j, 0]])
    distance[0][i][j] = 0

    while q:
        x, y, h_cnt = q.popleft()

        # 도착지 도달 시 리턴
        if x == h-1 and y == w-1: return distance[h_cnt][h-1][w-1]

        if h_cnt < k: # 말처럼 이동할 수 있다면
            for dir in horse_dirs:
                nx, ny = x + dir[0], y + dir[1]

                if nx < 0 or nx >= h or ny < 0 or ny >= w: continue # 범위 체크
                if board[nx][ny] == 1: continue # 장애물 체크
                if distance[h_cnt+1][nx][ny] > -1: continue # 해당 좌표로 이동한 적 있는지 체크
                
                distance[h_cnt+1][nx][ny] = (distance[h_cnt][x][y] + 1)
                q.append([nx, ny, h_cnt+1])

        for dir in monkey_dirs: # 원숭이처럼은 매번 이동
            nx, ny = x + dir[0], y + dir[1]

            if nx < 0 or nx >= h or ny < 0 or ny >= w: continue # 범위 체크
            if board[nx][ny] == 1: continue # 장애물 체크
            if distance[h_cnt][nx][ny] > -1: continue # 해당 좌표로 이동한 적 있는지 체크

            distance[h_cnt][nx][ny] = distance[h_cnt][x][y] + 1
            q.append([nx, ny, h_cnt]) 

    return -1

print(bfs(0, 0))