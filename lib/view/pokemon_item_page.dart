import 'package:flutter/material.dart';

class PokemonItemPage extends StatelessWidget {
  final String assetImage;
  final String name;
  final String tag;

  const PokemonItemPage({
    super.key,
    required this.assetImage,
    required this.name,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: tag,
            child: ClipRRect(
              child: SizedBox(
                child: Image.asset(
                  assetImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Row(
            children: [
              Text('Weight'),
              Text('5'),
            ],
          ),
          const Row(
            children: [
              Text('Height'),
              Text('15'),
            ],
          ),
        ],
      ),
    );
  }
}
