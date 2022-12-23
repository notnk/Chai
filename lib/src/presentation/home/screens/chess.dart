import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class ChessPage extends StatefulWidget {
  const ChessPage({Key? key}) : super(key: key);

  @override
  _ChessPageState createState() => _ChessPageState();
}

class _ChessPageState extends State<ChessPage> {
  ChessBoardController controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easter Egg?'),
      ),
      body: Center(
        child: ChessBoard(
          controller: controller,
          boardColor: BoardColor.orange,
          boardOrientation: PlayerColor.white,
        ),
      ),
    );
  }
}
