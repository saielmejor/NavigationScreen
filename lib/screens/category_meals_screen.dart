import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId; //constructor when somebody selects the category
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(
      this.availableMeals); // initialize availableMeals from the main.dart
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false; //shows that is false

  @override
  void initState() {
    //..........
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      // this will inform dart that whatever we get as an argumen it will
      // be map string keys and vavules
      //accessing route arguments by using routeArgs
      categoryTitle = routeArgs[
          'title']; //categoryTitle is not final because it will change
      final categoryId = routeArgs['id'];
      //you need to filter the category id from the dummy data list
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

// this will remove meals when the meal id equals the mealId
  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    //in the dummydata it finds where the meal is and returns
    // the category id and trans form it to a list
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      //create a dynamic list

      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
