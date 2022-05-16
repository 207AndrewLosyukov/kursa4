import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

class NetworkApiReccomendPodsystem {

  searchCourse(query, tags, id) {
    return post(
      Uri.parse('http://127.0.0.1:8000/courses/search_by_query'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'query': query,
        'tags': tags,
        'client_id': id,
      }),
    );
  }


  downloadImageToFirebaseStorage(file) async {
    final storageRef = FirebaseStorage.instance.ref();

    final mountainRef = storageRef.child("ass.jpg");

    await mountainRef.putFile(file);

// 123 - mocked
    postImage(await mountainRef.getDownloadURL(), '123');
  }

  Future<Response> postImage(url, id) {
    return post(
      Uri.parse('http://127.0.0.1:8000/check_image'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'link': url,
        'client_id': id,
      }),
    );
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }
}
