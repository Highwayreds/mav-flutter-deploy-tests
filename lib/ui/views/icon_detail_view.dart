import 'package:flutter/cupertino.dart';

class IconDetail extends StatelessWidget {
  String iconImage;
  String iconTitle;
  String iconDescription;
  Image descriptionImage;

  IconDetail(this.iconImage, this.iconTitle, this.iconDescription,
      {this.descriptionImage});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Image(
        image: Image.asset(iconImage).image,
      ),
      Text(iconTitle),
      Text(iconDescription)
    ]));
  }
}
