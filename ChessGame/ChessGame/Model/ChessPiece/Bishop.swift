//
//  Bishop.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

struct Bishop: ChessPiece {
    let color: ChessColor
    let score: Int = 3
    var icon: String {
        switch color {
        case .white:
            return "♗"
        case .black:
            return "♝"
        }
    }
    
    func getMovablePositions(on position: ChessPosition, from board: [ChessPosition : ChessPiece]) -> [ChessPosition] {
        let offsets = [(1, 1), (1, -1), (-1, 1), (-1, -1)]
        var result = [ChessPosition]()
        
        for (dy, dx) in offsets {
            var currentPosition = position
            while true {
                let (y, x) = currentPosition.unpackYX
                let nextPosition = ChessPosition(y: y + dy, x: x + dx)
                if nextPosition.isValid() && board[nextPosition]?.color != color {
                    result.append(nextPosition)
                    currentPosition = nextPosition
                } else {
                    break
                }
            }
        }
        
        return result
    }
    
    
}
