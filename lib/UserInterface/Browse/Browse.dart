import 'package:flutter/material.dart';
import 'package:movies_app/UserInterface/Browse/CategoryCard.dart';
import 'CategoryMoviesDm.dart';

typedef Onclickcategory = void Function(CategoryMovies category);

class Browse extends StatefulWidget {

  Browse();

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  List<CategoryMovies> categories = CategoryMovies.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Browse Category',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: buildCategoryGrid(),
    );
  }

  Widget buildCategoryGrid() {
    final categories =
        CategoryMovies.getAllCategories();

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 16,
        mainAxisSpacing: 15,
        crossAxisCount: 2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) => CategoryCard(categories[index]),
    );
  }
}
