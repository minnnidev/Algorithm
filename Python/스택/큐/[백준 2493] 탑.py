'''
[백준 2493] 탑
https://www.acmicpc.net/problem/2493

[📌 전략]
- n의 범위에 따라 이중 for문 사용 시 시간 초과 발생
- 스택 구조를 활용한 O(n) 풀이

[✅ 풀이]
1. i로 0~n을 순회
    1-1. 스택이 비어있지 않은 경우
        - 스택의 top이 towers[i]보다 크다면, ans[i]는 stack의 top+1 값이 된다. 
            왼쪽으로 가장 최근에 만나면서 towers[i]보다 큰 탑에 신호가 부딪히기 때문.
        - 이외의 경우는 pop()
            towers[i]가 더 크다면, 남은 오른쪽 탑들이 레이저 신호를 쐈을 때, 어차피 towers[i]가 더 커서 해당 탑으로 신호가 도착
            (1-2번에서 stack에 해당 탑 추가 예정)
    1-2. 스택에 현재 i 추가
2. ans 출력

[📝 기록]
LV: 골드5
*혼자 풀이하지 못하였음
'''

import sys

input = sys.stdin.readline

n = int(input())
towers = list(map(int, input().split()))
stack = []
ans = [0] * n

for i in range(n):
    while stack:
        if towers[i] < towers[stack[-1]]:
            ans[i] = stack[-1] + 1
            break
        else:
            stack.pop()

    stack.append(i)

print(*ans)
