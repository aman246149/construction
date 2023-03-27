import 'package:architecture/core/images/app_images.dart';
import 'package:architecture/core/presentation/widgets/hspace.dart';
import 'package:architecture/core/presentation/widgets/vspace.dart';
import 'package:flutter/material.dart';

import '../widgets/desktop_home_widgets.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return ColoredBox(
          color: const Color(0xffDFDFDF),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                FullHeightContainer(
                  constraints: constraints,
                  child: Stack(
                    children: [
                      ColoredBox(
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            AppImages.homeImage,
                            width: constraints.maxWidth / 2,
                            height: constraints.maxHeight,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          DesktopNavBar(constraints: constraints),
                        ],
                      ),
                      DesktopNavBarButton(
                        constraints: constraints,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 80, right: 80, top: 170),
                        height: constraints.maxHeight,
                        width: constraints.maxWidth / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text:
                                  "Make your idea come true with great team and experience",
                              minFontSize: 14,
                              fontSize: 70,
                              fontWeight: FontWeight.w900,
                            ),
                            Vspace(40),
                            SizedBox(
                              width: constraints.maxWidth / 4,
                              child: TextWidget(
                                text:
                                    "Dont't let you choose the wrong contractor besides spending money. you also waste your mind and energy. turn your idea into a building with us",
                                color: Color(0xffB1B1B1),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                height: 1.3,
                              ),
                            ),
                            Vspace(40),
                            DesktopButton(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                FullHeightContainer(
                  constraints: constraints,
                  child: Container(
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
