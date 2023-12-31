import 'package:flutter/material.dart';
import '../../../Yutils/ydimension.dart';
import 'small_text.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  /// 5% of screen height

  void setText() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    setText();
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(height: 1.8, text: firstHalf, size: Dimensions.customSize(16))
          : Column(
        children: [
          SmallText(height: 1.8, text: hiddenText ? ("$firstHalf...") : (firstHalf + secondHalf), size: Dimensions.customSize(16)),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Show ${hiddenText ? "more" : "less"}", colour: Colors.blue),
                Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
