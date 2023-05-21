import 'package:flutter/material.dart';
import 'package:pokemon_app/view/pokemon_item_page.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return itemList('name', '11', 'assetImage');
        },
      ),
    );
  }

  Widget itemList(String name, String tag, String assetImage) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PokemonItemPage(
              assetImage: assetImage,
              name: name,
              tag: tag,
            ),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(assetImage),
        ),
        title: Text(name),
      ),
    );
  }
}
