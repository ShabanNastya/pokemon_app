import 'package:dio/dio.dart';
import 'package:pokemon_app/entity/pokemon_model.dart';

class PokemonInteractor {
  static final Dio dio = Dio();
  static const _baseApi = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<PokemonModel>> getPokemonList() async {
    try {
      Response response = await dio.get('$_baseApi?limit=100&offset=0');

      final pokemonResultResponse = response.data;
      List<PokemonList> resultPokemon = pokemonResultResponse['results']
          .map<PokemonList>(
              (resultPokemon) => PokemonList.fromJson(resultPokemon))
          .toList();

      final pokemons = <PokemonModel>[];
      for (var pokemon in resultPokemon) {
        pokemons.add(await getPokemon(pokemon.name));
      }
      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonModel> getPokemon(String name) async {
    try {
      Response response = await dio.get('$_baseApi/$name');
      final pokemonResponse = response.data;

      return PokemonModel.fromJson(pokemonResponse);
    } catch (e) {
      rethrow;
    }
  }
}
