'''
[백준 1189] 컴백홈
https://www.acmicpc.net/problem/1189

[📌 전략]
- 한수가 이동하는 행위를 머릿속으로 그려보면, 백트래킹이 사용되기 때문에 dfs로 풀이하는 게 편리함

[✅ 풀이]
1. dfs 함수(x 좌표, y좌표, 현재까지 이동한 거리 distance)
    - x, y 좌표가 맨 오른쪽 위의 집 좌표와 같고 dist가 k와 같을 때는 1을 리턴하여 개수에 포함되도록 함
    - 왼쪽 맨 아래 한수 위치부터 시작. 처음 시작 위치도 거리에 포함하여 dist는 1로 넣어주어야 함.
    - 정답을 카운트할 total 변수 선언
    - 인접 4방향을 순회하면서 인접칸이 범위 안에 있고, 아직 방문하지 않았고, T가 아닌 조건일 때만 다음 단계로
    - 방문 처리 및 dfs함수 호출. dfs(인접칸의 x좌표, 인접칸의 y좌표, dist+1). 반환값은 total에 반영되도록 함
    - dfs 함수 종료 시 다시 방문할 수 있도록 방문 해제 🌟
    - 최종적으로 total을 리턴
    
[📝 기록]
LV: 실버1
시간: 38분
'''

import sys
from collections import deque

input = sys.stdin.readline

r, c, k = map(int, input().strip().split())
board = []
for _ in range(r): board.append(input().strip())

dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]]
visited = [[False for _ in range(c)] for _ in range(r)]

def dfs(i, j, dist):
    if i == 0 and j == c-1 and dist == k: return 1
    total = 0

    for dir in dirs:
        nx, ny = i + dir[0], j + dir[1]

        if nx < 0 or nx >= r or ny < 0 or ny >= c: continue
        if visited[nx][ny]: continue
        if board[nx][ny] == 'T': continue

        visited[i][j] = True
        total += dfs(nx, ny, dist+1)
        visited[i][j] = False

    return total


visited[r-1][0] = True
print(dfs(r-1, 0, 1))