/* 
  s - the size of the board to be cut, in the form "width,height"
  x - an array of coordinates for vertical cuts
  y - an array of coordinates for horizontal cuts

  print(getLargestPiece("9,9", [3, 6], [3, 6])); // 9
  print(getLargestPiece("10,10", [8, 2], [2, 8])); // 36
  print(getLargestPiece("10,10", [3], [])); // 70
  print(getLargestPiece("10,10", [], [])); // 100
  print(getLargestPiece("100,70", [25], [])); // 5250
  print(getLargestPiece("100,70", [], [35])); // 3500
  print(getLargestPiece("100,70", [50], [])); // 3500
  print(getLargestPiece("100,70", [80, 20], [35])); // 2100
*/

main() {
  print(getLargestPiece("9,9", [3, 6], [3, 6])); // 9
  print(getLargestPiece("10,10", [8, 2], [2, 8])); // 36
  print(getLargestPiece("10,10", [3], [])); // 70
  print(getLargestPiece("10,10", [], [])); // 100
  print(getLargestPiece("100,70", [25], [])); // 5250
  print(getLargestPiece("100,70", [], [35])); // 3500
  print(getLargestPiece("100,70", [50], [])); // 3500
  print(getLargestPiece("100,70", [80, 20], [35])); // 2100
}

int getLargestPiece(String s, List<int> x, List<int> y) {
  final width = int.parse(s.split(",").first);
  final height = int.parse(s.split(",").last);

  int finalWidth = 0;
  int finalHeight = 0;

  x = [0, ...x, width];
  y = [0, ...y, height];

  x.sort();
  y.sort();

  for (int i = 1; i < x.length; i++) {
    final pieceLength = x[i] - x[i - 1];

    if (pieceLength > finalWidth) {
      finalWidth = pieceLength;
    }
  }

  for (int i = 1; i < y.length; i++) {
    final pieceLength = y[i] - y[i - 1];

    if (pieceLength > finalHeight) {
      finalHeight = pieceLength;
    }
  }

  return finalWidth * finalHeight;
}
