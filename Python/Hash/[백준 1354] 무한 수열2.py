'''
[백준 1354] 무한 수열2
https://www.acmicpc.net/problem/1354

[📌 전략]
메모리제이션 통한 시간 단축

[✅ 풀이]
1. 입력받기
2. cur이 0보다 작다면 문제에서 지정된 값 1 반환
3. 딕셔너리에 존재하는 값이라면 딕셔너리 값 반환
4. 2번, 3번에 해당하지 않는다면, 문제에서 주어진 공식을 통해 새로 값을 구해야 함. 
   딕셔너리에 우선 저장하여(메모리제이션) 추후 동일한 입력에도 다시 계산하지 않도록 함

[📝 기록]
풀이 시간: 20분
'''

import sys

input = sys.stdin.readline
n, p, q, x, y = map(int, input().strip().split())
dict = dict() 
dict[0] = 1

def infinity(cur):
    if cur <= 0:
        return 1
    if cur in dict:
        return dict[cur]

    dict[cur] = infinity(int(cur/p)-x) + infinity(int(cur/q)-y) # 메모리제이션
    return dict[cur]

print(infinity(n))