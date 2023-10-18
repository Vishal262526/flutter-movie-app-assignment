import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/add_movie_screen.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/snackbar.dart';
import 'package:movie_app/widgets/movie_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: const Text(
          "Movies",
        ),
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                } catch (e) {
                  showSnackBar(context, e.toString());
                }
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        child: const MovieList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddMovieScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
