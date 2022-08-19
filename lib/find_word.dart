String findWord(List<String> lettersArray) {
  int wordLength = lettersArray.length + 1;
  String word = "";

  final letters = lettersArray.join('').replaceAll('>', '').split('');
  // "P","E","E","R","R","U"

  for (final letter in letters) {
    int letterCount = letters.where((e) => e == letter).length;
    if (letterCount == 1) {
      if (lettersArray.join('').contains("$letter>")) {
        word = letter;
      }
    }
  }

  String tempLetter = word;

  while (word.length < wordLength) {
    for (final tempLetters in lettersArray) {
      if (tempLetters.contains("$word>")) {
        tempLetter = tempLetters.split('>').last;

        word += tempLetter;
      }
    }
  }

  return word;
}

void main(List<String> args) {
  /* 
  A precedence rule is given as "P>E", which means that letter "P" is followed directly by the letter "E". 
  Write a function, given an array of precedence rules, that finds the word represented by the given rules.
  Note: Each represented word contains a set of unique characters, i.e. the word does not contain duplicate letters.
  Examples:
   */

  print(findWord(["P>E", "E>R", "R>U"])); // PERU
  print(findWord(["I>N", "A>I", "P>A", "S>P"])); // SPAIN

  print(findWord(["U>N", "G>A", "R>Y", "H>U", "N>G", "A>R"])); // HUNGARY
  print(findWord(["I>F", "W>I", "S>W", "F>T"])); // SWIFT

  print(
    findWord(["R>T", "A>L", "P>O", "O>R", "G>A", "T>U", "U>G"]),
  ); // PORTUGAL

  print(
    findWord([
      "W>I",
      "R>L",
      "T>Z",
      "Z>E",
      "S>W",
      "E>R",
      "L>A",
      "A>N",
      "N>D",
      "I>T",
    ]),
  ); // SWITZERLAND

  print(findWord(["I>N", "A>I", "P>A", "S>P"])); // SPAIN
}
