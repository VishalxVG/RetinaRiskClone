class TopicsModel {
  String date;
  String image;
  String header;
  String data;
  int topic;

  TopicsModel({
    required this.date,
    required this.image,
    required this.data,
    required this.header,
    required this.topic,
  });
  static List<TopicsModel> getTopics() {
    List<TopicsModel> topics = [];

    topics.add(TopicsModel(
      date: " 9/29/23 ",
      image: "assets/images/image1.jpg",
      data: "data1",
      header: "header1",
      topic: 1,
    ));
    topics.add(TopicsModel(
      date: " 9/29/23 ",
      image: "assets/images/eyeImage.jpg",
      data: "data2",
      header: "header2",
      topic: 2,
    ));
    topics.add(TopicsModel(
      date: " 9/29/23 ",
      image: "assets/images/image1.jpg",
      data: "data3",
      header: "header3",
      topic: 1,
    ));
    topics.add(TopicsModel(
      date: " 9/29/23 ",
      image: "assets/images/image1.jpg",
      data: "data4",
      header: "header4",
      topic: 2,
    ));
    topics.add(TopicsModel(
      date: " 9/29/23 ",
      image: "assets/images/image1.jpg",
      data: "data5",
      header: "header5",
      topic: 2,
    ));
    topics.add(TopicsModel(
      date: " 9/29/23 ",
      image: "assets/images/image1.jpg",
      data: "data6",
      header: "header6",
      topic: 1,
    ));
    return topics;
  }
}

class TopicsModel0 {
  String image1;
  String text1;
  int topic1;

  TopicsModel0(
      {required this.image1, required this.text1, required this.topic1});

  static List<TopicsModel0> getTopics0() {
    List<TopicsModel0> topics0 = [];

    topics0.add(TopicsModel0(
      image1: "assets/images/image1.jpg",
      text1: "text1",
      topic1: 1,
    ));
    topics0.add(TopicsModel0(
      image1: "assets/images/image1.jpg",
      text1: "text1",
      topic1: 2,
    ));
    topics0.add(TopicsModel0(
      image1: "assets/images/image1.jpg",
      text1: "text1",
      topic1: 3,
    ));
    return topics0;
  }
}

class TopicsModel3 {
  String image;
  String header;
  String text;

  TopicsModel3({required this.image, required this.header, required this.text});

  static List<TopicsModel3> getTopics3() {
    List<TopicsModel3> topics3 = [];

    topics3.add(
      TopicsModel3(
        image: "assets/images/image1.jpg",
        text: "text1",
        header: 'header1',
      ),
    );

    topics3.add(
      TopicsModel3(
        image: "assets/images/image1.jpg",
        text: "text2",
        header: 'header2',
      ),
    );

    topics3.add(
      TopicsModel3(
        image: "assets/images/image1.jpg",
        text: "text3",
        header: 'header3',
      ),
    );

    topics3.add(
      TopicsModel3(
        image: "assets/images/image1.jpg",
        text: "text4",
        header: 'header 4',
      ),
    );

    topics3.add(
      TopicsModel3(
        image: "assets/images/image1.jpg",
        text: "text5",
        header: 'header5',
      ),
    );
    return topics3;
  }
}
