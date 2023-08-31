import 'package:casino_test/domain/entities/character.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends Character {
  const CharacterModel(
      {required int id,
      required String name,
      required String species,
      required String gender,
      required String image})
      : super(id: id, name: name, species: species, gender: gender, image: image);

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
