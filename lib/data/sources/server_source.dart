import 'dart:convert';
import 'dart:io';
import 'package:casino_test/core/core.dart';
import 'package:casino_test/data/models/character_model.dart';
import 'package:http/http.dart' as http;

abstract class ServerSource {
  Future<List<CharacterModel>> getCharacters(int page);
}

class ServerSourceImp implements ServerSource {
  final http.Client client;

  const ServerSourceImp({
    required this.client,
  });

  @override
  Future<List<CharacterModel>> getCharacters(int page) async {
    try {
      final url = Uri.parse('${NetworkPath.characters}?page=$page');

      http.Response response = await client.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        List<CharacterModel> result = (jsonResponse['results'] as List)
            .map((character) => CharacterModel.fromJson(character))
            .toList();
        return result;
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }
}
