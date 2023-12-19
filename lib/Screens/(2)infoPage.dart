import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retinarisk/Modules/infoPageModule.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<InfoPageModel> infos = [];

  void _getInitialInfo() {
    infos = InfoPageModel.getInfo();
  }

  void _showGridItemBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 2, right: 2),
          child: Container(
            height: 700,
            // color: Colors.amber,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                _headingPopUpWindow(index),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int itemIndex) {
                      return ExpansionTile(
                        title:
                            Text(infos[index].expandableItems[itemIndex].title),
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(infos[index]
                              .expandableItems[itemIndex]
                              .description),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    },
                    itemCount: infos[index].expandableItems.length,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Row _headingPopUpWindow(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const _elevatedButton(),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              infos[index].text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      body: Container(
        // color: Colors.grey.withOpacity(0.15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                _showGridItemBottomSheet(context, index);
              },
              child: GridTile(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: SvgPicture.asset(
                            infos[index].iconButton,
                          ),
                        ),
                        Text(
                          infos[index].text,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 7, 68, 172),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          itemCount: infos.length,
        ),
      ),
    );
  }
}

class _elevatedButton extends StatelessWidget {
  const _elevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style:
          ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 0),
      child: const Icon(
        Icons.chevron_left,
        color: Colors.black,
      ),
    );
  }
}
