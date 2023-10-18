import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/database_services.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/widgets/movie_item.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("movies")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
              backgroundColor: kPrimaryLightColor,
            ),
          );
        } else if (snapshot.hasData) {
          if (snapshot.data!['movieList'].length > 0) {
            return ListView.builder(
              itemCount: snapshot.data!['movieList'].length,
              itemBuilder: (context, index) {
                final movie = MovieModel(
                  id: snapshot.data!['movieList'][index]['id'],
                  name: snapshot.data!['movieList'][index]['name'],
                  directorName: snapshot.data!['movieList'][index]
                      ['director_name'],
                  posterUrl: snapshot.data!['movieList'][index]['poster_url'],
                );

                return MovieItem(
                  onDeleteTap: () async {
                    await DatabaseServices().deleteMovie(movie);
                  },
                  name: movie.name,
                  directorName: movie.directorName,
                  posterUrl: movie.posterUrl,
                );
              },
            );
          } else {
            return const Center(
              child: Text("Click + to add new movies"),
            );
          }
        } else {
          return const Center(
            child: Text("Something went Wrong"),
          );
        }
      },
    );
  }
}
