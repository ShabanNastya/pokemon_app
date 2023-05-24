import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_app/entity/pokemon_model.dart';
import '../../interactor/pokemon_interactor.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonInteractor pokemonInteractor;
  List<PokemonModel> pokemonList = [];

  PokemonBloc({required this.pokemonInteractor}) : super(InitialState()) {
    on<LoadPokemonEvent>((event, emit) async {
      emit(LoadingState());
      try {
        pokemonList = await pokemonInteractor.getPokemonList();
        emit(
          SuccessState(
            pokemon: pokemonList,
          ),
        );
      } catch (e) {
        emit(
          ErrorState(
            e.toString(),
          ),
        );
      }
    });
  }
}
