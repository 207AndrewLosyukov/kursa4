import 'package:courses_app/bloc_architecture/bloc_auth/auth_events.dart';
import 'package:courses_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../bloc_architecture/bloc_auth/auth_bloc.dart';
import '../bloc_architecture/bloc_home/home_bloc.dart';

class CodeScreen extends StatefulWidget {
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  TextEditingController mailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  bool _validatecode = false;

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
                  Icons.security_outlined,
                  size: 140,
                  color: Color(0xFFEC407A),
                )),
          ),
          SizedBox(
            height: 90,
          ),
          Text(
            'Код выслан вам на почту',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: TextField(
              controller: mailController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Почта',
                errorText: _validatecode ? 'Неверная почта' : null,
                focusedErrorBorder: _validatecode
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEC407A)),
                        borderRadius: BorderRadius.all(Radius.circular(20)))
                    : null,
                errorBorder: _validatecode
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
        ],
      ),
    );
  }
}
