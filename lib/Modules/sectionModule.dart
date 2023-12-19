class SectionModel {
  String name;
  String text1;
  String text2;
  String value1;
  String value2;

  SectionModel({
    required this.name,
    required this.text1,
    required this.text2,
    required this.value1,
    required this.value2,
  });
  static List<SectionModel> getSection() {
    List<SectionModel> sections = [];

    sections.add(SectionModel(
        name: "HbA1c",
        text1: "mmol/mol",
        text2: "Percent",
        value1: "46",
        value2: "6.3"));
    sections.add(SectionModel(
        name: "Blood Pressure",
        text1: "Systollic",
        text2: "Diastollic",
        value1: "155",
        value2: "96"));
    return sections;
  }
}
