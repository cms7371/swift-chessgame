//
//  GameManager.swift
//  ChessGame
//
//  Created by kakao on 2022/06/22.
//

import Foundation
import SwiftUI
import Combine

class ChessGameManager: ObservableObject {
    @Published var turn: ChessColor = .black
    @Published var whiteScore: Int = 0
    @Published var blackScore: Int = 0
    
    @Published var board: [ChessPosition: ChessPiece] = [:]
    @Published var selectedPosition: ChessPosition?
    @Published var movablePositions: Set<ChessPosition>?
    
    func resetGame() {
        turn = .black
        whiteScore = 0
        blackScore = 0
        selectedPosition = nil
        movablePositions = nil
        
        board = [:]
        board[ChessPosition(y: 0, x: 0)] = Luke(color: .black)
        board[ChessPosition(y: 0, x: 7)] = Luke(color: .black)
        board[ChessPosition(y: 0, x: 1)] = Knight(color: .black)
        board[ChessPosition(y: 0, x: 6)] = Knight(color: .black)
        board[ChessPosition(y: 0, x: 2)] = Bishop(color: .black)
        board[ChessPosition(y: 0, x: 5)] = Bishop(color: .black)
        board[ChessPosition(y: 0, x: 4)] = Queen(color: .black)
        (0...7).forEach { board[ChessPosition(y: 1, x: $0)] = Pawn(color: .black)}
        
        board[ChessPosition(y: 7, x: 0)] = Luke(color: .white)
        board[ChessPosition(y: 7, x: 7)] = Luke(color: .white)
        board[ChessPosition(y: 7, x: 1)] = Knight(color: .white)
        board[ChessPosition(y: 7, x: 6)] = Knight(color: .white)
        board[ChessPosition(y: 7, x: 2)] = Bishop(color: .white)
        board[ChessPosition(y: 7, x: 5)] = Bishop(color: .white)
        board[ChessPosition(y: 7, x: 4)] = Queen(color: .white)
        (0...7).forEach { board[ChessPosition(y: 6, x: $0)] = Pawn(color: .white)}
    }
    
    func select(position: ChessPosition) -> Bool {
        guard position.isValid() else {
            fatalError("Invalid position can't be inputted")
        }
        
        if let selectedPosition = selectedPosition {
            guard position != selectedPosition else {
                self.selectedPosition = nil
                self.movablePositions = nil
                return true
            }
            
            guard movablePositions?.contains(position) ?? false else {
                print("Invalid selection")
                return false
            }
            
            let movePiece = board.removeValue(forKey: selectedPosition)
            let targetPiece = board.removeValue(forKey: position)
            board[position] = movePiece
            
            let score = targetPiece?.score ?? 0
            
            switch turn {
            case .white:
                whiteScore += score
                turn = .black
            case .black:
                blackScore += score
                turn = .white
            }
            
            self.selectedPosition = nil
            self.movablePositions = nil
            
            return true
        } else {
            guard let selectedPiece = board[position], selectedPiece.color == turn else {
                print("Select valid position or colored piece")
                return false
            }
            
            self.selectedPosition = position
            self.movablePositions = selectedPiece.getMovablePositions(on: position, from: board)
            
            return true
        }
    }
    
    func displayBoard() {
        var boardArray = Array(repeating: Array(repeating: ".", count: 8), count: 8)
        board.forEach { position, piece in
            let (y, x) = position.unpackYX
            boardArray[y][x] = piece.icon
        }
        let output = boardArray.map { line in
            return line.reduce("") { $0 + $1 }
        }.reduce("") { $0 + "\n" + $1 }

        print(output)
    }
}
