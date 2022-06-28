//
//  Luke.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

struct Luke: ChessPiece {
    let color: ChessColor
    let score: Int = 5
    var icon: String {
        switch color {
        case .white:
            return "♖"
        case .black:
            return "♜"
        }
    }
    
    func getMovablePositions(on position: ChessPosition, from board: [ChessPosition : ChessPiece]) -> Set<ChessPosition> {
        let offsets = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        let result = offsets.map { (dy, dx) in
            let (y, x) = position.unpackYX
            return ChessPosition(y: y + dy, x: x + dx)
        }.filter { $0.isValid() && board[$0]?.color != color }
        
        return Set(result)
    }
}
