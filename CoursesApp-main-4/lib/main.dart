import 'dart:io';

import 'package:courses_app/bloc_architecture/bloc_profile/profile_bloc.dart';
import 'package:courses_app/dependencies.dart';
import 'package:courses_app/navigator_panel/navigator.dart';
import 'package:courses_app/network/podcast_network.dart';
import 'package:courses_app/network_api_reccomend.dart';
import 'package:courses_app/pages/authpage.dart';
import 'package:courses_app/pages/podcastpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_architecture/bloc_auth/auth_bloc.dart';
import 'navigator_panel/main_panel.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  await Dependencies.init();
  runApp(BackGestureWidthTheme(
      backGestureWidth: BackGestureWidth.fraction(1 / 2),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.white,
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS:
                  CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
            })),
        home: Dependencies.instance.actualUser.name != 'Vasya'
            ? MainScreen(
                key: AppNavigator.bottomBarKey,
              )
            : BlocProvider(
                child: LoginScreen(),
                create: (BuildContext context) => AuthBloc(),
              ),
        navigatorKey: AppNavigator.navigatorKey,
      )));
}

_downloadImage() async {
  print(
      await FirebaseStorage.instance.ref().child("18+.jpeg").getDownloadURL());
}

_uploadImage() async {
  var url = (FirebaseStorage.instance.ref().child("path")).putFile(File(
      "/Users/andrey.losyukov/dzpervachek/CoursesApp-main-3/assets/telochki.jpg"));
  print(url);
}
