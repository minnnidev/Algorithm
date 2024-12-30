'''
[프로그래머스] 최소직사각형
https://school.programmers.co.kr/learn/courses/30/lessons/86491?language=python3

[✅ 풀이]
명함은 전부 회전할 수 있기 때문에, sizes 리스트를 순회하며 그중 큰 값과 작은 값을 분리
큰 값 리스트 중 max값과 작은 값 리스트 중 max 값이 최종 답안
'''

def solution(sizes):
    mx = []
    mn = []
    
    for i in range(len(sizes)):
        mx.append(max(sizes[i]))
        mn.append(min(sizes[i]))
        
    return max(mx) * max(mn)