import 'package:casino_test/domain/domain.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(character.image),
      title: Row(
        children: [
          Text(
            "Name: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          Text(character.name),
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            "Gender: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          Text(character.gender),
        ],
      ),
    );
  }
}
