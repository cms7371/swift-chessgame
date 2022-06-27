//
//  ChessGameTests.swift
//  ChessGameTests
//
//  Created by kakao on 2022/06/20.
//

import XCTest
@testable import ChessGame

class ChessGameTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testDisplayBoard() {
        let gameModel = ChessGameBoard()
        gameModel.reset()
        gameModel.displayBoard()
    }
    
    func testQueenMovablePosition() {
        let board = ChessGameBoard()
        
        let queenPosition = ChessPosition(y: 0, x: 4)
        let queen = Queen(color: .black)
        board.pieces[queenPosition] = queen
        
        let blackPawnPosition = ChessPosition(y: 2, x: 4)
        let blackPawn = Pawn(color: .black)
        board.pieces[blackPawnPosition] = blackPawn
        
        let whitePawnPosition = ChessPosition(y: 0, x: 3)
        let whitePawn = Pawn(color: .white)
        board.pieces[whitePawnPosition] = whitePawn
        
        let movablePositions = queen.getMovablePositions(on: queenPosition, from: board.pieces)
        
        print(movablePositions)
        
        XCTAssertEqual(movablePositions, [ChessPosition(y: 1, x: 4), ChessPosition(y: 0, x: 5), ChessPosition(y: 0, x: 6), ChessPosition(y: 0, x: 7), ChessPosition(y: 0, x: 3), ChessPosition(y: 0, x: 2), ChessPosition(y: 0, x: 1), ChessPosition(y: 0, x: 0), ChessPosition(y: 1, x: 5), ChessPosition(y: 2, x: 6), ChessPosition(y: 3, x: 7), ChessPosition(y: 1, x: 3), ChessPosition(y: 2, x: 2), ChessPosition(y: 3, x: 1), ChessPosition(y: 4, x: 0)])
    }
    
    func testKnightMovablePositions() {
        let board = ChessGameBoard()
        
        let knightPosition = ChessPosition(y: 0, x: 1)
        let knight = Knight(color: .black)
        board.pieces[knightPosition] = knight
        
        let blackPawnPosition = ChessPosition(y: 1, x: 1)
        let blackPawn = Pawn(color: .black)
        board.pieces[blackPawnPosition] = blackPawn
        
        let whitePawnPosition = ChessPosition(y: 2, x: 0)
        let whitePawn = Pawn(color: .white)
        board.pieces[whitePawnPosition] = whitePawn
        
        XCTAssertEqual(knight.getMovablePositions(on: knightPosition, from: board.pieces), [ChessPosition]())
        
        board.pieces.removeValue(forKey: blackPawnPosition)
        
        XCTAssertEqual(knight.getMovablePositions(on: knightPosition, from: board.pieces), [ChessPosition(y: 2, x: 2), ChessPosition(y: 2, x: 0)])
    }
    
    func testLukeMovablePositions() {
        let board = ChessGameBoard()
        
        let lukePosition = ChessPosition(y: 1, x: 1)
        let luke = Luke(color: .black)
        board.pieces[lukePosition] = luke
        
        let blackPawnPosition = ChessPosition(y: 2, x: 1)
        let blackPawn = Pawn(color: .black)
        board.pieces[blackPawnPosition] = blackPawn
        
        let whitePawnPosition = ChessPosition(y: 1, x: 2)
        let whitePawn = Pawn(color: .white)
        board.pieces[whitePawnPosition] = whitePawn
        
        XCTAssertEqual(luke.getMovablePositions(on: lukePosition, from: board.pieces), [ChessPosition(y: 0, x: 1), ChessPosition(y: 1, x: 2), ChessPosition(y: 1, x: 0)])
    }
    
    func testPawnMovablePositions() {
        let board = ChessGameBoard()
        
        let testPawnPosition = ChessPosition(y: 1, x: 1)
        let testPawn = Pawn(color: .black)
        board.pieces[testPawnPosition] = testPawn
        
        let blackPawnPosition = ChessPosition(y: 2, x: 1)
        let blackPawn = Pawn(color: .black)
        board.pieces[blackPawnPosition] = blackPawn
        
        let whitePawnPosition = ChessPosition(y: 1, x: 2)
        let whitePawn = Pawn(color: .white)
        board.pieces[whitePawnPosition] = whitePawn
        
        XCTAssertEqual(testPawn.getMovablePositions(on: testPawnPosition, from: board.pieces), [ChessPosition(y: 1, x: 2), ChessPosition(y: 1, x: 0)])
    }
}
