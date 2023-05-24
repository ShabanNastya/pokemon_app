class PokemonModel {
  final String name;
  final String image;
  final List<Type> types;
  final int weight;
  final int height;

  PokemonModel({
    required this.name,
    required this.image,
    required this.types,
    required this.weight,
    required this.height,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"],
        image: json["sprites"]["other"]["official-artwork"]["front_default"],
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        height: json["height"],
        weight: json["weight"],
      );
}

class PokemonList {
  final String name;
  final String url;

  PokemonList({
    required this.name,
    required this.url,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        name: json["name"],
        url: json["url"],
      );
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int slot;
  final PokemonList type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: PokemonList.fromJson(
          json["type"],
        ),
      );
}
