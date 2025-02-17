'''
[백준 16234] 인구 이동
https://www.acmicpc.net/problem/16234

[📌 전략]
- 인접 국가로 이동할 수 있고, 연합국가의 좌표와 연합의 수가 필요 -> bfs 사용

[✅ 풀이]
1. 입력받기 -> 기존 땅이 board
2. 연합 국가 찾기
    - bfs 탐색 통해 연합 국가 찾고, 연합 국가가 될 좌표들을 반환
3. 연합 국가가 존재한다면 인구 이동하기
    - 좌표들을 돌며 합을 구하고, 이를 연합을 이루는 칸의 개수로 나누어 board 갱신
4. 날짜를 하루 갱신하며, 연합 국가가 될 좌표가 반환되지 않을 때까지 2~3단계 반복

[📝 기록]
LV: 골드4
풀이 시간: 68분
'''

import sys
from collections import deque

input = sys.stdin.readline
board = []

n, l, r = map(int, input().split())

for i in range(n):
    line = list(map(int, input().split()))
    board.append(line)

visited = [[False for _ in range(n)] for _ in range(n)]
dirs = [[-1, 0], [1, 0], [0, 1], [0, -1]]

# 탐색
def bfs(i, j):
    q = deque([[i, j]])
    pos = set() # 같은 연합에 들어갈 국가의 좌표 저장 후 함수 종료 시 반환됨

    while q:
        x, y = q.popleft()
        
        for dir in dirs:
            nx, ny = x+dir[0], y+dir[1]

            if nx < 0 or nx >= n or ny < 0 or ny >=n: continue # 범위 벗어날 시
            if visited[nx][ny]: continue # 이미 방문했을 경우
            
            diff = abs(board[nx][ny] - board[x][y])

            # 차이가 조건 내일 경우
            if diff >= l and diff <= r:
                q.append([nx, ny])
                visited[x][y] = True
                visited[nx][ny] = True
                pos.add((x, y))
                pos.add((nx, ny))

    return list(pos) # 좌표 정보 리턴
    
day = 0 

# While문이 순회할 때마다 하루씩 지남
while True:
    # 방문 초기화
    visited = [[False for _ in range(n)] for _ in range(n)]

    # 국경선 열기 
    poses = []

    for i in range(n):
        for j in range(n):
            if not visited[i][j]: # 아직 방문하지 않은 곳이면
                positions = bfs(i, j)
                if positions: poses.append(positions) 

    if not poses: break # 반환된 연합 국가들의 좌표가 없다면 그대로 종료

    # 연합 국가가 존재한다면 인구이동하기
    for position in poses:
        cnt = len(position)
        sum = 0

        for pos in position:
            sum += board[pos[0]][pos[1]]

        elem = int(sum / cnt) # 소수점 버림

        for pos in position: board[pos[0]][pos[1]] = elem

    day += 1

print(day)