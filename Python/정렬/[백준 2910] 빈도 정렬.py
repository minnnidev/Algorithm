'''
[백준 2910] 빈도 정렬
https://www.acmicpc.net/problem/2910

[📌 전략]
- 등장하는 횟수와 횟수가 같으면 먼저 등장하는 정렬 기준 사용
- 먼저 등장하는지 여부는 append 순서로 따져주었고, 이후에 등장하는 횟수로 정렬하여 해결

[✅ 풀이]
1. 입력받은 nums를 순회하며 arr에 append
    - arr을 순회하며, 이전에 등장한 저이 있으면 빈도 수만 갱신
    - 이전에 등장한 적이 없다면 arr에 [현재 단어, 1]을 추가 
2. 빈도 수의 내림차순으로 정렬
3. 출력

[📝 기록]
LV: 실버3
풀이 시간: 15분
'''

import sys 

input = sys.stdin.readline

n, _ = map(int, input().split())
nums = list(map(int, input().split()))

arr = []

for num in nums:
    is_appeared = False

    for e in arr: 
        if e[0] == num: 
            is_appeared = True
            e[1] += 1

    if not is_appeared: arr.append([num, 1])

sorted_arr = sorted(arr, key= lambda x: -x[1])

for e in sorted_arr:
    print((str(e[0]) + ' ') * e[1], end='')