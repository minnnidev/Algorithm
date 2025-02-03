'''
[백준 1912] 연속합
https://www.acmicpc.net/problem/1912

[📌 전략]
- dp로 풀이

[✅ 풀이]
- nums 입력받음
- nums를 순회하며 이전 값을 현재 값에 더할 것
    - 단, 더한 값이 현재 값보다 클 때만 더해서 연속적인 최대 합을 구함

[📝 기록]
LV: 실버3
풀이 시간: 27분 
'''

import sys

input = sys.stdin.readline

n = int(input())
nums = list(map(int, input().split()))

for i in range(1, n):
    nums[i] = max(nums[i-1] + nums[i], nums[i])

print(max(nums))