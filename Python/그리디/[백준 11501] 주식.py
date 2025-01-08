'''
[백준 11501] 주식
https://www.acmicpc.net/problem/11501

[📌 전략]
- 가장 비쌀 때 팔아야 한다 -> 그리디
- 미래에 더 비싼 값이 있을 수도 있으므로 역순으로 탐색해야 함

[✅ 풀이]
max_price: 가장 비쌀 때 값

역순으로 탐색하며, 
현재 값이 max_price보다 작은 경우 사서 이득(max_price - 현재 가격)을 보고,
max_price보다 클 경우 해당 값으로 이득을 더 많이 볼 수 있기에 max_price 갱신

[📝 기록]
LV: 실버2
풀이 시간: 혼자 풀이하지 못함. 역순으로 탐색하지 않아 반례 발생함.
'''

import sys

input = sys.stdin.readline

t = int(input())

for _ in range(t):
    n = int(input())
    nums = list(map(int, input().split()))
    ans = 0
    max_price = 0
    
    for num in reversed(nums):
        if num > max_price:
            max_price = num
        else:
            ans += (max_price - num)

    print(ans)
