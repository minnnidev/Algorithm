//
//  [백준 2170] 선 긋기.swift
//  Algorithm
//
//  Created by 김민 on 12/19/23.
//
// 백준 2170 선 긋기 https://www.acmicpc.net/problem/2170

/*
[처음 생각했던 풀이]
입력받은 선들을 x의 오름차순으로 정렬한다. -> 그래야 겹치는 부분을 쉽게 계산할 수 있다고 생각했다.
x가 일치한다면, y의 내림차순(선의 길이가 더 긴)으로 정렬한다.
-> x가 일치하는 경우에는 길이가 가장 긴 선만 계산하면 된다. 나머지는 모두 겹친다.
이제 선의 길이를 케이스별로 나누어 게산해 보자.
case 1. 현재 선의 x가 이전 선의 y보다 크거나 같은 경우
이 케이스는 겹치는 부분이 없는 경우이다. 선 길이 전체를 결과에 더해준다.
case 2. 현재 선의 x가 이전 선의 y보다 작은 경우
현재 선의 y가 이전 선의 y보다 작다면, 모든 부분이 겹치므로 계산할 필요가 없고,
현재 선의 y가 이전 선의 y보다 크다면, 현재 선에서 이전 선과 겹치는 부분을 제외하고 결과에 더해준다.

📌 주의할 점
1. 이전 선의 y만 고려한다?
이전 선의 y를 사용해서 풀이하였는데, 3%에서 자꾸 오류가 났다.
질문 게시판에서 이런 반례들을 찾을 수 있었는데, 하나의 선이 다른 선들보다 길었던 경우이다.
게속해서 이전 선만 사용했던 내 풀이는 틀릴 수밖에 없었다.
 3
 1 6
 2 3
 4 5
이런 경우를 대비해서 이전 y가 아닌 y의 최대를 사용해서 계산해 줘야 한다. 계속해서 y를 최대로 갱신해 준다.

2. Swift에서의 시간 초과
분명 시간 복잡도가 O(N)인데 자꾸 시간 초과가 났다. 
이전에 Swift에서 시간 초과가 뜰 때는 빠른 입출력을 고려해 봐야 한다라는 것이 문득 떠올라서,
빠른 입출력 코드를 사용했더니 통과가 되었다.
(🔗 빠른 입출력 코드는 https://gist.github.com/JCSooHwanCho/30be4b669321e7a135b84a1e9b075f88 에서 가져왔습니다.)
*/

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {

        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let fIO = FileIO()
let N = fIO.readInt()
var lines = [[Int]]()

for _ in 0..<N {
    let x = fIO.readInt()
    let y = fIO.readInt()
    lines.append([x, y])
}

lines.sort {
    if $0[0] == $1[0] {
        return $0[1] > $1[1]
    } else {
        return $0[0] < $1[0]
    }
}

var result = lines[0][1] - lines[0][0]
var currentY = lines[0][1]

for i in 1..<lines.count {
    if lines[i][0] >= currentY {
        result += lines[i][1] - lines[i][0]
        currentY = lines[i][1]
    } else {
        if lines[i][1] > currentY {
            result += lines[i][1] - currentY
            currentY = lines[i][1]
        }
    }
}

print(result)

