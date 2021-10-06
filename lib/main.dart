import 'package:flutter/material.dart';
import 'package:naviagtion_app/screens/categories_screen.dart';
import 'package:naviagtion_app/screens/category_meals_screen.dart';
import 'package:naviagtion_app/screens/filter_screen.dart';
import 'package:naviagtion_app/screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filter_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          '/': (ctx) => TabsScren(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
          FiltersScreen.routeName:(ctx)=> FiltersScreen(),
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
