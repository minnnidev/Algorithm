'''
[백준 5648] 역원소 정렬
https://www.acmicpc.net/problem/5648

[📌 전략]
- 입력 처리 주의

[✅ 풀이]
1. 입력 처리
2. 입력받은 리스트를 슬라이싱으로 역순으로 변경
3. int형으로 매핑
4. 출력

[📝 기록]
LV: 실버5
풀이 시간: 16분
'''

import sys

input = sys.stdin.read # 전체 읽기 - EOF로 종료

n, *s = input().split() # n과 가변 길이 데이터로 처리

for i in range(int(n)): s[i] = s[i][::-1] # 리스트 슬라이싱 및 역순 처리

s = list(map(int, s))

print(*sorted(s), sep = "\n") # 언패킹 연산자