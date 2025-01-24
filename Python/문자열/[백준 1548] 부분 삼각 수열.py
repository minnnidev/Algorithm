'''
[백준 1548] 부분 삼각 수열
https://www.acmicpc.net/problem/23971

[📌 전략]
- 완전 탐색 문제
- 세 수 x, y, z가 오름차순으로 정렬되어 있다고 할 때, x + y > z를 만족하면 삼각수열을 만족함

[✅ 풀이]
1. 입력받은 수열을 오름차순으로 정렬
2. nums[0]~nums[n-2]를 x로 기준을 잡고 z는 nums[x+1]~nums[n-1]을 기준으로
    nums[x]+nums[x+1]>nums[z]인지 확인

[📝 기록]
LV: 실버1
풀이 시간: 23분 (맞았으나 시간 오버)
'''

import sys

input = sys.stdin.readline

n = int(input())
nums = list(map(int, input().split()))
nums.sort()

ans = 1

for x in range(n-1):
    for z in range(n-1, x, -1):
        if nums[x]+nums[x+1] > nums[z]:
            ans = max(ans, z-x+1)

print(ans)