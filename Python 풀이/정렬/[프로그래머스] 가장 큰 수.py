'''
[프로그래머스] 가장 큰 수
https://school.programmers.co.kr/learn/courses/30/lessons/42746

[✅ 풀이]
요소들을 문자로 만들고, 문자가 큰 순으로 정렬
이를 구현하기 위해 앞 문자 + 뒤 문자와 뒤 문자 + 앞 문자인 문자열을 비교해서, 
큰 값이 먼저 오도록 구현

[📝 기록]
정렬 기준 만들기 -> cmp_to_key, compare 함수 만들어서 key로 넣어주기
'''

from functools import cmp_to_key

def compare(x, y):
    return -1 if x + y > y + x else 1

    
def solution(numbers):
    strArr = list(map(str, numbers))
    ans = sorted(strArr, key = cmp_to_key(compare))

    return "0" if ans[0] == "0" else "".join(ans)