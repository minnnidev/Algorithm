'''
[백준 2606] 바이러스
https://www.acmicpc.net/problem/2606

[📌 전략]
- 1번 노드를 시작으로 바이러스가 퍼져나가는 노드 개수 탐색 -> dfs 사용

[✅ 풀이]
1. 양방향 그래프 입력
2. dfs 탐색
    - 파라미터로 받은 cur 노드를 기준으로 이웃한 노드를 순회하며 dfs 함수 재귀 호출
3. dfs(1) 호출

[📝 기록]
LV: 실버3
풀이 시간: 15분
'''

import sys

input = sys.stdin.readline

n = int(input())
m = int(input())

g = [[] for _ in range(n+1)]
visited = [False] * (n+1)

for _ in range(m): 
    e, v = map(int, input().split())
    g[e].append(v)
    g[v].append(e)

ans = 0

def dfs(cur):
    global ans
    visited[cur] = True

    for nxt in g[cur]:
        if visited[nxt]: continue

        ans += 1
        dfs(nxt)

dfs(1)
print(ans)