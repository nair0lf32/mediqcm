import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRegister extends StatefulWidget {
  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  //Here comes the variables we need
  final _formKey = GlobalKey<FormState>();
  String uploadText = 'choisir photo de profil (facultatif)';
  String _name = '', _email = '', _password = '', _picture = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Nouveau compte: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Anton',
                    ),
                  ),

                  //NAME
                  TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Nom d\'utilaisateur: '),
                        hintText: 'Entrez un pseudo ou un nom',
                      ),
                      maxLength: 23,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      validator: (value) {
                        if (value == '') {
                          return 'Obligatoire pour vous identifier';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                            _name = value;
                          })),

                  //EMAIL
                  TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Email: '),
                        hintText: 'Entrez votre email (exemple@mail.com)',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == '') {
                          return 'Obligatoire pour vous identifier';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                            _email = value;
                          })),

                  //PASSWORD
                  TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Mot de passe: '),
                        hintText: 'Choisissez un bon mot de passe',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == '') {
                          return 'Obligatoire pour raison de sécurité!';
                        }
                        if (value!.length < 8) {
                          return 'Minimum 8 charactères';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                            _password = value;
                          })),

                  //PASSWORD (CONFIRM)
                  TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Confirmer mot de passe: '),
                        hintText: 're-saisissez le mot de passe',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == '') {
                          return 'Obligatoire pour raison de sécurité!';
                        }
                        if (value == _password) {
                          return 'Mot de passe non-identique';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                            _name = value;
                          })),

                  const SizedBox(
                    height: 25,
                  ),

                  //IMAGES
                  TextButton(
                    child: Text(uploadText),
                    onPressed: () async {
                      setState(() {
                        uploadText = 'Chargement...';
                      });
                      _picture = '';
                      //TODO: UPLOAD PICTURES
                      if (_picture.isNotEmpty) {
                        setState(() {
                          uploadText = 'Images ajoutées!';
                        });
                      }
                    },
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      //If everything is good
                      if (_formKey.currentState?.validate() == true &&
                          _picture.isNotEmpty) {
                        try {
//TODO: VALIDATE EVERYTHING
                        } catch (err) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  elevation: 2,
                                  title: const Text(
                                    'Erreur',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(err.toString()),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'fermer ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                      }

                      //TODO:CHANGE BELOW TEST FUNCTION TO REAL AUTH HANDLE
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      //You are now a known user (to be moved to register)
                      await prefs.setBool('isNewUser', false);
                    },
                    child: Text(
                      'S\' Enregistrer',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
