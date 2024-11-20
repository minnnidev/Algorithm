'''
[백준 1012] 유기농 배추
https://www.acmicpc.net/problem/1012

[📌 전략]
상하좌우 이동 필요 -> bfs 풀이

[✅ 풀이]
배추가 심어져 있는 곳(1)에서 시작해서 배추흰지렁이가 이웃하여 이동할 수 있는 모든 곳 파악하기(bfs 팀색)

1. arr을 순회하며 배추가 심어져 있는곳(1)일 경우에만 bfs 탐색 실시 
2. (i, j) 좌표를 기준으로 bfs 탐색
    2-1. 큐 생성하고 (i, j) 추가
    2-2. 큐가 빌 때까지 탐색 반복
        - popLeft를 통해 첫 번째 요소 pop
        - 첫 번째 요소 기준 상하좌우를 탐색하여 인덱스 범위 내에 있고, 배추가 심어져 있을 경우 큐에 넣고 재탐색
        - 해당 인접칸은 0으로 변경해서 방문 처리
3. 총 배추흰지렁이의 개수는 bfs 탐색을 실시한 횟수와 일치
'''
import sys
from collections import deque

input = sys.stdin.readline

# tc 분리
t = int(input())

def bfs(i, j):
    q = deque([[i, j]])
    arr[i][j] = 0

    while q:
        x, y = q.popleft()

        for dir in dirs:
            nx, ny = x+dir[0], y+dir[1]

            if nx < 0 or nx >= n or ny < 0 or ny >= m: continue
            if arr[nx][ny] == 0: continue

            q.append([nx, ny])
            arr[nx][ny] = 0

for a in range(t):
    # input
    m, n, k = map(int, input().split())
    arr = [[0 for j in range(m)] for i in range(n)]
    dirs =  [[-1, 0], [1, 0], [0, 1], [0, -1]]

    for a in range(k):
        i, j = map(int, input().split())
        arr[j][i] = 1

    ans = 0

    for i in range(n):
        for j in range(m):
            if arr[i][j] == 1:
                bfs(i, j)
                ans += 1

    print(ans)