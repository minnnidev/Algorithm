'''
[백준 1327] 소트 게임
https://www.acmicpc.net/problem/1327

[📌 전략]
- 모든 경우를 효율적으로 돌아본다 -> bfs
- 뒤집었을 때 이미 방문했던 문자열이면 다시 방문할 필요 없다 -> 해시

[✅ 풀이]
1. 모두 뒤집어 보기 위해 bfs를 활용하고, 방문 처리에 딕셔너리를 활용
2. 큐에 [뒤집은 문자열, 현재 선택한 개수] 형식으로 넣을 것. 
    -> 따라서 초깃값은 [입력받은 순열, 0]
3. 큐에 요소가 존재할 때까지 순회
    3-1.큐에서 popleft한다. 해당 문자열이 정답 문자열과 같다면 그대로 리턴.
        아니라면 문자열을 k개씩 뒤집어본다.
    3-2. 뒤집은 문자열을 방문한 적이 있다면 패스
    3-3. 방문한 적이 없다면 선택 개수를 1 갱신하여 큐에 넣음

[📝 기록]
LV: 골드4
풀이 시간: 혼자 풀이하지 못함.
'''

from collections import deque
import sys

input = sys.stdin.readline
n, k = map(int, input().strip().split())
nums = input().strip().split() # 입력받은 순열
nums_str = ''.join(nums) # 순열을 문자열로 합침 (관리하기 쉽게)
res = ''.join(sorted(nums)) # 만들어야 할 최종 문자열
v_dict = {} # 방문 처리를 할 딕셔너리

def bfs(): # bfs 탐색 실시
    q = deque([[nums_str, 0]]) # [뒤집은 문자열, 현재 선택한 수의 개수]
    v_dict[nums_str] = True # 초기 방문 처리

    while q:
        f, cnt = q.popleft()

        if f == res: return cnt # popleft한 값이 결과와 같으면 cnt 리턴

        for s in range(len(nums)-k+1):
            # s부터 k만큼 뒤집고 문자열로 변환
            tmp_f = list(f)
            tmp_f[s:s + k] = reversed(tmp_f[s:s + k]) 
            tmp_str = ''.join(tmp_f)

            if tmp_str in v_dict: continue # 방문한 적이 있다면 넘어감
            v_dict[tmp_str] = True # 없다면 방문처리

            q.append([tmp_str, cnt+1]) # 수의 개수를 하나 늘려줌

    # 이 줄까지 오면 오름차순으로 만들 수 없다는 뜻
    return -1

print(bfs())