import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/entity/pokemon_model.dart';
import 'package:pokemon_app/view/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/view/pokemon_item_page.dart';
import 'package:pokemon_app/view/splash_page.dart';
import '../interactor/pokemon_interactor.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final List<PokemonModel> _pokemonList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonBloc(pokemonInteractor: PokemonInteractor())
        ..add(LoadPokemonEvent()),
      child: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is InitialState ||
              state is LoadingState && _pokemonList.isEmpty) {
            return const SplashPage();
          } else if (state is ErrorState && _pokemonList.isEmpty) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<PokemonBloc>(context)
                        .add(LoadPokemonEvent());
                  },
                  child: const Text('Try again...'),
                ),
              ),
            );
          } else if (state is SuccessState) {
            _pokemonList.addAll(state.pokemon);
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Pokemon App'),
            ),
            body: ListView.separated(
              itemCount: _pokemonList.length,
              itemBuilder: (context, index) {
                return _itemList(_pokemonList[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          );
        },
      ),
    );
  }

  Widget _itemList(PokemonModel pokemon) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PokemonItemPage(
              pokemon: pokemon,
            ),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            pokemon.image,
          ),
        ),
        title: Text(pokemon.name),
      ),
    );
  }
}
