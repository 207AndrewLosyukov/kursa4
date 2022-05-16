import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc_architecture/bloc_register/register_bloc.dart';
import '../bloc_architecture/bloc_register/register_events.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Девушка"), value: "Девушка"),
    DropdownMenuItem(child: Text("Парень"), value: "Парень"),
  ];
  return menuItems;
}

class CreateScreen extends StatefulWidget {
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  bool _validateName = false;
  bool _validateMail = false;
  File? image;

  String selectedValue = "Девушка";

  @override
  Widget build(BuildContext context) {
    final RegisterBloc bloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
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
          SizedBox(
            height: 60,
          ),
          Text(
            'Расскажите нам о себе',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: TextField(
              controller: nameController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Имя',
                errorText: _validateName ? 'Неужели такое короткое имя?' : null,
                focusedErrorBorder: _validateName
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
            child: DropdownButtonFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFEC407A)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFEC407A)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                dropdownColor: Colors.white,
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: dropdownItems),
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
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
            child: GestureDetector(
              onTap: () {
                if (mailController.text.isEmpty &&
                    nameController.text.isEmpty) {
                  setState(() {
                    _validateName = true;
                    _validateMail = true;
                  });
                } else if (mailController.text.isEmpty) {
                  setState(() {
                    _validateMail = true;
                    _validateName = false;
                  });
                } else if (nameController.text.isEmpty) {
                  setState(() {
                    _validateName = true;
                    _validateMail = false;
                  });
                } else {
                  bloc.inEvent.add(OnSendClick());
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 70,
                  color: Color(0xFFEC407A),
                  child: Center(
                    child: Text('О Т П Р А В И Т Ь',
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
        ],
      ),
    );
  }

  Widget buildImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: image == null
            ? Ink.image(
                image: const NetworkImage(
                    'https://catherineasquithgallery.com/uploads/posts/2021-02/1614529310_67-p-golova-na-belom-fone-74.png'),
                fit: BoxFit.cover,
                width: 228,
                height: 228,
              )
            : Image.file(
                image!,
                fit: BoxFit.cover,
                width: 228,
                height: 228,
              ),
      ),
    );
  }

  Widget buildEditIcon() {
    return GestureDetector(
      onTap: () => pickImage(),
      child: Container(
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
            Icons.photo_camera_back_outlined,
            color: Color(0xFFEC407A),
            size: 30,
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final newImage = File(image.path);
      setState(() => this.image = newImage);
    } on PlatformException catch (e) {
      print('не получилось загрузить фото: $e');
    }
  }
}
