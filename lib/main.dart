import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipeScreen(),
    );
  }
}

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<String> recipes = [
    'Pasta',
    'Pizza',
    'Salad',
    'Soup',
    'Burger',
    'Stir-fry',
    'Sandwich',
  ];
  String selectedRecipe = '';

  void selectRandomRecipe() {
    final random = Random();
    final index = random.nextInt(recipes.length);
    setState(() {
      selectedRecipe = recipes[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (selectedRecipe.isNotEmpty)
              Text(
                selectedRecipe,
                style: TextStyle(fontSize: 24),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectRandomRecipe,
              child: Text('Choose a Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
