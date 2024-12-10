import 'package:flutter/material.dart';
import 'package:track_it/core/cosntants.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key, required this.onGenderSelected});

  final ValueChanged<String> onGenderSelected;

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  List<GenderData> genderList = [];

  @override
  void initState() {
    super.initState();
    genderList.addAll([
      GenderData(name: 'Male', isSelected: false),
      GenderData(name: 'Female', isSelected: false),
      GenderData(name: 'Others', isSelected: false),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: const TextSpan(
            style: TextStyle(
              color: CustomColors.whiteColor,
              fontSize: 18,
              fontFamily: FontFamily.zk,
              fontWeight: FontWeight.w800,
            ),
            children: [
              TextSpan(
                text: "Gen",
              ),
              TextSpan(
                text: 'der:',
                style: TextStyle(
                  color: CustomColors.yellowColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 110.0,
                childAspectRatio: 2,
                mainAxisSpacing: 12),
            itemCount: genderList.length,
            itemBuilder: (context, index) {
              return _genderItem(index: index);
            },
          ),
        ),
      ],
    );
  }

  _genderItem({required int index}) {
    return GestureDetector(
      onTap: () {
        for (int i = 0; i < genderList.length; i++) {
          setState(() {
            if (index == i) {
              genderList[i].isSelected = true;
              widget.onGenderSelected(genderList[i].name);
            } else {
              genderList[i].isSelected = false;
            }
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        margin: const EdgeInsets.only(
          right: 12,
        ),
        decoration: BoxDecoration(
          color: !genderList[index].isSelected
              ? CustomColors.whiteColor
              : CustomColors.yellowColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
        ),
        child: Center(
          child: Text(
            genderList[index].name,
            style: const TextStyle(
              color: CustomColors.blueColor,
              fontSize: 14,
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class GenderData {
  String name;
  bool isSelected;

  GenderData({required this.name, required this.isSelected});
}
