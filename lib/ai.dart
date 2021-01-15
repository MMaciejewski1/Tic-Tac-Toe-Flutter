import 'package:flutter/material.dart';
mixin Ai {
 static getWinner(List<int> board) {
if(board[0]==board[1]&&board[2]==board[1])return board[0];
  if(board[3]==board[4]&&board[5]==board[4])return board[3];
    if(board[6]==board[7]&&board[8]==board[7])return board[6];

      if(board[0]==board[3]&&board[6]==board[3])return board[0];
        if(board[1]==board[4]&&board[7]==board[4])return board[1];
          if(board[2]==board[5]&&board[8]==board[5])return board[2];

            if(board[6]==board[4]&&board[2]==board[4])return board[2];
              if(board[0]==board[4]&&board[8]==board[4])return board[0];

  }


 static miniMax(List<int> board, int player) {
    int winner = getWinner(board);
    if (winner == Player.computer || winner == Player.human) {
      return winner; // -1 * -1 || 1 * 1
    }
    var move = -1;
    var score = -2;

    for (int i = 0; i < 9; ++i) { // For all moves
      if (board[i] == Player.blank) { // Only possible moves
        var boardWithNewMove = board; // Copy board to make it mutable
         boardWithNewMove[i] = player; // Try the move
        var scoreForTheMove = miniMax(boardWithNewMove, player*-1);
        if (scoreForTheMove > score) {
          score = scoreForTheMove;
          move = i;
        }
      }
      if (move == -1) {
        return 0; // No move - it's a draw
      }
      return score;
    }
  }
 static aiMove(List<int> board, int player){
    int best=-1;
    int val;
    int m=10;
    for (int i = 0; i < 9; ++i) {
      if (board[i] == Player.blank) {
        val=miniMax(board, player);
        if(val>best) {
          best = val;
           m=i;
        }
      }
    }
    if(m==10) for (int i = 0; i < 9; ++i) if (board[i] == Player.blank) m=i;
    return m;
  }
}
class Player {
static const int human = -1;
static const int blank = 0;
static const int computer = 1;
}

