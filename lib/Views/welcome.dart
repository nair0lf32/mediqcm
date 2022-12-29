import 'package:flutter/material.dart';

class MyWelcome extends StatefulWidget {
  @override
  State<MyWelcome> createState() => _MyWelcomeState();
}

class _MyWelcomeState extends State<MyWelcome> {
  String message = 'Bienvenue sur mediqcm!\n\n'
      ' Attention vous ne verrez ce message'
      ' qu\'une seule fois!\n\n Mediqcm est un simple "jeu" pour tester vos '
      'connaissances en médecine. Une sorte de "Trivia", mais avec des QCM '
      'dans le thème medical. ';
  String instructions = 'appuyez ici pour continuer';
  int clickCount = 0;
  bool isButtonsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        /*Welcome display message changes as the user clicks on his screen
        until we navigate to next pages.
        * */
        onTap: () {
          setState(() {
            clickCount += 1;
          });
          if (clickCount == 1) {
            setState(() {
              message = 'Mediqcm peut rendre vos révisions un peu plus'
                  ' ludiques (si possible) ou simplement vous permettre de'
                  ' rapidement vous remémorer de vieilles notions et évaluer'
                  ' votre propre niveau de connaissances!';
            });
          }
          if (clickCount == 2) {
            setState(() {
              message = 'Tout le monde est libre de jouer, mais il est plus '
                  'qu\'évident qu\'avant de viser le grand public, '
                  'Mediqcm s\' addresse surtout aux professionels de la santé,'
                  ' et notamment aux étudiants en médecine';
            });
          }
          if (clickCount == 3) {
            setState(() {
              message = ' Mediqcm propose un classement compétitif qui'
                  ' nécessite d\'identifier chaque joueur. Un email '
                  ' est donc obligatoire pour jouer.\n\n'
                  ' Veuillez cliquer sur le boutton ci-dessous pour '
                  'vous Enregistrer ';
              isButtonsVisible = true;
              instructions = '';
            });
          }
        },
        child: Column(
          children: [
            //HERO LOGO DISPLAY
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Theme.of(context).brightness == Brightness.dark
                    ? Image.asset('assets/images/logo-dark.png')
                    : Image.asset('assets/images/logo.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //WELCOME MESSAGE!
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 50,
            ),

            isButtonsVisible
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, 'register');
                    },
                    child: Text(
                      'Créer un compte',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : SizedBox(),

            SizedBox(
              height: 50,
            ),

            //QUICK INSTRUCTIONS
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  instructions,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
