'''
[백준 2142] 우체국
https://www.acmicpc.net/problem/2141

[📌 전략]
- 그리디
- 총합을 줄이려면 사람 수 분포의 중앙값 쪽에 우체국을 세우는 게 유리함

[✅ 풀이]
- 각 사람까지의 거리의 합: 거리 * 그 마을에 있는 사람 수 🌟
- (마을 위치, 사람 수)를 입력받을 때 사람의 총합도 함께 구함(peopleCnt) -> 후에 중앙값 찾기 위해 
- 마을을 오름차순으로 정렬 -> 중앙값보다 크거나 같은 가장 첫 번째 값을 찾아야 하므로
- towns 배열을 순회하며 중앙값보다 크거나 같은 가장 첫 번째 값을 찾고 출력

[📝 기록]
LV: 골드4
비고: 혼자 풀이하지 못함
'''

import sys

input = sys.stdin.readline
towns = []

n = int(input())

peopleCnt = 0
townPos = 0

for i in range(n):
    town, cnt = map(int, input().strip().split())
    towns.append([town, cnt])
    peopleCnt += cnt # 전체 인구 수 구함

# 마을 오름차순으로 정렬
towns.sort(key = lambda x: x[0])

res = 0
midCnt = peopleCnt/2

# 인구수 분포의 중앙값보다 크거나 같은 첫 번째 값을 구해 마을 번호 출력
for i in range(n):
    res += towns[i][1] 

    if res >= midCnt:
        townPos = towns[i][0]
        break

print(townPos)