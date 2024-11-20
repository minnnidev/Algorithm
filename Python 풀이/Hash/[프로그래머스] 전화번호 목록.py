'''
[프로그래머스] 전화번호 목록
https://school.programmers.co.kr/learn/courses/30/lessons/42577

[✅ 풀이1] 정렬, startswith()를 활용한 풀이

1. 문자열 기준 phone_book 정렬
2. phone_book을 순회하며 phone_book[i+1]이 phone_book[i]로 시작하는지 체크
    2-1. 접두어라면 바로 False 반환

[✅ 풀이2] 해시 활용한 풀이
1. {전화번호: 1} 형태로 딕셔너리에 추가
2. 각 전화번호 순회
    2-1. 전화번호의 각 문자들 순회(20자 제한 조건 O)
    2-2. tmp에 문자들을 더하여 모든 부분 문자열 체크하도록 함
    2-2. 부분 문자열 tmp가 my_dict에 존재하고, 원래 phone_num가 다를 때는 False 반환
'''

# 접두어가 존재하면 False, 존재하지 않으면 True

# 정렬, startswith()를 활용한 풀이
def solution(phone_book):
    phone_book.sort() # 문자열 기준 정렬
    
    for i in range(len(phone_book)-1):
        # startswith 함수 활용하여 접두어인지 체크
        if phone_book[i+1].startswith(phone_book[i]): 
            return False
    
    return True 

# 해시 활용한 풀이
def solution(phone_book):
    my_dict = {}
    
    # {전화번호: 1} 형태로 딕셔너리에 추가
    for phone_num in phone_book:
        my_dict[phone_num] = 1
        
    # 각 전화번호 순회
    for phone_num in phone_book:
        tmp = ""
        
        # 전화번호 문자열의 문자들을 순회
        for num in phone_num:
            tmp += num
            
            # 부분 문자열 tmp가 my_dict에 존재하고,
            # 원래 phone_num가 다를 때는 False 반환
            if tmp in my_dict and tmp != phone_num: return False
        
    return True