'''
[백준 1303] 전투
https://www.acmicpc.net/problem/1303

[📌 전략]
- bfs 문제

[✅ 풀이]
- 입력받은 board를 순회하며, 아직 방문하지 않았으면 방문하여 인접 노드들 bfs로 탐색
- bfs 탐색
    - 시작점부터 인접 노드를 탐색하며,같은 범위 내에 있논 노드이고, 병사이고, 아직 방문하지 않았으면 큐에 넣고 방문 처리
    - bfs 탐색 함수는(병사 종류, 뭉쳐진 인원)을 반환하여, 병사의 위력의 합을 최종적으로 구할 수 있도록 함


[📝 기록]
LV: 실버1
풀이 시간: 12분 
'''

import sys
from collections import deque

n, m = map(int, input().split())
board = []
visited = [[False for _ in range(n)] for _ in range(m)]

for _ in range(m):
    board.append(input())

dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]]

def bfs(i, j):
    q = deque([[i, j]])
    visited[i][j] = True
    cnt = 1 # i, j에 위치하는 시작점 병사도 포함

    while q: # 큐가 비어있지 않으면
        x, y = q.popleft()
         
        for dir in dirs: # 인접 노드를 순회하며
            nx, ny = x+dir[0], y+dir[1]

            if nx < 0 or nx >= m or ny < 0 or ny >= n: continue # 범위 체크
            if visited[nx][ny]: continue # 방문 체크
            if board[nx][ny] != board[x][y]: continue # 병사가 다르면 뭉칠 수 없음

            q.append([nx, ny])
            visited[nx][ny] = True
            cnt += 1

    return (board[i][j], cnt) # 현재 어떤 병사인지와 개수 반환

w, b = 0, 0

for i in range(m):
    for j in range(n):
        if not visited[i][j]: # 아직 방문하지 않았다면
            color, cnt = bfs(i, j)

            # 각각의 병사 위력의 합에 cnt 제곱을 더해줌
            if color == 'W': w += (cnt*cnt) 
            else: b += (cnt*cnt)

print(w, b)