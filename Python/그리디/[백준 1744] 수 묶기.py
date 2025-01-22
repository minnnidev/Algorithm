'''
[백준 1744] 수 묶기
https://www.acmicpc.net/problem/1744

[✅ 풀이]
1. 음수 -> -끼리 묶거나 0이랑 곱해야 최대
2. 양수 -> +끼리 묶거나 그냥 두고 더하는 게 최대
    - ex. 1+2 > 1*2
    - ex. 2*3 > 2+3

-> 입력받은 숫자들을 오름차순으로 정렬한 뒤, 음수+0 / 양수로 배열을 나누고 수를 묶기


[📝 기록]
LV: 골드4
풀이 시간: 29분
'''

import sys

input = sys.stdin.readline

n = int(input())
nums = []

for _ in range(n): nums.append(int(input()))
nums.sort() # 정렬

# 음수 + 0 / 양수로 나누기
negatives = []
positives = []

for num in nums:
    if num > 0: break
    negatives.append(num)

for num in nums:
    if num <= 0: continue
    positives.append(num)

# 묶기
n_cnt = len(negatives)
idx = 0

# 음수+0일 때
while idx < n_cnt-1:
    # 음수는 묶을 수 있다면 무조건 묶어야 최대가 됨
    negatives[idx] = (negatives[idx] * negatives[idx+1])
    negatives[idx+1] = 0 # 묶을 때 사용한 수는 0으로 변경
    idx += 2

p_cnt = len(positives)
idx = p_cnt-1

# 양수일 대
while idx > 0:
    # 양수는 더한 게 최대일 수도 있고, 곱한 게 최대일 수 도 있음
    tmp_sum = (positives[idx] + positives[idx-1])
    tmp_mul = (positives[idx] * positives[idx-1])

    positives[idx] = max(tmp_sum, tmp_mul) # 최대 값 선택
    positives[idx-1] = 0 # 묶을 때 사용한 수는 0으로 변경
    idx -= 2

# 음수 배열과 양수 배열의 합이 최종 답안
print(sum(negatives) + sum(positives))