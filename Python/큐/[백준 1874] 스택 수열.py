'''
[백준 1874] 스택 수열
https://www.acmicpc.net/problem/1874


[✅ 풀이]
1. 1 ~ n을 i로 순회하며 로직 처리
    1-1. 입력받은 nums[0]의 값과 큐의 top이 같다면, 안 같을 때까지 계속 pop
         nums[0]도 삭제해 줘야 하는데, 시간 단축 위해 인덱싱으로 처리
         ans에 - 추가
    1-2. 큐에 i를 append하고 ans에 + 추가
2. 1 ~ n까지 순회를 마무리하고, 큐에 남은 요소들을 차례로 pop
    이때 남은 nums 수열과 같지 않다면 ans를 전부 비워 NO 처리
3. ans 출력

[📝 기록]
LV: 실버4
풀이 시간: 27분
'''

import sys
from collections import deque

n = int(sys.stdin.readline())

nums = []
for _ in range(n): nums.append(int(sys.stdin.readline()))

q = deque()
ans = []
idx = 0

for i in range(1, n+1): 
    while q:
        if q[-1] == nums[idx]:
            q.pop()
            idx += 1
            ans.append("-")
        else:
            break
    
    q.append(i)
    ans.append("+")

while q:
    if q[-1] == nums[idx]:
        q.pop()
        idx += 1
        ans.append("-")
    else:
        ans = []
        break

if ans == []: print("NO")
else:
    for op in ans:
        print(op)