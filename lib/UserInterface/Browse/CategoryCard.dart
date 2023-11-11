import 'package:flutter/material.dart';
import 'package:movies_app/UserInterface/Browse/BrowseDetails/BrowseDetails.dart';
import 'package:movies_app/UserInterface/Browse/CategoryMoviesDm.dart';


class CategoryCard extends StatefulWidget {
  CategoryMovies categoryMovies;

  CategoryCard(this.categoryMovies);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BrowseDetails(
              categoryMovies: widget.categoryMovies,
            ),
          ),
        );
      },
      child: Card(
        semanticContainer: true,
        borderOnForeground: true,
        margin: EdgeInsets.only(bottom: 10, left: 10),
        color: Color(0xFF343534),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                child: Image.asset(
                  'assets/${widget.categoryMovies.imagename}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.categoryMovies.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
