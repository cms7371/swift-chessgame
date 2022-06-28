//
//  Queen.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

struct Queen: ChessPiece {
    let color: ChessColor
    let score: Int = 9
    var icon: String {
        switch color {
        case .white:
            return "♕"
        case .black:
            return "♛"
        }
    }
    
    func getMovablePositions(on position: ChessPosition, from board: [ChessPosition : ChessPiece]) -> Set<ChessPosition> {
        let offsets = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
        var result = Set<ChessPosition>()
        
        for (dy, dx) in offsets {
            var currentPosition = position
            while true {
                let (y, x) = currentPosition.unpackYX
                let (ny, nx) = (y + dy, x + dx)
                let nextPosition = ChessPosition(y: ny, x: nx)
                if nextPosition.isValid() && board[nextPosition]?.color != color{
                    currentPosition = nextPosition
                    result.update(with: nextPosition)
                } else {
                    break
                }
            }
        }
        
        return result
    }
}
