'''
[백준 12891] DNA 비밀번호
https://www.acmicpc.net/problem/12891

[📌 전략]
- 시간상 모든 조합을 다 돌아볼 순 없음
- 슬라이딩 윈도우를 사용하여 O(n)에 해결하도록 함

[✅ 풀이]
1. 함수 구현
    - add: a, c, g, t인 경우 하나씩 늘려줌 (슬라이딩 윈도우 이동 시 추가되는 마지막 요소 처리)
    - sub: a, c, g, t인 경우 하나씩 빼줌 (슬라이딩 윈도우 이동 시 삭제되는 첫 번째 요소 처리)
    - update: 조건보다 크거나 같을 경우 올바른 비밀번호
2. 입력받은 DNA 문자열을 순회하며 슬라이딩 윈도우 처리.
    - index 0일 때는 초기값 설정 위해 add 호출 후 update
    - 이외의 경우에는 슬라이딩하며 맨 왼쪽 요소 삭제, 맨 오른쪽 요소 추가 반복

[📝 기록]
LV: 실버2
풀이 시간: 19분 
'''

import sys

input = sys.stdin.readline

s, p = map(int, input().split())
dna_str = input()
con_a, con_c, con_g, con_t = map(int, input().split())
a, c, g, t = 0, 0, 0, 0
ans = 0

def add(w):
    global a, c, g, t
    if w == 'A': a+=1
    elif w == 'C': c+=1
    elif w == 'G': g+=1
    elif w == 'T': t+=1

def sub(w):
    global a, c, g, t
    if w == 'A': a-=1
    elif w == 'C': c-=1
    elif w == 'G': g-=1
    elif w == 'T': t-=1

def update():
    global ans
    if a >= con_a and c >= con_c and g >= con_g and t >= con_t: 
        ans += 1

for i in range(0, s-p+1):
    if i == 0:
        for i in range(p): add(dna_str[i])
        update()
    else:
        prev_st, new_en = i-1, i+p-1
        sub(dna_str[prev_st])
        add(dna_str[new_en])
        update()

print(ans)