import 'package:flutter/material.dart';
import 'package:retinarisk/Modules/topicsModel.dart';

class TopicsPage extends StatefulWidget {
  final bool showAppBar;

  const TopicsPage({super.key, required this.showAppBar});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  int selectedTopic = 0; // Initialize with an integer value

  List<TopicsModel> topics = [];
  List<TopicsModel0> topics0 = [];

  void _getInitialInfo() {
    topics = TopicsModel.getTopics();
    topics0 = TopicsModel0.getTopics0();
    selectedTopic = 0; // Initialize with your default integer value
  }

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? _appBar() : null,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Topics For You",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _topBoxMethod(),
              const SizedBox(
                height: 15,
              ),
              _bottomBoxMethod()
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("RetinaRisk"),
      backgroundColor: const Color(0xff92A3FD),
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

  SizedBox _topBoxMethod() {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemBuilder: ((context, index) {
          final topic = topics0[index];

          // Check if the current topic is selected
          final isSelected = selectedTopic == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                // Toggle the selected topic
                selectedTopic = isSelected ? -1 : index;
              });
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isSelected ? Colors.grey : Colors.white),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        topic.image1,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 10,
                      child: Text(
                        topic.text1,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          backgroundColor: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        separatorBuilder: ((context, index) => const SizedBox(height: 15)),
        itemCount: topics0.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  SizedBox _bottomBoxMethod() {
    return SizedBox(
      height: 3000, // Set a maximum height
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          final topic = topics[index];

          // Check if the current topic matches the selected topic
          final isTopicSelected =
              selectedTopic == -2 || selectedTopic == topic.topic;

          return Visibility(
            visible: isTopicSelected,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 220,
                          child: Stack(
                            children: [
                              Image.asset(
                                topic.image,
                                height: 220,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 10,
                                left: 5,
                                child: Text(
                                  topic.date,
                                  style: const TextStyle(
                                    backgroundColor: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(height: 10),
                        Text(
                          topic.header,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          topic.data,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: topics.length,
      ),
    );
  }
}
