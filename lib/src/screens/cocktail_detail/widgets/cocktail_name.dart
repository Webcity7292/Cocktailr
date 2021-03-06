import 'package:flutter/material.dart';

class CocktailName extends StatelessWidget {
  final String cocktailName;

  CocktailName({@required this.cocktailName});

  @override
  Widget build(BuildContext context) {
    if (!cocktailName.contains(' ')) {
      return _cocktailNameWord(cocktailName, true);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildCocktailNameWords(),
    );
  }

  Text _cocktailNameWord(String word, bool bold) => Text(
        word,
        style: TextStyle(
          fontSize: 36,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
        textAlign: TextAlign.start,
      );

  List<Text> _buildCocktailNameWords() {
    List<String> words = cocktailName.split(' ');
    bool isEven = words.length % 2 == 0;
    List<Text> texts = [];

    for (int i = 0; i < words.length; i++) {
      isEven
          ? i < (words.length / 2).floor()
              ? texts.add(_cocktailNameWord(
                  words[i],
                  false,
                ))
              : texts.add(_cocktailNameWord(
                  words[i],
                  true,
                ))
          : i <= (words.length / 2).floor()
              ? texts.add(_cocktailNameWord(
                  words[i],
                  false,
                ))
              : texts.add(_cocktailNameWord(
                  words[i],
                  true,
                ));
    }

    return texts;
  }
}
