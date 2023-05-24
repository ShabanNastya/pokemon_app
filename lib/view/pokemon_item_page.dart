import 'package:flutter/material.dart';
import 'package:pokemon_app/entity/pokemon_model.dart';

class PokemonItemPage extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonItemPage({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        child: Column(
          children: <Widget>[
            Text(
              pokemon.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Image.network(
              pokemon.image,
              height: 250,
            ),
            _measureRow(
              'Weight:',
              '${pokemon.weight / 10} in kg',
            ),
            _measureRow(
              'Height:',
              '${pokemon.height * 10} in cm',
            ),
            const Text(
              'Types',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pokemon.types.length,
                itemBuilder: (context, index) {
                  return Chip(
                    label: Text(
                      pokemon.types[index].type.name,
                    ),
                    backgroundColor: Colors.lightBlueAccent,
                    elevation: 8,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _measureRow(String title, String measure) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(title),
        Text(measure),
      ],
    );
  }
}
