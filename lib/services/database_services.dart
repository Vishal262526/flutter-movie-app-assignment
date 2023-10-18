import 'dart:js_interop';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/storage_services.dart';
import 'package:movie_app/utils/helper.dart';
import 'package:uuid/uuid.dart';

class DatabaseServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<bool> initDatabase() async {
    try {
      final String uid = FirebaseAuth.instance.currentUser!.uid;
      await db.collection("movies").doc(uid).set({
        "movieList": FieldValue.arrayUnion([]),
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> insertMovie(MovieModel movie, XFile? image) async {
    try {
      final String uid = FirebaseAuth.instance.currentUser!.uid;
      if (image != null) {
        final Uint8List imageData = await image.readAsBytes();

        final imageName = "${const Uuid().v1()}${getFileExtension(image.name)}";

        final String? imageUrl =
            await StorageServices().uploadImage(imageData, imageName);
        movie.posterUrl = imageUrl!;

        await db.collection("movies").doc(uid).set({
          "movieList": FieldValue.arrayUnion([movie.toJson()])
        }, SetOptions(merge: true));
      } else {
        await db.collection("movies").doc(uid).set({
          "movieList": FieldValue.arrayUnion([movie.toJson()])
        }, SetOptions(merge: true));
      }

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> deleteMovie(MovieModel movie) async {
    try {
      final String uid = FirebaseAuth.instance.currentUser!.uid;

      print("Deleteing item is working");
      await db.collection("users").doc(uid).set({
        "movieList": FieldValue.arrayRemove([movie.toJson()])
      });

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
