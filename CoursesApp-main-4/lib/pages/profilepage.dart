import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/bloc_architecture/bloc_profile/profile_bloc.dart';
import 'package:courses_app/bloc_architecture/bloc_profile/profile_bloc.dart';
import 'package:courses_app/bloc_architecture/bloc_profile/profile_events.dart';
import 'package:courses_app/dependencies.dart';
//import 'package:courses_app/models/data/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ProfileBloc>(context);
    final user = Dependencies.instance.actualUser;

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Center(
            child: Stack(
              children: [
                buildImage(),
                Positioned(
                  bottom: 0,
                  right: 15,
                  child: buildEditIcon(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          buildName(),
          const SizedBox(height: 80),
          buildLikes(bloc),
          const SizedBox(height: 24),
          buildPassed(bloc),
          //const SizedBox(height: 24),
          //buildPay(bloc),
          const SizedBox(height: 120),
          Center(
              child: Text(
            "Выйти",
            style: TextStyle(
              fontSize: 16,
              decoration: TextDecoration.underline,
              color: Colors.grey,
            ),
          ))
        ],
      ),
    );
  }

  Widget buildImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: CachedNetworkImageProvider(
              Dependencies.instance.actualUser.coverImage),
          fit: BoxFit.cover,
          width: 228,
          height: 228,
        ),
      ),
    );
  }

  Widget buildEditIcon() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      //color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Color(0xFFEC407A)),
        ),
        child: const Icon(
          Icons.edit,
          color: Color(0xFFEC407A),
          size: 30,
        ),
      ),
    );
  }

  Widget buildName() {
    return Column(
      children: [
        Text(
          Dependencies.instance.actualUser.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          Dependencies.instance.actualUser.email,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget buildLikes(ProfileBloc bloc) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: GestureDetector(
        onTap: () {
          bloc.inEvent.add(OnFavouritesClick());
        },
        child: Container(
          width: 100,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xFFEC407A))),
          child: Row(
            children: [
              IconButton(
                iconSize: 30.0,
                color: Color(0xFFEC407A),
                disabledColor: Colors.black87,
                splashColor: Colors.red,
                highlightColor: Color(0xFFEC407A),
                padding: EdgeInsets.all(5),
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  /*if (artBox.containsKey(art.id)) {
            artBox.delete(art.id);
          } else {
            artBox.put(art.id, art);
          }*/
                },
              ),
              SizedBox(
                width: 44,
              ),
              Text(
                "Вам понравилось",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPassed(ProfileBloc bloc) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: GestureDetector(
        onTap: () {
          bloc.inEvent.add(OnPassedClick());
        },
        child: Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFEC407A))),
            child: Row(
              children: [
                IconButton(
                  iconSize: 30.0,
                  color: Color(0xFFEC407A),
                  disabledColor: Colors.black87,
                  splashColor: Colors.red,
                  highlightColor: Color(0xFFEC407A),
                  padding: EdgeInsets.all(5),
                  icon: Icon(Icons.done),
                  onPressed: () {
                    /*if (artBox.containsKey(art.id)) {
            artBox.delete(art.id);
          } else {
            artBox.put(art.id, art);
          }*/
                  },
                ),
                SizedBox(
                  width: 44,
                ),
                Text(
                  "Пройденные курсы",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                )
              ],
            )),
      ),
    );
  }

  /*Widget buildPay(ProfileBloc bloc) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: GestureDetector(
        onTap: () {
          bloc.inEvent.add(OnPassedClick());
        },
        child: Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFEC407A))),
            child: Row(
              children: [
                IconButton(
                  iconSize: 30.0,
                  color: Color(0xFFEC407A),
                  disabledColor: Colors.black87,
                  splashColor: Colors.red,
                  highlightColor: Color(0xFFEC407A),
                  padding: EdgeInsets.all(5),
                  icon: Icon(Icons.payment),
                  onPressed: () {
                    /*if (artBox.containsKey(art.id)) {
            artBox.delete(art.id);
          } else {
            artBox.put(art.id, art);
          }*/
                  },
                ),
                SizedBox(
                  width: 44,
                ),
                Text(
                  "Платежные данные",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                )
              ],
            )),
      ),
    );
  }*/
}
