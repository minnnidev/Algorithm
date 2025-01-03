'''
[백준 5567] 결혼식
https://www.acmicpc.net/problem/5567

[📌 전략]
- 상근이의 친구, 친구와 친구까지의 개수 파악하기
-> 뻗어나가며 그래프 탐색

[✅ 풀이]
1. 양방향 그래프 입력 처리
2. bfs 탐색
    - 큐에는 [현재 노드, 현재 관계 깊이]로 나타냄
    - 큐에 요소가 존재할 동안 로직 반복
    - 첫 번째 요소를 popLeft 했을 때 cnt >= 2인 경우 친구의 친구의 친구가 되는 것이므로 탐색 종료
    - 이외의 경우는 g[cur]의 인접 노드를 순회하며 아직 방문하지 않았을 경우 큐에 (인접 노드, cnt+1)을 넣어 재탐색

[📝 기록]
LV: 실버2
풀이 시간: 22분

dfs로 접근했다가 친구의 친구를 접근하는 과정과 방문 처리하는 과정이 중복이 되는 오류를 발견하여
bfs로 풀이하였음
'''

import sys
from collections import deque

input = sys.stdin.readline

n = int(input())
m = int(input())

g = [[] for _ in range(n+1)]
visited = [False] * (n+1)

# 그래프 입력 처리
for _ in range(m):
    a, b = map(int, input().split())
    g[a].append(b)
    g[b].append(a)

ans = 0

# bfs 탐색
def bfs():
    global ans

    q = deque([[1, 0]])
    visited[1] = True

    while q:
        cur, cnt = q.popleft()

        if cnt >= 2: return

        for nxt in g[cur]:
            if visited[nxt]: continue

            visited[nxt] = True
            ans += 1
            q.append([nxt, cnt+1])

bfs()
print(ans)