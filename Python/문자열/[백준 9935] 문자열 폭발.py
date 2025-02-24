'''
[백준 9935] 문자열 폭발
https://www.acmicpc.net/problem/9935

[📌 전략]
- 시간 내에 풀기 위해 스택 자료구조 사용
- 계속해서 폭발을 해나가야 한다를 떠올렸을 때 스택이 떠올랐음

[✅ 풀이]
1. 스택 선언
2. 문자열을 순회
    - 문자열 스택에 문자 넣기
    - 문자열 스택 top쪽부터 폭발할 문자 길이만큼이 폭발할 문자와 같으면, 폭발시킴(스택 pop)
3. 스택에 남은 문자 출력

[📝 기록]
LV: 골드4
풀이 시간: 25분 
'''

import sys

input = sys.stdin.readline
original = input().strip()
boom = input().strip()
stack = []
boom_len = len(boom)

for word in original:
    stack.append(word)  

    if ''.join(stack[-boom_len:]) == boom:
        for _ in range(boom_len): stack.pop()

res = ''.join(stack)
print(res) if res else print("FRULA")