//
//  Pawn.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

struct Pawn: ChessPiece {
    let color: ChessColor
    let score: Int = 1
    var icon: String {
        switch color {
        case .white:
            return "♙"
        case .black:
            return "♟"
        }
    }
    
    func getMovablePositions(on position: ChessPosition, from board: [ChessPosition : ChessPiece]) -> Set<ChessPosition> {
        var offsets = [(0, 1), (0, -1)]
        if color == .black {
            offsets.append((1, 0))
        } else {
            offsets.append((-1, 0))
        }
        let (fromY, fromX) = position.unpackYX
        let result = offsets.map { (dy, dx) in
            return ChessPosition(y: fromY + dy, x: fromX + dx)
        }.filter { $0.isValid() && board[$0]?.color != color }
        
        return Set(result)
    }
}
