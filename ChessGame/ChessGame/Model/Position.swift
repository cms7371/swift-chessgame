//
//  Position.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

struct Position: Equatable {
    var y: Int
    var x: Int
    
    var unpackYX: (Int, Int) {
        return (y, x)
    }
    
    func isValid() -> Bool {
        let validRange = 0...7
        return validRange.contains(y) && validRange.contains(x)
    }
}
