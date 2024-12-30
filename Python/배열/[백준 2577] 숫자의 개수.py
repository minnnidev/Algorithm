'''
[백준 2577] 숫자의 개수
https://www.acmicpc.net/problem/2577
'''

'''
[✅ 풀이1]
1. 곱한 값을 리스트로 만들기
2. 인덱스를 따라, 각 인덱스의 숫자가 몇 번 호출되었는지 확인할 배열 ansArr
3. list를 순회하며 인덱스에 맞는 값 추가
4. ansArr 전체 출력
'''
# a = int(input())
# b = int(input())
# c = int(input())
# list = list(str(a*b*c))
# ansArr = [0 for _ in range(10)]

# for num in list: ansArr[int(num)] += 1
# for n in ansArr: print(n)

'''
[✅ 풀이2]
1. 곱한 값을 문자열로 변환
2. 0~9까지를 i로 순회하며 문자열에 i가 몇 번 들어갔는지 출력(by count)
'''

a = int(input())
b = int(input())
c = int(input())

s = str(a*b*c)

for i in range(10):
    print(s.count(str(i)))