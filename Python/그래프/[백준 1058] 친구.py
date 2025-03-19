'''
[백준 1058] 친구
https://www.acmicpc.net/problem/1058

[📌 전략]
- 2-친구: 그래프 depth가 2까지인 친구를 의미함.
- 각 친구로부터 출발하여 depth 2까지인 친구를 모두 세기
- 2-친구가 뭔지 이해하느라 시간이 오래 걸림

[✅ 풀이]
1. 모든 친구를 시작점으로 하여 bfs 실시 후, depth 2까지의 친구 수를 구함
2. bfs 함수
    - 큐에 [출발점, 현재 depth(0)] 추가
    - 2-친구를 cnt 선언
    - 큐에 요소가 존재한다면 순회 실시
    - 첫 번째 요소 popleft -> pop한 요소의 depth가 3보다 크면 더이상 탐색하지 않아도 되므로 cnt 반환
    - 현재 요소의 주변 노드를 순회. 아직 방문하지 않은 노드라면 큐에 넣기 [인접 노드, 현재 depth+1]
    - depth+1을 했을 때 3보다 작다면, 2-친구에 포함이므로 cnt 반환

[📝 기록]
LV: 실버2
시간: 43분
'''

import sys
from collections import deque

input = sys.stdin.readline

n = int(input())
g = [[] for _ in range(n)]

for i in range(n):
    line = input().strip()

    for idx, w in enumerate(line):
        if w == 'Y':
            g[i].append(idx)

visited = [False for _ in range(n)]

def bfs(i):
    q = deque([[i, 0]])
    visited[i] = True
    cnt = 0

    while q:
        v, depth = q.popleft()

        if depth >= 3: return cnt

        for nxt in g[v]:
            if visited[nxt]: continue
            
            visited[nxt] = True
            q.append([nxt, depth+1])

            if depth+1 < 3:  cnt += 1

    return cnt

ans = 0

for i in range(n):
    visited = [False for _ in range(n)]
    ans = max(ans, bfs(i))

print(ans)