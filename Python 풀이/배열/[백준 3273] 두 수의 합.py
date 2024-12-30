'''
[백준 3273] 두 수의 합
https://www.acmicpc.net/problem/3273

[📌 전략]
- 이중 for문 풀이는 시간 초과로 인해 불가 
    -> 포인터를 움직여가며 O(n)에 해결하도록 투포인터로 풀이

[✅ 풀이]
1. 입력받은 숫자들 정렬
2. st, en 포인터 선언 
3. while 문을 통해 순회
    nums[st]와 nums[en]의 값의 합이
    x와 같다면 카운트해 주고, st 오른쪽으로 이동
    x보다 작다면, 합이 더 커져야 하므로 st를 오른쪽으로 이동
    x보다 크다면, 합이 작아져야 하므로 en을 왼쪽으로 이동 

[📝 기록]
LV: 실버3
풀이 시간: 15분
'''

import sys

n = int(sys.stdin.readline())
nums = list(map(int, sys.stdin.readline().split()))
x = int(sys.stdin.readline())

nums.sort()

st = 0
en = n-1
ans = 0

while st < en:
    sum = nums[st] + nums[en]

    if sum == x: 
        ans += 1
        st += 1
    elif sum < x:
        st += 1
    else:
        en -= 1

print(ans)