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
  List<Recipe> recipes = [
    Recipe(
      name: 'Pasta',
      image: 'assets/images/pasta.jpg',
      instructions:
          'Boil water in a large pot. Add salt and pasta to the boiling water. Cook the pasta until al dente. Drain the cooked pasta. Serve with your favorite sauce and toppings.',
    ),
    Recipe(
      name: 'Pizza',
      image: 'assets/images/pizza.jpg',
      instructions:
          'Preheat the oven to the desired temperature. Roll out the pizza dough on a floured surface. Add your favorite sauce and toppings to the dough. Transfer the pizza to a baking sheet or pizza stone. Bake in the preheated oven for the specified time. Remove from the oven and let it cool slightly before slicing.',
    ),
    // Add more recipes following the same structure
  ];

  Recipe? selectedRecipe;

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
        title: const Text('Recipe App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (selectedRecipe != null)
              Column(
                children: [
                  Text(
                    selectedRecipe!.name,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    selectedRecipe!.image,
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    selectedRecipe!.instructions,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectRandomRecipe,
              child: const Text('Choose a Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}

class Recipe {
  final String name;
  final String image;
  final String instructions;

  Recipe({required this.name, required this.image, required this.instructions});
}
