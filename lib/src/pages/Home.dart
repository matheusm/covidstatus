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
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            //colors: [const Color(0xff396afc), const Color(0xff2948ff)]),
            //olors: [const Color(0xff3399FE), const Color(0xff23B9E8)]),
            colors: [const Color(0xff002940), const Color(0xff005677)]),
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
                      padding: const EdgeInsets.only(top:20.0),
                      child: Image.asset('assets/governo2.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'COVID-19 Status',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xffC2CB4A),
                        ),
                      ),
                    ),
                    info(
                        context,
                        'Casos Confirmados',
                        snapshot.data.confirmed.toString(),
                        'assets/confirmed.png'),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                    ),
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
                    Container(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    info(
                        context,
                        'Mortes Confirmadas',
                        snapshot.data.deaths.toString(),
                        'assets/death.png'),
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
    width: MediaQuery.of(context).size.width / 1.2,
    height: MediaQuery.of(context).size.height / 8,
    margin: EdgeInsets.only(top: 15),
    decoration: BoxDecoration(
      //border: Border.all(color: Colors.white54, width: 2),
      border: Border.all(color: Color(0xff00DEFC), width: 2),
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
    ),
    child: Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
                //color: Colors.white,
                color: Color(0xff00DEFC),
                fontSize: MediaQuery.of(context).size.width / 21,
                fontWeight: FontWeight.w700),
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
    // image
    // Padding(
    //     padding: const EdgeInsets.only(right: 20, top: 15, bottom: 15),
    //     child: Image.asset(photo)),
  );
}
