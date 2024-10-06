import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/api/api_service.dart';
import 'package:shared_shopping_list/pages/main_page.dart';
import 'package:shared_shopping_list/widgets/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(debugLabel: "LoginForm");

  final TextEditingController _usernameTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _createFormField(
              'Nom d\'utilisateur',
              _usernameTextFieldController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ doit être remplit';
                }
                if (value.length > 16) {
                  return 'Le nom d\'utilisateur ne peux pas faire plus de 16 characters';
                }
                if (value.length < 4) {
                  return 'Le nom d\'utilisateur ne peux pas faire moins de 4 characters';
                }
                return null;
              },
            ),
            _createFormField(
              'Mots de passe',
              _passwordTextFieldController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ doit être remplit';
                }
                return null;
              },
              isPasswordField: true
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createFormButton(const Text('Se connecter'), () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Connexion en cours'),
                      duration: Duration(days: 1),
                    ),
                  );
                  ApiService()
                      .login(_usernameTextFieldController.text,
                          _passwordTextFieldController.text)
                      .then(
                    (value) {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      if (value.loginSuccess) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(_usernameTextFieldController.text)));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Mauvais nom d'utilisateur ou mots de passe"),
                            duration: Duration(milliseconds: 750),
                          ),
                        );
                      }
                    },
                  );
                  //
                }),
                _createFormButton(const Text('S\'inscrire'), () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _createFormField(String labelText, TextEditingController controller,
      {String? Function(String? value)? validator, bool isPasswordField = false}) {
    if(isPasswordField) {
      return Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: PasswordField(
          labelText: labelText,
          validator: validator,
          controller: controller,
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
          ),
          validator: validator,
          controller: controller,
        ),
      );
    }
  }

  Future<void> wait1Second() async {
    for (var i = 0; i < 100000; i++) {
      print(i);
    }
  }

  Widget _createFormButton(Widget child, void Function() onPressed) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
