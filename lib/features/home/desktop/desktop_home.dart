import 'package:architecture/core/images/app_images.dart';
import 'package:architecture/core/presentation/widgets/hspace.dart';
import 'package:architecture/core/presentation/widgets/vspace.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
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

  List<String> images = [
    "https://cdn.pixabay.com/photo/2012/07/06/20/23/excavator-51665__340.jpg",
    "https://cdn.pixabay.com/photo/2015/10/06/18/26/eiffel-tower-975004__340.jpg",
    "https://cdn.pixabay.com/photo/2015/03/08/09/34/dome-664000__340.jpg",
    "https://cdn.pixabay.com/photo/2015/12/06/18/02/architecture-1079806__340.jpg",
    "https://cdn.pixabay.com/photo/2015/05/29/19/18/architecture-789636__340.jpg",
    "https://cdn.pixabay.com/photo/2019/08/28/21/38/architecture-4437756__340.jpg"
  ];

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

class ReviewContainer extends StatelessWidget {
  const ReviewContainer({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return FullHeightContainer(
      constraints: constraints,
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "What people say about us",
                  fontWeight: FontWeight.w900,
                  fontSize: 60,
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: InfoCard(
                        title: "Aman Singh",
                        onMoreTap: () {},
                        body:
                            "They completed all my work in less then 1 year super happy About the work",
                        subInfoText: "Uttrakhand India",
                        subIcon: Icon(
                          Icons.location_on,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    Hspace(15),
                    Expanded(
                      child: InfoCard(
                        title: "Akash Reddy",
                        onMoreTap: () {},
                        body:
                            "Super happy about the work,Quality work take less time and very good service",
                        subInfoText: "New Delhi India",
                        subIcon: Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    Hspace(15),
                    Expanded(
                      child: InfoCard(
                        title: "D john",
                        onMoreTap: () {},
                        body:
                            "Work is good ,quality materials are used .Super haapy about the work",
                        subInfoText: "Goa India",
                        subIcon: Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String body;
  final Function() onMoreTap;

  final String subInfoTitle;
  final String subInfoText;
  final Widget subIcon;

  const InfoCard(
      {required this.title,
      this.body = """""",
      required this.onMoreTap,
      this.subIcon = const CircleAvatar(
        child: Icon(
          Icons.directions,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
        radius: 25,
      ),
      this.subInfoText = "545 miles",
      this.subInfoTitle = "Directions",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              offset: Offset(0, 10),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          gradient: RadialGradient(
            colors: [Colors.orangeAccent, Colors.orange],
            focal: Alignment.topCenter,
            radius: .85,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            body,
            style:
                TextStyle(color: Colors.white.withOpacity(.75), fontSize: 14),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  subIcon,
                  SizedBox(width: 10),
                  Text(
                    subInfoText,
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
