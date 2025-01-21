'''
[백준 1389] 케빈 베이컨의 6단계 법칙
https://www.acmicpc.net/problem/1389

[📌 전략]
그래프 탐색을 통해 루트노드에 따른 각 노드에 대한 depth 값을 찾는 문제

[✅ 풀이]
1. 입력받아 그래프를 나타내기 위해 배열 구현
2. 1~n을 루트로 bfs 탐색 실시
3. bfs 함수 (리턴값은 루트노드로부터 각 노드(인덱스 번호에 해당)까지의 depth 배열)
    - 큐에 루트노드를 추가할 때, depth[루트노드]도 0으로 설정
    - 큐를 순회하며, popleft
    - popleft한 요소의 depth가 0이상이면 이미 방문했다는 것이므로 continue
    - 이외의 경우는 depth 값을 갱신하여 다시 큐에 넣어줌
4. 루트노드를 기준으로 bfs 탐색을 실시하여 반환받은 depth 배열의 요소들의 합을 구하여 
    가장 작은 케빈 베이컨을 가진 사람을 찾음


[📝 기록]
LV: 실버1
풀이 시간: 19분
'''

import sys
from collections import deque

input = sys.stdin.readline

n, m = map(int, input().split())
g = [[] for _ in range(n+1)]

for _ in range(m):
    a, b = map(int, input().split())
    g[a].append(b)
    g[b].append(a)

def bfs(k):
    q = deque([k])
    depths = [-1 for _ in range(n+1)]
    depths[k] = 0

    while q:
        cur = q.popleft()

        for nxt in g[cur]:
            if depths[nxt] >= 0: continue
            
            depths[nxt] = depths[cur] + 1
            q.append(nxt)

    return depths

arr = []
for i in range(1, n+1): arr.append(sum(bfs(i)[1::]))

min_index = arr.index(min(arr))
print(min_index+1)