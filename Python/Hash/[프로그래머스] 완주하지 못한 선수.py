'''
[프로그래머스] 완주하지 못한 선수
https://school.programmers.co.kr/learn/courses/30/lessons/42576

[📌 전략]
participant, completion 길이를 봤을 때 이중 for문 -> 시간 초과 발생
딕셔너리로 접근

[✅ 풀이]
1. participant로 딕셔너리 생성 및 추가 {이름: 명 수} 형태
2. completion를 순회하며 완주했을 시에는 value(명 수) 값 1 제거
3. 마지막 남은 한명 이름 리턴

[📝 기록]
딕셔너리.get(key, 0)을 사용하여 key가 없을 때는 기본값 0을 넣고 시작함
'''

def solution(participant, completion):
    my_dict = {}
    
    for p in participant:
        my_dict[p] = my_dict.get(p, 0) + 1
        
    for c in completion:
        my_dict[c] -= 1
        if my_dict[c] == 0: del my_dict[c]
    
    return list(my_dict)[0]