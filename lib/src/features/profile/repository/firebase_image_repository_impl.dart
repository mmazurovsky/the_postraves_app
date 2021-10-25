import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import '../../../dependency_injection.dart';

abstract class FirebaseImageRepository {
  Future<String> uploadImage(File imageFile);
}

class FirebaseImageRepositoryImpl implements FirebaseImageRepository {
  @override
  Future<String> uploadImage(File imageFile) async {
    UploadTask uploadTask;
    late String imageLink;

    try {
      final refr = serviceLocator<FirebaseStorage>()
          .ref('users/user-${DateTime.now().toUtc()}.png');
      uploadTask = refr.putFile(imageFile);
      await uploadTask
          .whenComplete(() async => imageLink = await refr.getDownloadURL());
    } on FirebaseException catch (e) {
      // TODO Exception:
    }

    return imageLink;
  }
}
