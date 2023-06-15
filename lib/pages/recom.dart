
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class areas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel App'),
      ),
      body: Center(
        child: Text('Welcome to our travel app!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodAndDrinkRecommendationsPage()),
          );
        },
        child: Icon(Icons.restaurant),
      ),
    );
  }
}

class FoodAndDrinkRecommendation {
  final String name;
  final String description;
  final String imageUrl;

  FoodAndDrinkRecommendation({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class FoodAndDrinkRecommendationsPage extends StatelessWidget {
  final List<FoodAndDrinkRecommendation> recommendations = [
    FoodAndDrinkRecommendation(
      name: 'Pizza Margherita',
      description: 'A classic Neapolitan pizza with tomato sauce, mozzarella, and basil.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg',
    ),
    FoodAndDrinkRecommendation(
      name: 'Mojito',
      description: 'A refreshing cocktail made with rum, lime juice, mint leaves, and soda water.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Mojito_P1010372.JPG',
    ),
    FoodAndDrinkRecommendation(
      name: 'Sushi',
      description: 'A Japanese dish made with vinegared rice and various toppings, such as raw fish or vegetables.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/60/Sushi_platter.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food and Drink Recommendations'),
      ),
      body: ListView.builder(
        itemCount: recommendations.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(recommendations[index].imageUrl),
            title: Text(recommendations[index].name),
            subtitle: Text(recommendations[index].description),
          );
        },
      ),
    );
  }
}