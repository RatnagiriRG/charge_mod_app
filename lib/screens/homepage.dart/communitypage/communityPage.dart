import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:technical_round_chargemod/data/mapPage/getLocationDetails.dart';
import 'package:technical_round_chargemod/data/mapPage/readDataLocation.dart';

class CommuniyPage extends StatefulWidget {
  const CommuniyPage({super.key});

  @override
  State<CommuniyPage> createState() => _CommuniyPageState();
}

class _CommuniyPageState extends State<CommuniyPage> {
  Future<String> loadJsonData() async {
    return await rootBundle
        .loadString('lib/data/mapPage/dummy_Locationdata.json');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height,
      child: Scaffold(
        body: FutureBuilder(
          future: loadJsonData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final String? jsonData = snapshot.data;
              final Map<String, dynamic> data = json.decode(jsonData!);
              final List<dynamic> locations = data['data']['result'];

              return ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  final location = locations[index];
                  final String name = location['name'];
                  final String street2 = location['street2'];
                  final String street1 = location['street1'];
                  final String id = location['_id'];
                  final String city = location['city'];
                  final String state = location['state'];
                  final String Active = location['status'];
                  final String image = location['image'];

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 25, bottom: 15, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.onTertiary),
                        child: Row(
                          children: [
                            ClipRect(
                              child: Image.asset(
                                'assets/images/common_images/updatepage/256x256bb.jpg',
                                height: 100,
                                width: 100,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                ),
                                Text(
                                  '$street1, $street2 ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "status : ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background),
                                    ),
                                    Text(
                                      '$Active',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: location['status'] == "Active"
                                              ? Colors.green
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .background),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Image.network(
                              "$image",
                              height: 100,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            // ListTile(
                            //   title: Text(name),
                            //   subtitle: Text(': $street1, $street2, $city, $state'),
                            //   onTap: () {
                            //     // Handle tap on the list item if needed
                            //     print('haoo $name with ID $id');
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
