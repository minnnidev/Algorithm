'''
[백준 23971] ZOAC 4
https://www.acmicpc.net/problem/23971

[📌 전략]
- 올림을 사용하는 수학 문제
- 최대로 수용하기 위해서는 최소 간격만 두고 모두 수용해야 함

[✅ 풀이]
1. h, w, n, m 차례로 입력 받음
2. w를 m+1로 나누고 올림: 가로로 최대로 수용할 수 있는 인원 수
   h를 n+1로 나누고 올림: 세로로 최대로 수용할 수 있는 인원 수
3. 위 값들을 곱하면 강의실이 수용할 수 있는 전체 최대 인원 수

[📝 기록]
LV: 브론즈3
풀이 시간: 7분
'''

import sys
import math

input = sys.stdin.readline

h, w, n, m = map(int, input().split())

print(math.ceil(w/(m+1)) * math.ceil(h/(n+1)))