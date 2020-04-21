import 'dart:convert';
import 'package:http/http.dart' as http;

class LatestTotals {
  final String confirmed;
  final String recovered;
  final String critical;
  final String deaths;

  LatestTotals({this.confirmed, this.critical, this.deaths, this.recovered});

  factory LatestTotals.fromJson(Map<String, dynamic> parsedJson) {
    return LatestTotals(
        confirmed: parsedJson['confirmed'],
        critical: parsedJson['critical'],
        deaths: parsedJson['deaths'],
        recovered: parsedJson['recovered']);
  }
}

Future<LatestTotals> fetchAlbum() async {
  final response = await http.get(
      'https://covid-19-data.p.rapidapi.com/totals?format=json',
      //headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
      headers: {
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "YOUR_KEY_HERE"
      });
  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    final jsonFinal = responseJson[0];
    return LatestTotals.fromJson(jsonFinal);
  } else {
    throw Exception('Failed to load post');
  }
}