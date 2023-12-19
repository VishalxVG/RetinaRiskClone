import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retinarisk/Modules/descriptionModule.dart';
import 'package:retinarisk/Modules/sectionModule.dart';
import 'package:retinarisk/Pages/ProfilePage.dart';

import 'package:retinarisk/Screens/(4)TopicsPage.dart';
import 'package:retinarisk/Screens/eyeScreeningButtonPage.dart';
import 'package:retinarisk/Screens/(2)infoPage.dart';
import 'package:retinarisk/Screens/(3)trendsPage.dart';
import 'package:retinarisk/common/utils/colors.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DescriptionModule> descriptions = [];
  List<SectionModel> sections = [];
  int _currentPageIndex = 0;
  double newValue = 0;

  void _getInitialInfo() {
    descriptions = DescriptionModule.getDescription();
    sections = SectionModel.getSection();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _floatingActionButton(),
      body: <Widget>[
        _HomePage(),
        const InfoPage(),
        const TrendsPage(),
        const TopicsPage(
          showAppBar: false,
        )
      ][_currentPageIndex],
    );
  }

  SizedBox _bottomNavigationBar() {
    return SizedBox(
      height: 58,
      child: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Icon(
                Icons.home,
                size: 36,
                color: Colors.white,
              ),
            ),
            selectedIcon: Padding(
              padding: EdgeInsets.only(top: 13),
              child: Icon(
                Icons.home,
                size: 30,
                color: Colors.amber,
              ),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Icon(
                Icons.local_library_sharp,
                size: 36,
                color: Colors.white,
              ),
            ),
            selectedIcon: Padding(
              padding: EdgeInsets.only(top: 13),
              child: Icon(
                Icons.local_library_sharp,
                size: 30,
                color: Colors.amber,
              ),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Icon(
                Icons.account_tree_rounded,
                size: 36,
                color: Colors.white,
              ),
            ),
            selectedIcon: Padding(
              padding: EdgeInsets.only(top: 13),
              child: Icon(
                Icons.account_tree_rounded,
                size: 30,
                color: Colors.amber,
              ),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Icon(
                Icons.amp_stories_rounded,
                size: 36,
                color: Colors.white,
              ),
            ),
            selectedIcon: Padding(
              padding: EdgeInsets.only(top: 13),
              child: Icon(
                Icons.amp_stories_rounded,
                size: 30,
                color: Colors.amber,
              ),
            ),
            label: '',
          ),
        ],
        backgroundColor: barColor,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container _HomePage() {
    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            _topBox(),
            const SizedBox(
              height: 5,
            ),
            _analysisButton(),
            const SizedBox(
              height: 5,
            ),
            _descriptionModel(),
            const SizedBox(
              height: 5,
            ),
            _hbA1cTable(),
            _savButton(),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  SizedBox _analysisButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            newValue = newValue + 30;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: barColor,
        ),
        child: const Text('ANALYSIS'),
      ),
    );
  }

  SizedBox _savButton() {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            newValue = 0;
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            barColor,
          ),
        ),
        child: const Text(
          'SAVE',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  Container _hbA1cTable() {
    return Container(
      height: 220,
      color: Colors.grey.withOpacity(0.15),
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.amber,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            color: Colors.amber,
          ),
        ],
      ),
      // child: ListView.separated(
      //     itemBuilder: ((context, index) {
      //       return Container(
      //         height: 100,
      //         decoration: BoxDecoration(
      //             color: Colors.white, borderRadius: BorderRadius.circular(16)),
      //         child: Column(children: [
      //           const SizedBox(
      //             height: 8,
      //           ),
      //           Text(
      //             sections[index].name,
      //             style: const TextStyle(
      //               fontWeight: FontWeight.w600,
      //               color: Color(0xff92A3FD),
      //             ),
      //           ),
      //           Row(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 50),
      //                 child: Text(
      //                   sections[index].text1,
      //                   style: const TextStyle(fontSize: 13),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 200),
      //                 child: Text(
      //                   sections[index].text2,
      //                   style: const TextStyle(fontSize: 13),
      //                 ),
      //               )
      //             ],
      //           ),
      //           Row(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 60),
      //                 child: Text(
      //                   sections[index].value1,
      //                   style: const TextStyle(
      //                       fontSize: 20, fontWeight: FontWeight.w500),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 220),
      //                 child: Text(
      //                   sections[index].value2,
      //                   style: const TextStyle(
      //                       fontSize: 20, fontWeight: FontWeight.w500),
      //                 ),
      //               )
      //             ],
      //           )
      //         ]),
      //       );
      //     }),
      //     separatorBuilder: ((context, index) => const SizedBox(
      //           height: 10,
      //         )),
      //     itemCount: sections.length),
    );
  }

  Container _descriptionModel() {
    //! Gender Type Duration BOX
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      height: 130,
      // color: Colors.grey.withOpacity(0.15),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              width: 95,
              // color: Colors.grey.withOpacity(0.15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.15),
              ),
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/images/gender.svg",
                    height: 30,
                    width: 30,
                  ),
                  const Text(
                    "GENDER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    "Male",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              width: 95,
              // color: Colors.amber,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/images/roman1.svg",
                    height: 30,
                    width: 30,
                  ),
                  const Text(
                    "TYPE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    "Type 2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              width: 95,
              // color: Colors.amber,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/images/calender.svg",
                    height: 30,
                    width: 30,
                  ),
                  const Text(
                    "DURATION",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    "0 years",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              width: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/images/review.svg",
                    height: 30,
                    width: 30,
                  ),
                  const Text(
                    "DIAGNOSIS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _topBox() {
    return Container(
        padding: const EdgeInsets.all(8),
        height: 220,
        // color: Colors.black,
        //TODO : CUSTOMIZE THE GAUGE CHART

        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
              GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
              GaugeRange(startValue: 50, endValue: 100, color: Colors.orange),
              GaugeRange(startValue: 100, endValue: 150, color: Colors.red)
            ], pointers: <GaugePointer>[
              NeedlePointer(value: newValue)
            ], annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Container(
                      child: const Text('90.0',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                  angle: 90,
                  positionFactor: 0.5)
            ])
          ],
        ));
  }

  Container _floatingActionButton() {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 20),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const EyeScreeningPage();
              },
            ),
          );
        },
        backgroundColor: fButtonColor,
        child: SvgPicture.asset(
          'assets/images/eye2.svg', // Replace with the path to your SVG file
          width: 30.0, // Adjust the width as needed
          height: 30.0, // Adjust the height as needed
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("RetinaRisk"),
      // backgroundColor: const Color(0xff92A3FD),
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: Icon(Icons.arrow_right),
      // ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.card_giftcard_sharp),
          onPressed: () {
            // Implement your search functionality here
          },
        ),
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return const NewProfilePage();
            }));
          },
        ),
      ],
    );
  }
}
