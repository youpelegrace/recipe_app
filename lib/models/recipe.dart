class Recipe {
  final String name;
  final String imgaes;
  final double rating;
  final String totalTime;

  Recipe(
      {required this.imgaes,
      required this.name,
      required this.rating,
      required this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        imgaes: json["images"][0]["hostedLargeUrl"] as String,
        name: json["name"] as String,
        rating: json["rating"] as double,
        totalTime: json["totalTime"] as String);
  }

  static List<Recipe> recipesFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  String toString() {
    return "Recipe {name: $name, images: $imgaes, rating: $rating, totalTime:$totalTime}";
  }
}
