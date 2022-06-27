//
//  ChessGameModel.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation
import SwiftUI

class ChessGameBoard: ObservableObject {
    @Published var pieces: [ChessPosition: ChessPiece] = [:]
    
    func reset() {
        pieces = [:]
        pieces[ChessPosition(y: 0, x: 0)] = Luke(color: .black)
        pieces[ChessPosition(y: 0, x: 7)] = Luke(color: .black)
        pieces[ChessPosition(y: 0, x: 1)] = Knight(color: .black)
        pieces[ChessPosition(y: 0, x: 6)] = Knight(color: .black)
        pieces[ChessPosition(y: 0, x: 2)] = Bishop(color: .black)
        pieces[ChessPosition(y: 0, x: 5)] = Bishop(color: .black)
        pieces[ChessPosition(y: 0, x: 4)] = Queen(color: .black)
        (0...7).forEach { pieces[ChessPosition(y: 1, x: $0)] = Pawn(color: .black)}
        
        pieces[ChessPosition(y: 7, x: 0)] = Luke(color: .white)
        pieces[ChessPosition(y: 7, x: 7)] = Luke(color: .white)
        pieces[ChessPosition(y: 7, x: 1)] = Knight(color: .white)
        pieces[ChessPosition(y: 7, x: 6)] = Knight(color: .white)
        pieces[ChessPosition(y: 7, x: 2)] = Bishop(color: .white)
        pieces[ChessPosition(y: 7, x: 5)] = Bishop(color: .white)
        pieces[ChessPosition(y: 7, x: 4)] = Queen(color: .white)
        (0...7).forEach { pieces[ChessPosition(y: 6, x: $0)] = Pawn(color: .white)}
    }
    
    func move(from fromPosition: ChessPosition, to toPosition: ChessPosition) -> Bool {
        guard fromPosition.isValid(), toPosition.isValid() else { return false }
        
        guard let piece = pieces[fromPosition] else { return false }

        let movablePositions = piece.getMovablePositions(on: fromPosition, from: pieces)
        guard movablePositions.contains(toPosition) else { return false }
        
        pieces[fromPosition] = nil
        pieces[toPosition] = piece
        return true
    }
    
    func displayBoard() {
        var boardArray = Array(repeating: Array(repeating: ".", count: 8), count: 8)
        pieces.forEach { position, piece in
            let (y, x) = position.unpackYX
            boardArray[y][x] = piece.icon
        }
        let output = boardArray.map { line in
            return line.reduce("") { $0 + $1 }
        }.reduce("") { $0 + "\n" + $1 }

        print(output)
    }
}
