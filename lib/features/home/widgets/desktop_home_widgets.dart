import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../core/presentation/widgets/hspace.dart';

class FullHeightContainer extends StatelessWidget {
  const FullHeightContainer({
    super.key,
    required this.child,
    required this.constraints,
  });
  final Widget child;
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints.copyWith(
          minHeight: constraints.maxHeight, maxHeight: double.infinity),
      child: child,
    );
  }
}

class DesktopNavBarButton extends StatelessWidget {
  const DesktopNavBarButton({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80, right: 80, top: 50),
      child: Row(
        children: [
          Expanded(child: Hspace(0)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(24), primary: Color(0xff4844FF)),
              onPressed: () {},
              child: TextWidget(
                text: "Contact Us",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth / 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 80, right: 80, top: 50),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                text: "Brand Name",
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
              TextWidget(
                text: "About",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff818181),
              ),
              TextWidget(
                text: "Project",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff818181),
              ),
              TextWidget(
                  text: "Construction",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff818181)),
              TextWidget(
                  text: "Review",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff818181)),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
    this.height,
    this.minFontSize=12
  });
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? height;
  final double minFontSize;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: minFontSize,
      
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontWeight: fontWeight,
            height: height,
            fontSize: fontSize,
          ),
    );
  }
}

class DesktopButton extends StatelessWidget {
  const DesktopButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24), primary: Color(0xff4844FF)),
        onPressed: () {},
        child: TextWidget(
          text: "Send Inquery",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ));
  }
}
