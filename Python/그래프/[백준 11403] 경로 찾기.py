'''
[백준 11403] 경로 찾기
https://www.acmicpc.net/problem/11403

[📌 전략]
인접 행렬 형식으로 주어진 그래프를 탐색하는 문제

[✅ 풀이]
1. 행렬을 사용해서 단방향 그래프 입력 처리
2. dfs 함수
    - 파라미터: cur(현재 노드), st(시작 노드)
    - cur의 인접 노드를 순회하며 board[st][nxt]가 방문 전이면 1로 갱신 후 해당 노드에서 dfs 탐색
    (board 배열을 visited 배열과 겸하여 사용
3. 0~n 순회하며 dfs 함수 호출

[📝 기록]
LV: 실버1
풀이 시간: 39분
'''

import sys

input = sys.stdin.readline

n = int(input())
g = [[] for _ in range(n)]
board = [[0 for _ in range(n)] for _ in range(n)]

# 행렬 입력 처리
for i in range(n):
    line = list(map(int, input().split()))

    for j in range(n):
        if line[j] == 1: g[i].append(j)

# dfs 함수
def dfs(cur, st):
    for nxt in g[cur]:
        if board[st][nxt] == 1: continue

        board[st][nxt] = 1
        dfs(nxt, st)

# dfs 탐색 수행
for i in range(n): dfs(i, i)

# 답안 출력
for i in range(n): print(*board[i])