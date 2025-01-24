'''
[백준 1932] 정수 삼각형
https://www.acmicpc.net/problem/1932

[📌 전략]
- dp로 풀이

[✅ 풀이]
- 각 수의 값이 될 수 있는 후보는 대각선 왼쪽 / 대각선 오른쪽
- 0~n-2행까지 순회하며 각 행의 열의 숫자들 기준 아래쪽으로 왼쪽 대각선, 오른쪽 대각선의 수들에
  현재 값보다 더 큰 수가 들어갈 수 있으면 갱신
- 마지막 행의 숫자 중 가장 큰 값이 최종 답안

[📝 기록]
LV: 실버1
풀이 시간: 23분 
'''

import sys

input = sys.stdin.readline

n = int(input())
board = [[0 for _ in range(n)] for _ in range(n)]
sum = [[0 for _ in range(n)] for _ in range(n)]

for i in range(n): board[i] = list(map(int, input().split())) 

sum[0][0] = board[0][0]

for i in range(n-1): # 행
    for j in range(i+1): # 열
        sum[i+1][j] = max(sum[i+1][j], sum[i][j] + board[i+1][j]) # 아래/왼 대각선
        sum[i+1][j+1] = max(sum[i+1][j+1], sum[i][j] + board[i+1][j+1]) # 아래/오 대각선

print(max(sum[n-1])) # 마지막 행의 숫자 중 가장 큰 값이 최종 답안