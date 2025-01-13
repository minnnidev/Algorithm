'''
[백준 1351] 무한 수열
https://www.acmicpc.net/problem/1351

[📌 전략]
- 0 ≤ N ≤ 10^12 -> 리스트 사용 불가, 딕셔너리로 접근

[✅ 풀이]
1. 무한 수열의 형태를 그려보면 트리 구조로 나타낼 수 있고 이를 재귀 함수로 표현
2. 현재 cur이 딕셔너리에 존재할 시 그대로 cur의 value 리턴
3. 존재하지 않을 시 
    딕셔너리의 cur 키에 infinity(math.floor(cur/p)) + infinity(math.floor(cur/q)) value 
    저장 및 cur의 value 리턴

[📝 기록]
LV: 골드5
'''

import sys
import math

input = sys.stdin.readline
n, p, q = map(int, input().split())

my_dict = dict()
my_dict[0] = 1

def infinity(cur):
    if cur in my_dict:
        return my_dict[cur] 
    else:
        my_dict[cur] = infinity(math.floor(cur/p)) + infinity(math.floor(cur/q))
        return my_dict[cur]

print(infinity(n))