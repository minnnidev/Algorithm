'''
[백준 1181] 단어 정렬
https://www.acmicpc.net/problem/1181

[📌 전략]
- 기준이 여러 개인 정렬 문제

[✅ 풀이]
1. set을 선언하고, 입력받은 단어를 set에 추가
2. key=lambda 사용하여 길이가 짧은 것부터, 길이가 같으면 사전순으로 정렬
3. 출력

[📝 기록]
LV: 실버5
풀이 시간: 7분
'''

import sys

input = sys.stdin.readline 

n = int(input())
words = set() # 중복될 수 없으므로 set으로 처리

for _ in range(n): words.add(input().strip()) # 공백 제거 후 set에 추가

sorted_words = sorted(words, key=lambda x: (len(x), x)) # 길이가 짧은 것부터, 길이가 같으면 사전 순으로

print(*sorted_words, sep='\n')