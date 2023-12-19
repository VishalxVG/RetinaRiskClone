// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retinarisk/Modules/topicsModel.dart';
import 'package:retinarisk/Pages/eyeTonextPage.dart';
import 'package:retinarisk/Screens/(4)TopicsPage.dart';

class EyeScreeningPage extends StatefulWidget {
  const EyeScreeningPage({super.key});

  @override
  State<EyeScreeningPage> createState() => _EyeScreeningPageState();
}

class _EyeScreeningPageState extends State<EyeScreeningPage> {
  List<TopicsModel3> topics3 = [];

  void getInitialInfo() {
    topics3 = TopicsModel3.getTopics3();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                "Eye Screening",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Your next eye screening",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("You can log your next eye screening in the RetinaRisk"),
            const Text("and we will remind you when it's time"),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xff92A3FD),
                  ),
                ),
                child: const Text(
                  "LOG NEXT SCREENING",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _topBoxMethod(),
            _bottomButtonMethod(context)
          ],
        ),
      ),
    );
  }

  Column _bottomButtonMethod(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            const Text(
              "Read out blogs on eye health",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const TopicsPage(
                        showAppBar: true,
                      );
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: SvgPicture.asset("assets/images/rightArrow.svg"),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          InformationPage(item: topics3[index]),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          topics3[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          topics3[index].header,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
            separatorBuilder: ((context, index) => const SizedBox(
                  width: 10,
                )),
            itemCount: topics3.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }

  SizedBox _topBoxMethod() {
    return SizedBox(
      height: 250,
      width: double.infinity,
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 15,
          ),
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.red, // Set the desired color
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              "assets/images/eye2.svg",
              width: 120,
              height: 120,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "No screening data",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "An overview of your screenings will",
            style: TextStyle(fontSize: 17),
          ),
          const Text(
            "appear here",
            style: TextStyle(fontSize: 17),
          ),
        ],
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
            // Implement your settings functionality here
          },
        ),
      ],
    );
  }
}
