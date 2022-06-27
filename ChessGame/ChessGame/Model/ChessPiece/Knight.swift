//
//  Knight.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

struct Knight: ChessPiece {
    let color: ChessColor
    let score: Int = 3
    var icon: String {
        switch color {
        case .white:
            return "♘"
        case .black:
            return "♞"
        }
    }
    
    func getMovablePositions(on position: ChessPosition, from board: [ChessPosition : ChessPiece]) -> [ChessPosition] {
        let (y, x) = position.unpackYX
        
        let moveOffsets: [(Int, Int)]
        let forwardPosition: ChessPosition
        switch color {
        case .white:
            moveOffsets = [(-2, 1), (-2, -1)]
            forwardPosition = ChessPosition(y: y - 1, x: x)
        case .black:
            moveOffsets = [(2, 1), (2, -1)]
            forwardPosition = ChessPosition(y: y + 1, x: x)
        }
        
        guard board[forwardPosition] == nil else { return [] }
        
        let result = moveOffsets.map { (dy, dx) in
            return ChessPosition(y: y + dy, x: x + dx)
        }.filter { $0.isValid() && board[$0]?.color != color }
        
        return result
    }
}
