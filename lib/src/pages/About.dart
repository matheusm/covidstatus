import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            //colors: [const Color(0xff396afc), const Color(0xff2948ff)]),
            colors: [const Color(0xff3399FE), const Color(0xff23B9E8)]),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 10,
                  color: Colors.white,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(
                      10,
                      15,
                    ),
                    blurRadius: 20,
                    spreadRadius: 1,
                  )
                ],
              ),
              margin: EdgeInsets.only(top: 80),
              width: 250,
              child: ClipRRect(
                child: Image.asset(
                  'assets/me.jpg',
                ),
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Text(
                'Matheus Martins Sarmento',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              'Estudante de Ciência da Computação - UNIT/AL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              padding: EdgeInsets.only(right: 50, left: 50),
              child: Text(
              'Projeto para ajudar a informar o status do COVID-19 mundialmente e localmente em cada pais.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            )
          ],
        ),
      ),
    );
  }
}
