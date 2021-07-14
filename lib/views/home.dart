// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.api.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            Icon(
              Icons.restaurant_menu,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            // ignore: prefer_const_constructors
            Text(
              "Food Recipe",
              // ignore: prefer_const_constructors
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                return RecipeCard(
                    title: _recipes[index].name,
                    cookTime: _recipes[index].totalTime,
                    rating: _recipes[index].rating.toString(),
                    thumbnailUrl: _recipes[index].imgaes);
              },
            ),
    );
  }
}
