import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retinarisk/Modules/descriptionModule.dart';
import 'package:retinarisk/Modules/sectionModule.dart';
import 'package:retinarisk/Pages/ProfilePage.dart';

import 'package:retinarisk/Screens/(4)TopicsPage.dart';
import 'package:retinarisk/Screens/eyeScreeningButtonPage.dart';
import 'package:retinarisk/Screens/(2)infoPage.dart';
import 'package:retinarisk/Screens/(3)trendsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DescriptionModule> descriptions = [];
  List<SectionModel> sections = [];
  int _currentPageIndex = 0;

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
        _homePageWindow(),
        const InfoPage(),
        const TrendsPage(),
        const TopicsPage(
          showAppBar: false,
        )
      ][_currentPageIndex],
    );
  }

  Container _homePageWindow() {
    return Container(
      color: Colors.white,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          _topBox(),
          _analysisButton(),
          const SizedBox(
            height: 10,
          ),
          _descriptionModel(),
          const SizedBox(
            height: 10,
          ),
          _sectionMethod(),
          _sizedButton()
        ],
      ),
    );
  }

  SizedBox _sizedButton() {
    return SizedBox(
      width: 400,
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xff92A3FD),
          ),
        ),
        child: const Text('SAVE'),
      ),
    );
  }

  Container _sectionMethod() {
    return Container(
      height: 220,
      width: 400,
      color: Colors.grey.withOpacity(0.15),
      child: ListView.separated(
          itemBuilder: ((context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  sections[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff92A3FD),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text(
                        sections[index].text1,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Text(
                        sections[index].text2,
                        style: const TextStyle(fontSize: 13),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        sections[index].value1,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 220),
                      child: Text(
                        sections[index].value2,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              ]),
            );
          }),
          separatorBuilder: ((context, index) => const SizedBox(
                height: 10,
              )),
          itemCount: sections.length),
    );
  }

  Container _descriptionModel() {
    return Container(
      height: 140,
      width: 400,
      color: Colors.grey.withOpacity(0.15),
      child: GestureDetector(
        onTap: () {},
        child: ListView.separated(
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: 100,
                  height: 100,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 40,
                        // decoration: const BoxDecoration(
                        //     color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(descriptions[index].iconpath),
                        ),
                      ),
                      Text(
                        descriptions[index].type1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        descriptions[index].type2,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            separatorBuilder: ((context, index) => const SizedBox(
                  width: 15,
                )),
            scrollDirection: Axis.horizontal,
            itemCount: descriptions.length),
      ),
    );
  }

  Container _analysisButton() {
    return Container(
      width: 400,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xff92A3FD),
          ),
        ),
        child: const Text('ANALYSIS'),
      ),
    );
  }

  Container _topBox() {
    return Container(
      width: 500,
      height: 220,
      // color: Colors.amber,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "SIGHT THREATHING RETIONPATHY RISK",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 48, 45, 45),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Image.asset(
              "assets/images/1234.png",
              width: 400,
            ),
          ),
        ],
      ),
    );
  }

  Container _floatingActionButton() {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 20),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return EyeScreeningPage();
              },
            ),
          );
        },
        backgroundColor: const Color(0xffC588F2),
        child: SvgPicture.asset(
          'assets/images/eye2.svg', // Replace with the path to your SVG file
          width: 30.0, // Adjust the width as needed
          height: 30.0, // Adjust the height as needed
        ),
      ),
    );
  }

  Container _bottomNavigationBar() {
    return Container(
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
        backgroundColor: const Color(0xff92A3FD),
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

  AppBar _appBar() {
    return AppBar(
      title: const Text("RetinaRisk"),
      backgroundColor: const Color(0xff92A3FD),
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
