part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class LoadPokemonEvent extends PokemonEvent {
  @override
  List<Object?> get props => [];
}
