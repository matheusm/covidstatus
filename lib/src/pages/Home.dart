import 'package:flutter/material.dart';
import 'dart:async';
import '../models/LatestTotals.dart';

class HomePage extends StatelessWidget {
  final Future<LatestTotals> post;
  
  HomePage(this.post);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
              //colors: [const Color(0xff396afc), const Color(0xff2948ff)]),
              colors: [const Color(0xff3399FE), const Color(0xff23B9E8)]),
              
        ),
        child: Center(
          child: FutureBuilder<LatestTotals>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return (SafeArea(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'COVID-19',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 7,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      info(
                          context,
                          'Casos Confirmados',
                          snapshot.data.confirmed.toString(),
                          'assets/confirmed.png'),
                      info(
                          context,
                          'Casos Recuperados',
                          snapshot.data.recovered.toString(),
                          'assets/safe.png'),
                      info(
                          context,
                          'Casos Críticos',
                          snapshot.data.critical.toString(),
                          'assets/critical.png'),
                      info(context, 'Mortes Confirmadas',
                          snapshot.data.deaths.toString(), 'assets/death.png'),
                    ],
                  ),
                ));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      );
  }
}

Widget info(context, label, value, photo) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.1,
    height: MediaQuery.of(context).size.height / 6.5,
    margin: EdgeInsets.only(top: 15),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white54, width: 2),
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 21),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width / 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 20, top: 15, bottom: 15),
            child: Image.asset(photo)),
      ],
    ),
  );
}
