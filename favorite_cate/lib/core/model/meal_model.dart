

List<String> complexes = ["简单", "中等", "困难"];

class FCMealModel {
  String? id;
  List<String>? categories;
  String? title;
  int? affordability;
  int? complexity;
  late String complexStr;
  String? imageUrl;
  int? duration;
  List<String>? ingredients;
  List<String>? steps;
  bool? isGlutenFree;
  bool? isVegan;
  bool? isVegetarian;
  bool? isLactoseFree;

  FCMealModel(
      {this.id,
      this.categories,
      this.title,
      this.affordability,
      this.complexity,
      this.imageUrl,
      this.duration,
      this.ingredients,
      this.steps,
      this.isGlutenFree,
      this.isVegan,
      this.isVegetarian,
      this.isLactoseFree});

  FCMealModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categories = json['categories'].cast<String>();
    title = json['title'];
    affordability = json['affordability'];
    complexity = json['complexity'];
    complexStr = complexes[json["complexity"]];
    imageUrl = json['imageUrl'];
    duration = json['duration'];
    ingredients = json['ingredients'].cast<String>();
    steps = json['steps'].cast<String>();
    isGlutenFree = json['isGlutenFree'];
    isVegan = json['isVegan'];
    isVegetarian = json['isVegetarian'];
    isLactoseFree = json['isLactoseFree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categories'] = categories;
    data['title'] = title;
    data['affordability'] = affordability;
    data['complexity'] = complexity;
    data['imageUrl'] = imageUrl;
    data['duration'] = duration;
    data['ingredients'] = ingredients;
    data['steps'] = steps;
    data['isGlutenFree'] = isGlutenFree;
    data['isVegan'] = isVegan;
    data['isVegetarian'] = isVegetarian;
    data['isLactoseFree'] = isLactoseFree;
    return data;
  }
}