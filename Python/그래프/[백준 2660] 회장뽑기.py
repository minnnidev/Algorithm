'''
[백준 2660] 회장뽑기
https://www.acmicpc.net/problem/2660

[📌 전략]
- 한 회원을 기준으로 모든 회원과의 관계의 depth를 파악하는 문제 

[✅ 풀이]
1. 양방향 그래프 입력 처리
2. bfs 탐색 실시
    - 큐에 (노드, depth) 형식으로 요소 추가
    - 큐에 요소가 존재한다면, 인접 노드를 탐방
        - 아직 방문하지 않았다면, 방문 처리하고 (인접 노드, depth+1)을 큐에 추가
        - depth를 체크하여 가장 깊숙이 탐색하는 친구를 찾음 (res값)
    - 탐색이 끝나면 res 반환 -> 해당 회원의 점수와 같음
3. 각 회원마다 bfs 탐색을 실시하여 점수 파악
4. 가장 작은 점수를 찾고, 해당 점수를 가진 회원의 번호를 찾아 정렬하여 출력

[📝 기록]
LV: 실버5
풀이 시간: 20분
'''

import sys
from collections import deque

input = sys.stdin.readline

n = int(input())

g = [[] for _ in range(n+1)]

# 그래프 입력 처리
while True:
    a, b = map(int, input().split())

    if a == -1 and b == -1: break

    g[a].append(b)
    g[b].append(a)

# bfs 탐색
def bfs(st, visited):
    q = deque([[st, 0]])
    visited[st] = True
    res = 0

    while q:
        cur, depth = q.popleft()

        for nxt in g[cur]:
            if visited[nxt]: continue

            visited[nxt] = True
            res = max(res, depth+1)
            q.append([nxt, depth+1])

    return res


scores = []
cands = []
min_score = 100 # 편의상 100 (최대 회원 수가 50이므로 50 이상 설정)

# 각 회원마다 bfs 탐색을 실시하고, 가장 작은 min_score 구함
for i in range(1, n+1):
    visited = [False] * (n+1)

    score = bfs(i, visited)
    scores.append(score)

    if score < min_score: min_score = score

# min_score과 같은 점수를 가진 회원 찾음
for (idx, score) in enumerate(scores):
    if min_score == score: cands.append(idx+1)

# 출력
print(min_score, len(cands))
print(*(sorted(cands)))