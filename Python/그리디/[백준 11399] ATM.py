'''
[백준 11399] ATM
https://www.acmicpc.net/problem/11399

[📌 전략]
- 가장 빨리 돈을 인출하는 사람부터 인출해야 모두가 덜 기다리게 된다
-> 정렬, 그리디

[✅ 풀이]
1. 입력받은 시간들을 오름차순으로 정렬
2. 정렬된 시간들을 순회하며 누적합을 구함

[📝 기록]
LV: 실버4
풀이 시간: 8분
'''

import sys

input = sys.stdin.readline

n = int(input())
times = list(map(int, input().split()))

times.sort()

ans, sum = 0, 0

for time in times:
    sum += time
    ans += sum

print(ans)