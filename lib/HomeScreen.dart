import 'package:flutter/material.dart';
import 'package:news_online_c4/categories.dart';
import 'package:news_online_c4/category_details_screen.dart';
import 'package:news_online_c4/item_category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            title: Text('Route News Application'),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'News App',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      selectedCategory = null;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.list,
                          size: 36,
                        ),
                        Text(
                          'Categories',
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 36,
                      ),
                      Text(
                        'Settings',
                        style: Theme.of(context).textTheme.headline5,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          body: selectedCategory == null
              ? CategoriesScreen(onCategoryClickCallBack)
              : CategoryDetailsScreen(selectedCategory!),
        )
      ],
    );
  }

  Category? selectedCategory = null;

  void onCategoryClickCallBack(Category category) {
    print(category.categoryName);
    setState(() {
      selectedCategory = category;
    });
  }
}
