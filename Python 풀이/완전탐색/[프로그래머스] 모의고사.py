'''
[프로그래머스] 모의고사
https://school.programmers.co.kr/learn/courses/30/lessons/42840

[✅ 풀이]
1. 각 수포자들의 규칙 확인
    1-1. 수포자1: [1, 2, 3, 4, 5] 반복
         수포자2: [2, 1, 2, 3, 2, 4, 2, 5] 반복
         수포자3:  [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] 반복
2. answers가 주어졌을 때 수포자들이 적는 답 생성
    몫과 나머지, sublist를 활용함
3. 찍은 답안과 진짜 답안이 같은지 확인하고 (수포자 번호, 맞춘 개수) 형태로 저장
4. 위에서 구한 리스트를 맞춘 개수 기준 내림차순, 맞춘 개수가 같으면 번호순으로 정렬
5. 가장 큰값인 번호만 뽑아내어 반환
'''

def solution(answers): 
    answer = []
    n = len(answers)
    arrs = [
        [1, 2, 3, 4, 5],
        [2, 1, 2, 3, 2, 4, 2, 5], 
        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    ]
    
    for idx, arr in enumerate(arrs):
        cnt = len(arr)
        share = int(n / cnt)
        rm = int(n % cnt)
        ans = arr * share + arr[:rm]
        sum = 0
        
        # 찍은 답안이 진짜 답안과 같은지 확인
        for i in range(0, n):
            if ans[i] == answers[i]: sum += 1
            
        answer.append((idx+1, sum))
        
    answer.sort(key = lambda x :(-x[1], x[0]))
    final_ans = list(filter(lambda x: x[1] == answer[0][1], answer))
    
    return list(map(lambda x: x[0], final_ans))