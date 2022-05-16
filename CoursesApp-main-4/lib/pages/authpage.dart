import 'package:courses_app/bloc_architecture/bloc_auth/auth_events.dart';
import 'package:courses_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../bloc_architecture/bloc_auth/auth_bloc.dart';
import '../bloc_architecture/bloc_home/home_bloc.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  bool _validateMail = false;
  bool _validatePass = false;

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Center(
            child: Container(
                height: 140,
                width: 400,
                child: Icon(
                  // Icons.done_all_outlined,
                  Icons.menu_book_outlined,
                  size: 140,
                  color: Color(0xFFEC407A),
                )),
          ),
          SizedBox(
            height: 90,
          ),
          GestureDetector(
            onTap: () {
              print('object');
              return bloc.inEvent.add(OnClickCreate());
            },
            child: Text(
              'Еще нет аккаунта? СОЗДАТЬ',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: TextField(
              controller: mailController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Почта',
                errorText: _validateMail ? 'Неверная почта' : null,
                focusedErrorBorder: _validateMail
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEC407A)),
                        borderRadius: BorderRadius.all(Radius.circular(20)))
                    : null,
                errorBorder: _validateMail
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20)))
                    : null,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFEC407A)),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              //keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
            child: TextField(
              controller: passController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Пароль',
                errorText: _validatePass ? 'Неверный пароль' : null,
                focusedErrorBorder: _validatePass
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEC407A)),
                        borderRadius: BorderRadius.all(Radius.circular(20)))
                    : null,
                errorBorder: _validatePass
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20)))
                    : null,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFEC407A)),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              //keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
            child: GestureDetector(
              onTap: () {
                if (mailController.text.isEmpty &&
                    passController.text.isEmpty) {
                  setState(() {
                    _validatePass = true;
                    _validateMail = true;
                  });
                } else if (mailController.text.isEmpty) {
                  setState(() {
                    _validateMail = true;
                  });
                } else if (passController.text.isEmpty) {
                  setState(() {
                    _validatePass = true;
                  });
                } else {
                  bloc.inEvent.add(OnClickStart());
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 70,
                  color: Color(0xFFEC407A),
                  child: Center(
                    child: Text('Н А Ч А Т Ь',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: SignInButton(
              Buttons.Google,
              text: "Войти",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 10),
            child: SignInButton(
              Buttons.Facebook,
              text: "Войти",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 10),
            child: SignInButton(
              Buttons.AppleDark,
              text: "Войти",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
