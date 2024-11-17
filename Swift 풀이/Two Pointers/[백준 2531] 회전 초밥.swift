//
//  [백준 2531] 회전 초밥.swift
//  Algorithm
//
//  Created by 김민 on 9/14/24.
//
// 백준 2531 회전 초밥 https://www.acmicpc.net/problem/2531

/*
[📌 전략]
 한번에 파악해야 하는 접시는 연속 k개로 고정되어 있음 -> 슬라이딩 윈도우로 풀이함.

[✅ 풀이]
 1. 입력받기
    - 입력받은 스시 배열에 0~k-2 요소들을 한번 더 append 해 주어 더 편리하게 풀이하도록 했음.
 2. freq 배열 선언 / cnt 선언
    - 각 인덱스를 스시 종류로 정의하고, 인덱스의 값을 이용하여 최대 스시 개수를 구하도록 함.
    - freq[c]는 기본으로 1로 지정.
    - cnt는 가짓수를 의미
 3. st를 기준으로 for문 순회
    - st가 0일 때: 0 ~ en(st+k-1)을 순회하며 첫 번째 연속 k개의 스시 접시를 구함
        - freq[스시]를 갱신
        - 갱신한 freq 값이 1이면, cnt에 1 갱신 (1보다 큰 경우 스시가 중복되므로 처리 x)
 4. - st가 0보다 클 경우:
        - 슬라이딩 윈도우로 이동하면, 새로 추가되는 값은 en(st+k-1), 삭제되는 값은 st이고 이는 6번에서 처리
        - freq[en스시]를 갱신해 주고, freq[en스시]가 1이 된 경우 cnt += 1 (1보다 큰 경우는 스시가 중복되므로 처리 x)
 5. mx 값 갱신
    - 갱신한 mx가 k+1일 경우, 최대 가짓수의 스시이므로 더이상 탐색하지 않고 탈출
 6. st 포인터 이동을 위한 준비
    - freq[st스시]에서 1 빼기
    - 1을 뺐을 때 0이 됐다면, 중복된 값도 더이상 없다는 뜻이므로 cnt - 1
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, d, k, c) = (line[0], line[1], line[2], line[3])
var plates = [Int]()

for _ in 0..<n {
    plates.append(Int(readLine()!)!)
}

plates.append(contentsOf: plates[0...k-2])

var freq = Array(repeating: 0, count: d+3)
var cnt = 0
freq[c] = 1
cnt += 1

var mx = -1

for st in 0...n-1 {
    let en = st + k-1

    if st == 0 {
        for i in st...en {
            let sushi = plates[i]
            freq[sushi] += 1

            if freq[sushi] == 1 { cnt += 1 }
        }
    } else {
        freq[plates[en]] += 1

        if freq[plates[en]] == 1 { cnt += 1 }
    }

    if cnt > mx { mx = cnt }

    if mx == k + 1 { break }

    freq[plates[st]] -= 1
    if freq[plates[st]] == 0 { cnt -= 1 }
}

print(mx)
