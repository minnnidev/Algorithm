'''
[백준 10773] 제로
https://www.acmicpc.net/problem/10773

[📌 전략]
- 가장 최근에 쓴 수를 지운다 -> 큐로 접근

[✅ 풀이]
1. 입력받은 수에 따라 처리
    - 0일 경우 큐에서 pop
    - 이외의 경우는 큐에 append

[📝 기록]
LV: 실버4
풀이 시간: 5분
'''

import sys
from collections import deque 

k = int(sys.stdin.readline())
q = deque()

for _ in range(k):
    n = int(sys.stdin.readline())

    if n == 0: q.pop()
    else: q.append(n)

print(sum(q))