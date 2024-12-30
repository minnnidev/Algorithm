'''
[프로그래머스] 게임 맵 최단거리
https://school.programmers.co.kr/learn/courses/30/lessons/1844#

[📌 전략]
기본 BFS 문제

[✅ 풀이]
(n, m이 다를 수 있다는 점 주의)

1. 방문 경로 체크할 visited 배열 선언
2. 큐에 [시작점x, 시작점y, 현재 지난 칸수(1)] 넣고, visited 배열에서 시작점 방문 처리
3. 큐가 빌 때까지 bfs 탐색
    3-1. 동서남북 네 방향 탐색 실시, 인덱스 범위가 벗어나거나, 이미 방문했거나, 벽일 경우는 패스
    3-2. 이외의 경우에는 큐에 append하고 방문 처리
4. solution 함수 끝에 도달했을 경우, 도착점에 도달 불가능하므로 -1 반환
'''

from collections import deque

dirs = [(-1, 0), (1, 0), (0, 1), (0, -1)]

def solution(maps):
    n = len(maps)
    m = len(maps[0])
    visited = [[False] * m for _ in range(n)]
    
    queue = deque([[0, 0, 1]])
    visited[0][0] = True
    
    while queue:
        cur = queue.popleft()
        x, y, cnt = cur[0], cur[1], cur[2]
        
        if x == n-1 and y == m-1:
            return cnt
        
        for dir in dirs:
            nx, ny = x+dir[0], y+dir[1]
            
            if nx < 0 or nx >= n or ny < 0 or ny >=m: continue
            if visited[nx][ny]: continue
            if maps[nx][ny] == 0: continue
            
            queue.append([nx, ny, cnt+1])
            visited[nx][ny] = True
        
    return -1