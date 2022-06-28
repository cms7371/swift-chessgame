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
    
    func getMovablePositions(on position: ChessPosition, from board: [ChessPosition : ChessPiece]) -> Set<ChessPosition> {
        let offsets = [(1, 1), (1, -1), (-1, 1), (-1, -1)]
        var result = Set<ChessPosition>()
        
        for (dy, dx) in offsets {
            var currentPosition = position
            while true {
                let (y, x) = currentPosition.unpackYX
                let nextPosition = ChessPosition(y: y + dy, x: x + dx)
                if nextPosition.isValid() && board[nextPosition]?.color != color {
                    result.update(with: nextPosition)
                    currentPosition = nextPosition
                } else {
                    break
                }
            }
        }
        
        return result
    }
    
    
}
