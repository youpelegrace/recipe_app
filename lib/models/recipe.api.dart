import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list",
        {"start": "0", "limit": "18", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "6cde067007msh1cb33a40af806b5p1e483ajsneb4cf5057b3e",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data["feed"]) {
      _temp.add(i["content"]["details"]);
    }

    return Recipe.recipesFromSnapShot(_temp);
  }
}
