'''
[백준 5430] AC
https://www.acmicpc.net/problem/5430

[📌 전략]
- 시간 초과 해결 -> 매번 뒤집지 않고 flag를 사용하기, 마지막에만 진짜 뒤집기

[✅ 풀이]
1. 입력 처리 (주의: int형으로 매핑하지 않아도 문제 풀이 가능)
2. 명령어 수행
    - R: reversed 상태 갱신
    - D: 현재 덱에 요소가 있는지 확인하고 없다면 error, 있다면 뒤집기 상태에 따라 pop
3. 정답 출력
    - reversed 상태라면 한번 뒤집어 주고, 답안 형태로 문자열 처리하여 출력

[📝 기록]
LV: 골드5
풀이 시간: 44분 (시간 초과 해결하지 못했음)
'''

import sys
from collections import deque

input = sys.stdin.readline

t = int(input())

for _ in range(t):
    # 입력처리
    line = input().strip()
    n = int(input())
    arr = input().strip()

    arr = arr.replace('[', '')
    arr = arr.replace(']', '')

    if arr: arr = arr.split(',')

    q = deque(arr)
    ans = ""

    reversed = False # 뒤집었는지
    error = False # 에러 발생했는지

    for cmd in line:
        if cmd  == "R": # 뒤집기 함수 등장 시 flag 갱신
            reversed = not reversed 
        else:
            if q:
                if reversed: q.pop() # 뒤집은 상태이므로 오른쪽 요소 제거
                else: q.popleft() # 뒤집지 않은 원래 상태이므로 첫 번재 요소 제거
            else: error = True # 큐에 요소가 없는데 D 발생 시 에러

    if error:
        print("error")
    else:
        if reversed: q.reverse() # 최종적으로 뒤집어야 하면 뒤집기
        print("[" + ",".join(q) + "]")