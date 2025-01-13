'''
[백준 14893] 경사로
https://www.acmicpc.net/problem/14890

[📌 전략]
- 문제에 주어진 경사로를 만들 수 없는 조건을 체크하여 풀이

[✅ 풀이]
arr배열이 지나갈 수 있는 길인지 판단하는 함수 check(arr)
길을 구성하는 칸의 유의미한 성질은 아래와 같음.

1. 높이 차가 1보다 큼 -> 경사로의 높이는 1이므로 어차피 경사로를 놓을 수 없음
2. 높이가 1 커짐/작아짐 -> 문제에 주어진 조건들을 활용하여 경사로를 놓을 수 있는지 여부를 확인

2번 조건일 때 문제에서 주어진 아래 조건들을 모두 체크
- 경사로를 놓다가 범위를 벗어나는 경우
    - 현재 인덱스 i에 l을 더하거나 빼서 벗어나는지를 체크함
- 경사로를 놓은 곳에 또 경사로를 놓는 경우
    - 경사로를 놓았는지를 저장할 bridge 배열을 활용
    - 경사로를 놓으려고 할 때 bridge 배열의 값이 False인지 확인
    - False일 경우 경사로를 놓고 True로 갱신하고, True일 경우에는 경사로를 놓을 수 없음
- 낮은 지점의 칸의 높이가 모두 같지 않거나, L개가 연속되지 않은 경우
    - 현재 높이와 경사로를 놓으려는 칸의 높이가 같은지 확인

주어진 지도의 행과 열의 배열 요소들을 순회하며 check 함수 호출

[📝 기록]
LV: 골드3 
풀이 시간: 1시간 제한을 두었으나 제한 시간 내 풀이하지 못함.
'''


import sys

input = sys.stdin.readline

n, l = map(int, input().split())
board = []
ans = 0

for _ in range(n):
    row = list(map(int, input().split()))
    board.append(row)

# 경사로를 넣을 수 없는 경우에 False 반환
def check(arr):
    bridge = [False] * n

    for i in range(1, n):
        # 높이 차이가 1보다 큰 경우
        if abs(arr[i] - arr[i-1]) > 1:
            return False

        if arr[i] - arr[i-1] == 1: # 높이가 1 커진 경우
            if i-l < 0: return False

            for j in range(l):
                if arr[i-1] != arr[i-j-1]: return False
                elif bridge[i-j-1]: return False
                elif not bridge[i-j-1]:
                    bridge[i-j-1] = True

        elif arr[i] - arr[i-1] == -1: # 높이가 1 작아진 경우
            if i+l > n: return False

            for j in range(l):
                if arr[i] != arr[i+j]: return False
                elif bridge[i+j]: return False
                elif not bridge[i+j]: bridge[i+j] = True

    return True


# 행
for i in range(n):
    row = board[i]
    
    ans += check(row)
    
# 열
for i in range(n):
    col = []
    
    for j in range(n):
        col.append(board[j][i]) 

    ans += check(col)

print(ans)