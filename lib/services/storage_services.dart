import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageServices {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadImage(Uint8List image, String imageName) async {
    try {
      final Reference storageRef = _storage.ref();

      final imageRef = storageRef.child("poster/$imageName");
      print("Image data is ............ $image");
      final UploadTask uploadedImage = imageRef.putData(image);
      final TaskSnapshot snap = await uploadedImage.whenComplete(() => null);

      final String url = await snap.ref.getDownloadURL();
      print("Url is ............. $url");
      return url;
    } catch (e) {
      print("Errrrrrrrrrror is ................. $e");
      return null;
    }
  }
}
