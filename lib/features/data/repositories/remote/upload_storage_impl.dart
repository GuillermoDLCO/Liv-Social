import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:liv_social/features/domain/repositories/upload_storage_repository.dart';

class CloudStorageImpl extends CloudStorageRepository {
  @override
  Future<String> uploadFile(File file, String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final uploadTask = ref.putFile(file);
    await uploadTask;
    return await ref.getDownloadURL();
  }
}
