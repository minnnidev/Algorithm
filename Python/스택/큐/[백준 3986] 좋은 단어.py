'''
[백준 3986] 좋은 단어
https://www.acmicpc.net/problem/3986

[📌 전략]
- 쌍을 첮는 방법에서 스택 이용

[✅ 풀이]
1. 입력받은 문자열에 따라 check 함수 호출
2. check 함수
    - 파라미터 str을 순회
    - 현재 스택이 비어 있거나, 현재 문자가 top이랑 같지 않다면 스택에 push
    - top이랑 같다면 스택을 pop -> 쌍을 지음

[📝 기록]
LV: 실버4
풀이 시간: 18분
'''

import sys

input= sys.stdin.readline

n = int(input())
ans = 0

def check(str):
    stack = []

    for w in str:
        if not stack: 
            stack.append(w)
            continue

        if stack[-1] == w:
            del stack[-1]
        else:
            stack.append(w)

    return 1 if not stack else 0

for _ in range(n):
    str = input().strip()
    ans += check(str)

print(ans)