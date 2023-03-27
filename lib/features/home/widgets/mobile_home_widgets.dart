import 'package:flutter/material.dart';

import '../../../core/presentation/widgets/vspace.dart';
import 'desktop_home_widgets.dart';


class DrawerData extends StatelessWidget {
  const DrawerData();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "BrandName",
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            Vspace(40),
            CommonDrawerButton(
              text: "About",
            ),
            Vspace(18),
            CommonDrawerButton(
              text: "Project",
            ),
            Vspace(18),
            CommonDrawerButton(
              text: "Construction",
            ),
            Vspace(18),
            CommonDrawerButton(
              text: "Reviews",
            ),
          ],
        ),
      ),
    );
  }
}

class CommonDrawerButton extends StatelessWidget {
  const CommonDrawerButton({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white, width: 0.3)),
      child: TextWidget(
        text: text,
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }
}

class DrawerItem {
  final String name;
  final IconData icon;

  const DrawerItem(this.name, this.icon);
}


