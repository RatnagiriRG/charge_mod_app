import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_round_chargemod/screens/homepage.dart/communitypage/communityPage.dart';

class MapPageSlidingView extends StatefulWidget {
  const MapPageSlidingView({super.key});

  @override
  State<MapPageSlidingView> createState() => _MapPageSlidingViewState();
}

class _MapPageSlidingViewState extends State<MapPageSlidingView> {
  Future<String> loadJsonData() async {
    return await rootBundle
        .loadString('lib/data/mapPage/dummy_Locationdata.json');
  }

  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int pageno = 0;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      shadowColor: Theme.of(context).colorScheme.onTertiary,
                    ),
                    child: Icon(
                      Icons.list,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CommuniyPage(),
                      ));
                    }),
              )),
        ],
      ),
      SizedBox(
        height: 120,
        child: FutureBuilder(
          future: loadJsonData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final String? jsonData = snapshot.data;
              final Map<String, dynamic> data = json.decode(jsonData!);
              final List<dynamic> locations = data['data']['result'];

              return PageView.builder(
                controller: PageController(),
                onPageChanged: (value) {
                  GetStorage().write('mappage', value);
                  print(GetStorage().read('mappage'));
                },
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

                  return AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        return child!;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, right: 12, left: 14),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.background),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                'assets/images/common_images/updatepage/256x256bb.jpg',
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    '$street1, $street2 \n $city, $state',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "status : ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                      ),
                                      Text(
                                        '$Active',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                location['status'] == "Active"
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
                      )

                      //  Container(
                      //   margin: EdgeInsets.all(20),
                      //   height: 100,
                      //   decoration: BoxDecoration(
                      //       color: Theme.of(context).colorScheme.background,
                      //       borderRadius: BorderRadius.circular(13)),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         "$name".toUpperCase(),
                      //         style: GoogleFonts.poppins(
                      //             fontWeight: FontWeight.w900),
                      //       ),
                      //       SingleChildScrollView(
                      //         scrollDirection: Axis.horizontal,
                      //         child: Text("$street1,$street2,$city,$state",
                      //             style: GoogleFonts.poppins(
                      //                 fontWeight: FontWeight.w300, fontSize: 12)),
                      //       )
                      //     ],
                      //   ),
                      // ),
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
      )
    ]);
  }
}
