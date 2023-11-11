import 'package:flutter/material.dart';
import 'package:movies_app/Data/Api/ApiManager.dart';
import 'package:movies_app/Data/Model/Movie.dart';
import 'package:movies_app/UserInterface/Fragment/PopularSection/PopularWidget.dart';
import 'package:movies_app/UserInterface/Fragment/RecommendedSection/RecommendedWidget.dart';
import 'package:movies_app/UserInterface/Fragment/UpcommingSection/UpcommingWidget.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<MoviesModel> _popularMoviesFuture;
  late Future<MoviesModel> _newReleasesMoviesFuture;
  late Future<MoviesModel> _topRatedMoviesFuture;

  @override
  void initState() {
    super.initState();
    _popularMoviesFuture = ApiManager.getPopularMovies();
    _newReleasesMoviesFuture = ApiManager.getNewReleasesMovies();
    _topRatedMoviesFuture = ApiManager.getTopRatedMovies();
  }

  Future<void> _refreshData() async {
    setState(() {
      _popularMoviesFuture = ApiManager.getPopularMovies();
      _newReleasesMoviesFuture = ApiManager.getNewReleasesMovies();
      _topRatedMoviesFuture = ApiManager.getTopRatedMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Scaffold(
          body: RefreshIndicator(
            onRefresh: _refreshData,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<MoviesModel>(
                    future: _popularMoviesFuture,
                    builder: (context, snapShot) {
                      if (snapShot.hasError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AlertDialog(
                                title: const Text("Error"),
                                content: Text(
                                  '${snapShot.error}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _refreshData();
                                      setState(() {});
                                    },
                                    child: const Text(
                                      "Try Again",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else if (snapShot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(255, 187, 59, 1.0),
                          ),
                        );
                      }
                      return PopularWidget(snapShot.data!.results!);
                    },
                  ),
                  FutureBuilder<MoviesModel>(
                    future: _newReleasesMoviesFuture,
                    builder: (context, snapShot) {
                      if (snapShot.hasError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AlertDialog(
                                title: const Text("Error"),
                                content: Text(
                                  '${snapShot.error}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _refreshData();
                                      setState(() {});
                                    },
                                    child: const Text(
                                      "Try Again",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else if (snapShot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(255, 187, 59, 1.0),
                          ),
                        );
                      }
                      return UpcommingWidget(snapShot.data!.results!);
                    },
                  ),
                  FutureBuilder<MoviesModel>(
                    future: _topRatedMoviesFuture,
                    builder: (context, snapShot) {
                      if (snapShot.hasError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AlertDialog(
                                title: const Text("Error"),
                                content: Text(
                                  '${snapShot.error}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _refreshData();
                                      setState(() {});
                                    },
                                    child: const Text(
                                      "Try Again",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else if (snapShot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(255, 187, 59, 1.0),
                          ),
                        );
                      }
                      return RecommendedWidget(
                          snapShot.data!.results!, 'Recommended');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
