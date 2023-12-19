class InfoPageModel {
  String text;
  String iconButton;
  List<ExpandableItem> expandableItems;

  InfoPageModel({
    required this.iconButton,
    required this.text,
    required this.expandableItems,
  });
  static List<InfoPageModel> getInfo() {
    List<InfoPageModel> infos = [];

    infos.add(
      InfoPageModel(
        iconButton: "assets/images/review.svg",
        text: "General",
        expandableItems: [
          ExpandableItem(
            title: "General Item 1",
            description: "Description for General Item 1",
          ),
          ExpandableItem(
            title: "General Item 2",
            description: "Description for General Item 2",
          ),
          // Add more expandable items for the "General" section
        ],
      ),
    );
    infos.add(
      InfoPageModel(
        iconButton: "assets/images/types.svg",
        text: "Diabetes:Types",
        expandableItems: [
          ExpandableItem(
            title: "General Item 1",
            description: "Description for General Item 1",
          ),
          ExpandableItem(
            title: "General Item 2",
            description: "Description for General Item 2",
          ),
          // Add more expandable items for the "General" section
        ],
      ),
    );
    infos.add(
      InfoPageModel(
        iconButton: "assets/images/settings.svg",
        text: "Diabetes: Complications",
        expandableItems: [
          ExpandableItem(
            title: "General Item 1",
            description: "Description for General Item 1",
          ),
          ExpandableItem(
            title: "General Item 2",
            description: "Description for General Item 2",
          ),
          // Add more expandable items for the "General" section
        ],
      ),
    );
    infos.add(
      InfoPageModel(
        iconButton: "assets/images/management.svg",
        text: "Diabetes: Management",
        expandableItems: [
          ExpandableItem(
            title: "General Item 1",
            description: "Description for General Item 1",
          ),
          ExpandableItem(
            title: "General Item 2",
            description: "Description for General Item 2",
          ),
          // Add more expandable items for the "General" section
        ],
      ),
    );
    infos.add(
      InfoPageModel(
        iconButton: "assets/images/pen.svg",
        text: "Diabetic: Retinopathy",
        expandableItems: [
          ExpandableItem(
            title: "General Item 1",
            description: "Description for General Item 1",
          ),
          ExpandableItem(
            title: "General Item 2",
            description: "Description for General Item 2",
          ),
          // Add more expandable items for the "General" section
        ],
      ),
    );
    infos.add(
      InfoPageModel(
        iconButton: "assets/images/guidelines.svg",
        text: "Guidelines",
        expandableItems: [
          ExpandableItem(
            title: "General Item 1",
            description: "Description for General Item 1",
          ),
          ExpandableItem(
            title: "General Item 2",
            description: "Description for General Item 2",
          ),
          // Add more expandable items for the "General" section
        ],
      ),
    );
    infos.add(
      InfoPageModel(
        iconButton: "assets/images/bulb.svg",
        text: "Practical Tips",
        expandableItems: [
          ExpandableItem(
            title: "General Item 1",
            description: "Description for General Item 1",
          ),
          ExpandableItem(
            title: "General Item 2",
            description: "Description for General Item 2",
          ),
          // Add more expandable items for the "General" section
        ],
      ),
    );
    infos.add(
      InfoPageModel(
        iconButton: "assets/images/doctoe.svg",
        text: "References",
        expandableItems: [
          ExpandableItem(
            title: "General Item 1",
            description: "Description for General Item 1",
          ),
          ExpandableItem(
            title: "General Item 2",
            description: "Description for General Item 2",
          ),
          // Add more expandable items for the "General" section
        ],
      ),
    );
    infos.add(
      InfoPageModel(
        iconButton: "assets/images/review.svg",
        text: "Review",
        expandableItems: [
          ExpandableItem(
            title: "General Item 1",
            description: "Description for General Item 1",
          ),
          ExpandableItem(
            title: "General Item 2",
            description: "Description for General Item 2",
          ),
          // Add more expandable items for the "General" section
        ],
      ),
    );
    return infos;
  }
}

class ExpandableItem {
  String title;
  String description;

  ExpandableItem({
    required this.title,
    required this.description,
  });
}
