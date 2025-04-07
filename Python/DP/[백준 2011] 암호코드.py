'''
[백준 2011] 암호코드
https://www.acmicpc.net/problem/2011

[📌 전략]
- 암호의 길이가 길어질 때마다 앞의 암호 해석 가짓수를 사용함 -> dp
- 1000000으로 나누어야 함 -> dp 예측 가능

[✅ 풀이]
- dp 테이블 정의:  dp[i] -> i번째 암호 자릿수까지의 해석 방법
- 한 자리씩 늘려가며 암호를 해석
    현재 붙여보려는 암호 문자 n
    case1) n은 0보다 크기만 하면, 한 자리로 붙일 수 있다. 
           모든 경우에 붙일 수 있으므로, 방법 수는 dp[i-1]의 값과 같음.
    case2) n과 바로 이전 문자를 이어붙였을 때, 두 자리가 되고 26(알파벳 내)보다 작으면 붙일 수 있다.
           방법 수는 dp[i-2]의 값과 같음.
- dp[len] 값을 1000000으로 나눈 나머지를 출력.

[📝 기록]
LV: 골드5
풀이 시간: 47분 (혼자 풀이하지 못함)
'''

import sys

input = sys.stdin.readline
num = list(map(int, input().strip()))
len = len(num)

dp = [0] * (len+1) # dp[i] -> i번째 암호 자릿수까지의 해석 방법
dp[0] = 1
dp[1] = 1

# 0부터 시작할 때는 아예 해석 불가
if num[0] == 0:
    print(0) 
else:
    # 암호 순회
    for k in range(1, len):
        i = k + 1
        
        if num[k] > 0:
            dp[i] += dp[i-1]
        
        if 10 <= num[k] + num[k-1]*10 <= 26:
            dp[i] += dp[i-2]

    print(dp[len] % 1000000)