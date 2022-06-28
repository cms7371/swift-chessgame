//
//  ChessGridCellView.swift
//  ChessGame
//
//  Created by kakao on 2022/06/27.
//

import SwiftUI

struct ChessCellView: View {
    @EnvironmentObject var gameManager: ChessGameManager

    let position: ChessPosition
    
    var body: some View {
        Button {
            let isSuccess = gameManager.select(position: position)
            if !isSuccess {
                let hapticGenerator = UINotificationFeedbackGenerator()
                hapticGenerator.notificationOccurred(.error)
            }
        } label: {
            Rectangle()
                .stroke(outlineColor, lineWidth: 5.0)
                .background(backgroundColor)
                .aspectRatio(1.0, contentMode: .fit)
                .overlay {
                    Text(pieceIcon)
                        .foregroundColor(.black)
                        .modifier(FittingFontSizeModifier())
                }
        }
    }
    
    var outlineColor: Color {
        let color: Color
        if gameManager.selectedPosition == position {
            color = .red
        } else if gameManager.movablePositions?.contains(position) ?? false {
            color = .blue
        } else {
            color = .clear
        }
        return color
    }
    
    var backgroundColor: Color {
        let yxSum = position.y + position.x
        if yxSum % 2 == 0 {
            return Color.white
        } else {
            return Color.brown
        }
    }
    
    var pieceIcon: String {
        guard let piece = gameManager.board[position] else {
            return ""
        }
        return piece.icon
    }
}

struct ChessGridCellView_Previews: PreviewProvider {

    static var previews: some View {
        ChessCellView(position: ChessPosition(y: 7, x: 1))
            .environmentObject(gameManager)
    }
    
    static var gameManager: ChessGameManager {
        let manager = ChessGameManager()
        manager.resetGame()
        return manager
    }
}


struct FittingFontSizeModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 1000))
      .minimumScaleFactor(0.001)
  }
}
