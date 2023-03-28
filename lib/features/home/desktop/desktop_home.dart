import 'package:architecture/core/images/app_images.dart';
import 'package:architecture/core/presentation/widgets/hspace.dart';
import 'package:architecture/core/presentation/widgets/vspace.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/common_images.dart';
import '../../../core/widgets/border_textfield.dart';
import '../widgets/desktop_home_widgets.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  // // Controllers
  late ScrollController _scrollController;
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectKey = GlobalKey();
  final GlobalKey _constructionKey = GlobalKey();
  final GlobalKey _reviewKey = GlobalKey();

  @override
  void initState() {
    // initialize scroll controllers
    _scrollController = ScrollController();

    super.initState();
  }

  void goToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeIn,
      duration: const Duration(
        seconds: 1,
      ),
    );
    setState(() {});
  }

  void goToSpecificKey(GlobalKey key) {
    print(key.toString());
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
    );
    // _scrollController.animateTo(
    //   key.currentContext!.size!.height * index,
    //   duration: const Duration(seconds: 1),
    //   curve: Curves.easeOut,
    // );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return ColoredBox(
            color: const Color(0xffDFDFDF),
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(30),
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
                        DesktopNavBar(
                          constraints: constraints,
                          aboutOnTap: () {
                            goToSpecificKey(_aboutKey);
                          },
                          constructionTap: () {
                            goToSpecificKey(_constructionKey);
                          },
                          projectTap: () {
                            goToSpecificKey(_projectKey);
                          },
                          reviewTap: () {
                            goToSpecificKey(_reviewKey);
                          },
                        ),
                        DesktopNavBarButton(
                          constraints: constraints,
                          onTap: () {
                            goToBottom();
                          },
                        ),
                        HomeTopContainer(
                          constraints: constraints,
                          onTap: () {
                            goToBottom();
                          },
                        )
                      ],
                    ),
                  ),
                  SecondContainer(
                    constraints: constraints,
                    key: _aboutKey,
                  ),
                  ServicesContainer(
                    constraints: constraints,
                    key: _constructionKey,
                  ),
                  ReviewContainer(
                    key: _reviewKey,
                    constraints: constraints,
                  ),
                  WorkWidget(
                    images: images,
                    constraints: constraints,
                    key: _projectKey,
                  ),
                  ContactUsWidget(
                    constraints: constraints,
                  )
                ],
              ),
            ));
      }),
    );
  }
}
