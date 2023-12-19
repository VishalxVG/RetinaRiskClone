import 'package:flutter/material.dart';
import 'package:retinarisk/Modules/topicsModel.dart';

class InformationPage extends StatelessWidget {
  final TopicsModel3 item;
  const InformationPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        // color: Colors.amber,
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Display the same text as in the list item.
            Text(item.text),
          ],
        ),
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
