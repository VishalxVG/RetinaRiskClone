import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retinarisk/Modules/descriptionModule.dart';
import 'package:retinarisk/Modules/sectionModule.dart';
import 'package:retinarisk/Pages/InsertDataPage.dart';
import 'package:retinarisk/Pages/ProfilePage.dart';

import 'package:retinarisk/Screens/(4)TopicsPage.dart';
import 'package:retinarisk/Screens/eyeScreeningButtonPage.dart';
import 'package:retinarisk/Screens/(2)infoPage.dart';
import 'package:retinarisk/Screens/(3)trendsPage.dart';
import 'package:retinarisk/common/utils/colors.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  final String selectedGender;
  final String selectedType;
  final String selectedDuration;
  final bool selectedChecked;
  const HomePage(
      {super.key,
      required this.selectedGender,
      required this.selectedType,
      required this.selectedDuration,
      required this.selectedChecked});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DescriptionModule> descriptions = [];
  List<SectionModel> sections = [];
  List<int> mmolValues = List.generate(91, (index) => index + 30);
  List<int> systolicValues = List.generate(131, (index) => index + 90);
  List<int> diastolicValues = List.generate(81, (index) => index + 60);
  List<double> percentValues = List.generate(
    (13.0 * 10 - 4.9 * 10) ~/ 1 + 1,
    (index) => (4.9 * 10 + index).toDouble() / 10,
  );

  int _currentPageIndex = 0;
  double newValue = 0;
  int _mmolValue = 30;
  int _systollicValue = 90;
  int _diastollicValue = 60;
  double _percentValue = 4.9;

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
            _bottomBox(),
            _savButton(),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  SizedBox _bottomBox() {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            height: 100,
            // color: Colors.amber,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.15),
            ),
            child: Column(
              children: [
                const Text(
                  "HbA1c",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "mmol/mol",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        DropdownButton(
                          value: _mmolValue,
                          items: mmolValues
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                "$value",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                              _mmolValue = newValue!;
                            });
                          },
                          underline: Container(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Percent",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        DropdownButton<double>(
                          value: _percentValue,
                          items: percentValues
                              .map<DropdownMenuItem<double>>((double value) {
                            return DropdownMenuItem<double>(
                              value: value,
                              child: Text(
                                "$value",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                          onChanged: (double? newValue) {
                            setState(() {
                              _percentValue = newValue ?? 0.0;
                            });
                          },
                          underline: Container(),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            height: 100,
            // color: Colors.amber,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.15),
            ),
            child: Column(
              children: [
                const Text(
                  "Blood Pressure",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Systolic",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        DropdownButton(
                          value: _systollicValue,
                          items: systolicValues
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                "$value",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                              _systollicValue = newValue!;
                            });
                          },
                          underline: Container(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Diastolic",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        DropdownButton(
                          value: _diastollicValue,
                          items: diastolicValues
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                "$value",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                              _diastollicValue = newValue!;
                            });
                          },
                          underline: Container(),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _analysisButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            newValue = newValue + .5;
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

  Container _descriptionModel() {
    //! Gender Type Duration BOX
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      height: 130,
      // color: Colors.grey.withOpacity(0.15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const InsertDataPage()));
        },
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
                  Text(
                    widget.selectedGender,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
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
                  Text(
                    "Type ${widget.selectedType}",
                    style: const TextStyle(
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
                  Text(
                    "${widget.selectedDuration} years",
                    style: const TextStyle(
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
                  Text(
                    widget.selectedChecked ? "Yes" : "No",
                    style: const TextStyle(
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
        // color: Colors.red,
        //TODO : CUSTOMIZE THE GAUGE CHART

        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 4.5,
            showTicks: false,
            interval: 1.5,
            startAngle: 180,
            radiusFactor: 1.5,
            endAngle: 0,
            labelsPosition: ElementsPosition.outside,
            canScaleToFit: true,
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                axisValue: 100,
                positionFactor: 0.25,
                widget: Text(
                  "$newValue",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              )
            ],
            showLastLabel: true,
            axisLineStyle: const AxisLineStyle(thickness: 80),
            pointers: [
              RangePointer(
                value: newValue,
                enableAnimation: true,
                animationType: AnimationType.bounceOut,
                width: 80,
                // gradient: const SweepGradient(
                //     colors: <Color>[Colors.green, Colors.yellow, Colors.red],
                //     stops: <double>[0.2, 0.4, 0.8]),
                color: (newValue < 1.5)
                    ? Colors.greenAccent
                    : (newValue >= 1.5 && newValue <= 3)
                        ? Colors.yellowAccent
                        : Colors.redAccent,
              )
            ],
          )
        ]));
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
