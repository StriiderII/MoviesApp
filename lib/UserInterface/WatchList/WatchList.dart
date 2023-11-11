import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Data/databaseUtils/Utils.dart';
import 'package:movies_app/Data/Model/Movie.dart';
import 'package:movies_app/ThemeData/MyThemeData.dart';
import 'package:movies_app/UserInterface/WatchList/WatchListItems.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyThemeData.lightprimary,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Watchlist',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot<Movie>>(
              stream: DatabaseUtils.readMoviesFormFirebaseWL(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: MyThemeData.selectedItemColor,
                  ));
                }
                List<Movie> movies =
                    snapshot.data?.docs.map((task) => task.data()).toList() ??
                        [];
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return WatchListItems(movies[index]);
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
