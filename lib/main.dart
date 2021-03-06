import 'package:flutter/material.dart';
import 'package:naviagtion_app/screens/categories_screen.dart';
import 'package:naviagtion_app/screens/category_meals_screen.dart';
import 'package:naviagtion_app/screens/filter_screen.dart';
import 'package:naviagtion_app/screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filter_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  // create a list of meals from dummy_data.dart
  List<Meal> _availableMeals = DUMMY_MEALS;
  //create a list if favorite meals
  List<Meal> _favoritedMeals = []; // leave as empty as default
  //new method to get a map
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData; // update filters properties
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

//create a function to manage favorite filters

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    //create if statement to findout if the existing index is true . this is true if its  > 0

    if (existingIndex >= 0) {
      setState(
        () {
          _favoritedMeals.removeAt(existingIndex);
          // if true it will toggle the selected favoritedmeal back to false s
        },
      );
    } else {
      setState(() { //add set state to change the state 
        _favoritedMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  //checking if the meal is favorite
  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Deli Meals ',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ))),
        // home: CategoriesScreen(),
        //you can identify the routes or scren
        routes: {
          '/': (ctx) => TabsScren(_favoritedMeals), //forward favorited meals
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName: (ctx) =>
              MealDetailScreen(_toggleFavorite, _isMealFavorite),
          FiltersScreen.routeName: (ctx) =>
              FiltersScreen(_filters, _setFilters) // add a pointer to setFilter
        },
        // onGenerateRoute: (settings) {
        //   print(settings.arguments);
        //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        // },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        });
  }
}
