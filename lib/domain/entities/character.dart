import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String species;
  final String gender;
  final String image;

  const Character({
    required this.id,
    required this.name,
    required this.species,
    required this.gender,
    required this.image,
  });

  @override
  List<Object> get props => [id, name, species, gender, image];
}
