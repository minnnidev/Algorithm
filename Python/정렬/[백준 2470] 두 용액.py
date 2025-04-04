'''
[백준 2470] 두 용액
https://www.acmicpc.net/problem/2470

[📌 전략]
- N의 최댓값이 100,000이므로, 반복문 불가 -> 투 포인터로 풀이함

[✅ 풀이]
- 입력받은 전체 용액 리스트를 오름차순으로 정렬
- 첫 번째 요소를 st, 마지막 요소를 en으로 투포인터 수행
- 투 포인터 로직
    - st < en을 만족하면 반복, int형의 max값을 tmp의 값으로 설정(0에 가장 가까운 값을 찾기 위해)
    - nums[st] + nums[en]의 sum 값이 tmp보다 작다면, 0에 가장 가까운 값이 갱신됨.
    - sum < 0 -> 0에 더 가까워지기 위해서는 커져야 하므로, st를 오른쪽으로 하나 이동
    - sum == 0 -> 0에 가장 가까운 값이므로 바로 답으로 채택
    - sum > 0 -> 0에 더 가까워지기 위해서는 작아져야 하므로, en을 왼쪽으로 하나 이동

[📝 기록]
LV: 골드5
풀이 시간: 14분
'''

import sys

input = sys.stdin.readline

n = int(input())
nums = list(map(int, input().strip().split()))
nums.sort()

st = 0
en = n-1

tmp = sys.maxsize
ans = [0, 0]

while st < en:
    sum = nums[st] + nums[en]

    if abs(sum) < tmp:
        tmp = abs(sum)
        ans = [nums[st], nums[en]]

    if sum < 0:
        st +=1
    elif sum == 0:
        ans = [nums[st], nums[en]]
        break
    else:
        en -= 1

print(ans[0], ans[1])