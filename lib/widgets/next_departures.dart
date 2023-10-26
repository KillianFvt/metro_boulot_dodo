import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NextDepartures extends StatefulWidget {
  final int hourRange;
  final int minJourneys;

  const NextDepartures({
    super.key,
    this.hourRange = 2,
    this.minJourneys = 5,
  });

  @override
  State<NextDepartures> createState() => _NextDeparturesState();
}

class _NextDeparturesState extends State<NextDepartures> {

  late Future<http.Response> response;
  DateTime startDatetime = DateTime.now();
  late DateTime endDatetime;

  @override
  void initState() {
    super.initState();

    endDatetime = startDatetime.add(const Duration(hours: 1));

    String startTime = "${startDatetime.hour}${startDatetime.minute}";
    String startDate = "${startDatetime.year}${startDatetime.month}${startDatetime.day}";

    String endTime = "${endDatetime.hour}${endDatetime.minute}";
    String endDate = "${endDatetime.year}${endDatetime.month}${endDatetime.day}";

    response = http.get(
        Uri.parse("https://api.navitia.io/v1/coverage/fr-idf/lines/line%3AIDFM%3AC01730/stop_areas/stop_area%3AIDFM%3A68494/journeys?from=stop_area%3AIDFM%3A68494&to=stop_area%3AIDFM%3A71359&from_datetime=${startDate}T$startTime&until_datetime=${endDate}T$endTime&allowed_id%5B%5D=IDFM%3AC01730&min_nb_journeys=${widget.minJourneys}"),

      headers: {
          HttpHeaders.authorizationHeader : "7a16ff44-bd4b-4af8-a3eb-88ea72125dbc",
      }
    );
  }

  Future<List<Map<String,dynamic>>> getJourneys(Future<http.Response> apiResponse) async {
    List<Map<String,dynamic>> journeys = [];

    http.Response response = await apiResponse;

    return journeys;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
        future: response,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.body);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
    );
  }
}
