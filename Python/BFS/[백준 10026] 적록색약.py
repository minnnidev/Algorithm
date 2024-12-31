'''
[백준 10026] 적록색약
https://www.acmicpc.net/problem/10026

[📌 전략]
- 인접 칸/구역 찾기 -> bfs 활용
- 최종 답인 구역 개수 == bfs 탐색을 실시한 횟수

[✅ 풀이]
1. 적록색약 x: 아직 방문하지 않은 칸부터 bfs 탐색 실시
    - 출발 노드를 큐에 넣고 방문 처리
    - 큐에 요소가 존재할 때 반복
        - 사방의 인접칸들을 순회
        - 인접칸이 범위 내에 있고, 아직 방문하지 않았고, 같은 색이라면 큐에 넣고 방문 처리
2. 적록색약 o: 
    - visited 배열 초가화
    - 초록색과 빨간색을 동등하게 취급하므로 초록색을 빨간색으로 모두 변환
    - 1번과 같이 bfs 탐색 실시

[📝 기록]
LV: 골드5
풀이 시간: 22분
'''

import sys
from collections import deque

n = int(sys.stdin.readline())
arr = [["" for _ in range(n)] for _ in range (n)]
visited = [[False for _ in range(n)] for _ in range (n)]

for i in range(n): arr[i] = list(sys.stdin.readline().strip())

dirs = [[-1, 0], [1, 0], [0, 1], [0, -1]]

def bfs(i, j):
    q = deque([[i, j]])
    visited[i][j] = True

    while q:
        x, y = q.popleft()

        for dir in dirs:
            nx, ny = x + dir[0], y + dir[1]

            if nx < 0 or nx >= n or ny < 0 or ny >= n: continue
            if visited[nx][ny] == True: continue
            
            if (arr[x][y] == arr[nx][ny]):
                q.append([nx, ny])
                visited[nx][ny] = True

# check: 그리드를 순회하며 bfs 탐색 실시
def check():
    res = 0
    for i in range(n):
        for j in range(n):
            if visited[i][j] == False:
                bfs(i, j)
                res += 1
    return res

# 적록색약 X
ansA = check()

# 적록색약 O
# G -> R로 변환
for i in range(n):
    for j in range(n):
        if arr[i][j] == "G": arr[i][j] = "R"

# visited 초기화
visited = [[False for _ in range(n)] for _ in range (n)]

ansB = check()

print(ansA, ansB)