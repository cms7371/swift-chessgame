//
//  ChessGameModel.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

struct ChessGameModel {
    private var board: [[ChessPiece?]] = Array(repeating: Array(repeating: nil, count: 8), count: 8)
    
    mutating func initializeChessBoard() {
        board[0][0] = Luke(color: .black)
        board[0][7] = Luke(color: .black)
        board[0][1] = Knight(color: .black)
        board[0][6] = Knight(color: .black)
        board[0][2] = Bishop(color: .black)
        board[0][5] = Bishop(color: .black)
        board[0][4] = Queen(color: .black)
        (0...7).forEach { board[1][$0] = Pawn(color: .black)}
        
        board[7][0] = Luke(color: .white)
        board[7][7] = Luke(color: .white)
        board[7][1] = Knight(color: .white)
        board[7][6] = Knight(color: .white)
        board[7][2] = Bishop(color: .white)
        board[7][5] = Bishop(color: .white)
        board[7][4] = Queen(color: .white)
        (0...7).forEach { board[6][$0] = Pawn(color: .white)}
    }
    
    mutating func move(from fromPosition: Position, to toPosition: Position) -> Bool {
        guard fromPosition.isValid(), toPosition.isValid() else { return false }
        
        let (fromY, fromX) = fromPosition.unpackYX
        guard let piece = board[fromY][fromX] else { return false }

        let movablePositions = piece.getMovablePositions(from: fromPosition)
        guard movablePositions.contains(toPosition) else { return false }
        
        let (toY, toX) = toPosition.unpackYX
        board[fromY][fromX] = nil
        board[toY][toX] = piece
        return true
    }
}
