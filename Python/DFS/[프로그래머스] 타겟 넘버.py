'''
[프로그래머스] 타겟 넘버
https://school.programmers.co.kr/learn/courses/30/lessons/43165

[📌 전략]
모든 수에 대해서 +, - 의 경우를 전부 생각해야 한다 -> 재귀적으로 접근

[✅ 풀이]
dfs 함수 구현
- depth가 number의 개수와 같아질 경우 탈출
    - 합이 target과 같아질 경우에는 1을 반환하여 최종 방법 개수에 1을 더함
- sum 파라미터에 sum + 숫자, sum - 숫자를 해 주어, +, - 두 경우 모두 접근하도록 구현
'''

def dfs(sum, depth, numbers, target):
    if depth == len(numbers):
        return 1 if sum == target else 0
    
    return (dfs(sum + numbers[depth], depth+1, numbers, target) 
            + dfs(sum - numbers[depth], depth+1, numbers, target))
    
def solution(numbers, target):
    return dfs(0, 0, numbers, target)