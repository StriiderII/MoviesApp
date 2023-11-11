import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/Data/Model/Movie.dart';

class DatabaseUtils {
  static CollectionReference<Movie> getMoviesCollection() {
    return FirebaseFirestore.instance.collection("Movies").withConverter<Movie>(
        fromFirestore: (snapshot, option) => Movie.fromJson(snapshot.data()!),
        toFirestore: (value, option) => value.toJson());
  }

  static Future<void> AddMoviesToFirebase(Movie movie) {
    var collection = getMoviesCollection();
    var docref = collection.doc();
    movie.DataBaseId = docref.id;
    return docref.set(movie);
  }

  static Stream<QuerySnapshot<Movie>> readMoviesFormFirebaseWL() {
    return getMoviesCollection().snapshots();
  }

  static Future<QuerySnapshot<Movie>> readMovieFormFirebase(num id) async {
    var mov = await getMoviesCollection().where('id', isEqualTo: id).get();
    return mov;
  }

  static Future<void> DeletTask(String id) {
    return getMoviesCollection().doc(id).delete();
  }
}
