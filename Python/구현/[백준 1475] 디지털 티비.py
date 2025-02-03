'''
[백준 1475] 디지털 티비
https://www.acmicpc.net/problem/2816

[📌 전략]
- 1번으로 KBS까지 화살표를 이동하고, 4번으로 올림 
- KBS가 100번에 있어도 방법의 길이가 500보다 짧음

[✅ 풀이]
1. KBS1, KBS2 인덱스 위치 구함
2. KBS1의 인덱스만큼 1번, 4번 수행
3. KBS1이 KBS2보다 아래에 있는 경우 KBS1을 위로 움직이면서 KBS2가 아래로 하나 내려감
    -> KBS2 인덱스 1 추가
4. KBS2의 인덱스만큼 1번, KBS2의 인덱스-1만큼 4번 수행(2번째 채널로 지정해야 하므로)

[📝 기록]
LV: 브론즈1
풀이 시간: 브론즈였는데 40분 업...
'''

import sys

input = sys.stdin.readline

n = int(input())
strs = []
res = ""

for _ in range(n): strs.append(input().strip())

idx_k1 = strs.index('KBS1')
res += "1" * idx_k1
res += "4" * idx_k1

idx_k2 = strs.index('KBS2') 

# KBS1이 KBS2보다 아래에 있는 경우 KBS1을 위로 움직이면서 KBS2가 아래로 하나 내려감
if idx_k1 > idx_k2: idx_k2 += 1

res += "1" * idx_k2
res += "4" * (idx_k2-1)

print(res)                      