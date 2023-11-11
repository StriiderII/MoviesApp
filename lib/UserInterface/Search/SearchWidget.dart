import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Data/Model/Movie.dart';
import 'package:movies_app/UserInterface/MovieDetails.dart';

import '../../data/api/Constant.dart';

class SearchWidget extends StatefulWidget {
  final List<Movie>? movies;
  final String query;

  SearchWidget({required this.movies, required this.query});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.movies == null || widget.movies!.isEmpty) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/iconmaterial.png')),
            SizedBox(height: 10),
            Center(
              child: Text(
                'No Movies Found',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6745098233222961),
                  fontSize: 13,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: widget.movies?.length,
          itemBuilder: (context, index) {
            final movie = widget.movies![index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, MovieDetails.routeName,
                    arguments: movie);
              },
              child: ListTile(
                title: Card(
                  margin: EdgeInsets.only(bottom: 10, left: 10),
                  color: Color.fromRGBO(52, 53, 52, 1.0),
                  clipBehavior: Clip.antiAlias,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: CachedNetworkImage(
                          imageUrl: "$img${movie.posterPath}",
                          imageBuilder: (context, imageProvider) => Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 42,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title ?? 'Title Not Available',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              movie.releaseDate ?? 'Title Not Available',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
