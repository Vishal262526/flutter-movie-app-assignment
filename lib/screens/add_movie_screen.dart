import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/database_services.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/snackbar.dart';
import 'package:movie_app/widgets/input.dart';
import 'package:movie_app/widgets/priamry_btn.dart';
import 'package:uuid/uuid.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _directController = TextEditingController();
  XFile? pickedImage;
  bool isLoading = false;

  void showModal() {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: kPrimaryLightColor,
              color: kPrimaryColor,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: const Text("Add Movie"),
        actions: [
          IconButton(
            onPressed: () async {
              if (_nameController.text.isNotEmpty &&
                  _directController.text.isNotEmpty) {
                showModal();
                final movie = MovieModel(
                    id: const Uuid().v1(),
                    name: _nameController.text,
                    directorName: _directController.text,
                    posterUrl: null);

                final status =
                    await DatabaseServices().insertMovie(movie, pickedImage);

                if (status) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                } else {
                  print("Something went Wrong");
                }
              } else {
                showSnackBar(context, "Name and Director are required");
              }
            },
            icon: const Icon(
              Icons.done,
              size: 32,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Input(label: "Email Address", controller: _nameController),
            const SizedBox(
              height: 16,
            ),
            Input(label: "Email Address", controller: _directController),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 200,
              child: PrimaryButton(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();
                  final XFile? pickerImageFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickerImageFile != null) {
                    pickedImage = pickerImageFile;
                  }
                },
                title: "Upload Poster",
                icon: const Icon(
                  Icons.upload,
                  color: kWhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
