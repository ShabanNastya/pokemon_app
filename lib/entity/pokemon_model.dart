class PokemonModel {
  final String name;
  final String image;
  final List<String> types;
  final int weight;
  final int height;

  PokemonModel({
    required this.name,
    required this.image,
    required this.types,
    required this.weight,
    required this.height,
  });

  PokemonModel fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"] as String,
        image: json["image"] as String,
        types: json["types"] as List<String>,
        height: json["height"] as int,
        weight: json["weight"] as int,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "types": types,
        "height": height,
        "weight": weight,
      };
}
