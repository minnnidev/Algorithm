'''
[백준 20166] 문자열 지옥에 빠진 호석
https://www.acmicpc.net/problem/20166

[📌 전략]
- 단순 bfs로 풀이할 시 시간 초과 발생
- 시간 단축 위한 딕셔너리 사용

[✅ 풀이]
1. 각 문자들을 돌며 bfs 실시 -> 가능한 문자열들을 찾아 딕셔너리에 문자열: 개수 형식으로 저장
    큐 요소를 popleft
    아직 딕셔너리에 없다면, 딕셔너리에 추가하고 1
    있다면 +1하여 갱신

    신이 좋아하는 문자열 최대 개수(5)보다 작을 시 상하좌우, 대각선 방향을 전부 순회하며 가능한 문자열들을 찾음
    이때 문제의 조건에 맞는 인덱스 보정 필요

2. 입력받은 신이 좋아하는 문자열을 키로하여 그 값을 출력
    딕셔너리에 존재하지 않을 때는 0을 출력

[📝 기록]
LV: 골드4
풀이 시간: 50분
'''

import sys
from collections import deque

input = sys.stdin.readline

n, m, k = map(int, input().split())
board = []
words = []

for _ in range(n): board.append(input().strip())

for _ in range(k): words.append(input().strip())

# 상하좌우 + 대각선
dirs = [(-1, 0), (1, 0), (0, 1), (0, -1), (1, -1), (1, 1), (-1, 1), (-1, -1)]
dict = dict() # 가능한 문자열들을 저장할 딕셔너리

def bfs(i, j):
    q = deque([[i, j, board[i][j]]])

    while q:
        x, y, w = q.popleft()

        # 딕셔너리에 없으면 추가
        if w not in dict:
            dict[w] = 1
        else: # 있다면 갱신
            dict[w] += 1

        # 신이 좋아하는 문자열의 최대 개수를 넘으면
        if len(w) >= 5: continue

        for dir in dirs:
            nx, ny = x+dir[0], y+dir[1]

            # 인덱스 보정
            if nx < 0: nx = n-1 # -1일 경우, n-1
            if nx >= n: nx = 0 # n일 경우, 0
            if ny < 0: ny = m-1 # -1일 경우, m-1
            if ny >= m: ny = 0 # m일 경우 0

            # 기존 문자열 w에 board[nx][ny]를 추가하여 큐에 넣음
            q.append([nx, ny, w + board[nx][ny]])

for i in range(n):
    for j in range(m):
        bfs(i, j)

for word in words:
    if word in dict:
        print(dict[word])
    else:
        print(0)