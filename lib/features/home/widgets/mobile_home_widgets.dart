import 'package:architecture/core/images/app_images.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../core/presentation/widgets/hspace.dart';
import '../../../core/presentation/widgets/vspace.dart';
import '../../../core/utils/common_images.dart';
import '../desktop/desktop_home.dart';
import 'desktop_home_widgets.dart';

class DrawerData extends StatelessWidget {
  final Function() aboutOnTap;
  final Function() projectTap;
  final Function() constructionTap;
  final Function() reviewTap;
  const DrawerData(
      {super.key,
      required this.aboutOnTap,
      required this.projectTap,
      required this.constructionTap,
      required this.reviewTap});
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
            GestureDetector(
              onTap: () {
                aboutOnTap();
              },
              child: CommonDrawerButton(
                text: "About",
              ),
            ),
            Vspace(18),
            GestureDetector(
              onTap: () {
                projectTap();
              },
              child: CommonDrawerButton(
                text: "Project",
              ),
            ),
            Vspace(18),
            GestureDetector(
              onTap: () {
                constructionTap();
              },
              child: CommonDrawerButton(
                text: "Construction",
              ),
            ),
            Vspace(18),
            GestureDetector(
              onTap: () {
                reviewTap();
              },
              child: CommonDrawerButton(
                text: "Reviews",
              ),
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
      padding: const EdgeInsets.all(8),
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



class MobileData extends StatefulWidget {
  final Function(GlobalKey) updateKeyOnTap;
  const MobileData(
      {super.key,
      required this.updateKeyOnTap,
      required this.projectKey,
      required this.aboutKey,
      required this.reviewKey,
      required this.constructionKey,
      required this.goToContactUs,
      required this.scrollController});
  final GlobalKey projectKey;
  final GlobalKey aboutKey;
  final GlobalKey reviewKey;
  final GlobalKey constructionKey;
  final Function() goToContactUs;
  final ScrollController scrollController;
  @override
  State<MobileData> createState() => _MobileDataState();
}

class _MobileDataState extends State<MobileData> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: "Make your idea come true with great team and experience",
            minFontSize: 14,
            fontSize: 50,
            fontWeight: FontWeight.w900,
          ),
          const Vspace(40),
          const TextWidget(
            text:
                "Dont't let you choose the wrong contractor besides spending money. you also waste your mind and energy. turn your idea into a building with us",
            color: Color(0xffB1B1B1),
            fontSize: 18,
            fontWeight: FontWeight.normal,
            height: 1.3,
          ),
          const Vspace(40),
          Center(child: MobileButton(
            onTap: () {
              widget.goToContactUs();
            },
          )),
          const Vspace(20),
          MobileAboutUs(
            key: widget.aboutKey,
          ),
          const Vspace(20),
          MobileWorkWidget(key: widget.projectKey),
          ServiceMobile(key: widget.constructionKey),
          Vspace(20),
          ReviewWidgetMobile(key: widget.reviewKey),
          Vspace(30),
          ContaintUsMobile(
            send: () {},
          ),
        ],
      ),
    );
  }
}

class ContaintUsMobile extends StatelessWidget {
  const ContaintUsMobile({
    super.key,
    required this.send,
  });
  final Function() send;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: TextWidget(
            text: "Talk with our team",
            fontWeight: FontWeight.w900,
            fontSize: 60,
          ),
        ),
        Vspace(30),
        Image.asset(
          AppImages.contact,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Vspace(30),
        CommonTextField(
          label: "Full Name",
          hintText: "Aman Singh",
        ),
        Vspace(15),
        CommonTextField(
          label: "email",
          hintText: "xyz@gmail.com",
        ),
        Vspace(15),
        CommonTextField(
          label: "phoneNumber",
          hintText: "phoneNumber",
        ),
        Vspace(15),
        CommonTextField(
          label: "Any Query",
          hintText: "Query",
          maxLine: 4,
        ),
        Vspace(15),
        Center(child: MobileButton(
          onTap: () {
            send();
          },
        )),
        Vspace(20),
        TextWidget(
            text: "Directly Contact Us",
            fontWeight: FontWeight.w900,
            fontSize: 25),
        Vspace(20),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 0.3),
              ),
              child: TextWidget(
                text: "123456789",
                fontSize: 20,
              ),
            ),
            Hspace(15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 0.3),
              ),
              child: TextWidget(
                text: "xyz@gmail.com",
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ReviewWidgetMobile extends StatelessWidget {
  const ReviewWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          text: "What people say about us",
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w900,
          fontSize: 40,
        ),
        Vspace(30),
        Column(
          children: [
            InfoCard(
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
            Vspace(15),
            InfoCard(
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
            Vspace(15),
            InfoCard(
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
          ],
        ),
      ],
    );
  }
}

class ServiceMobile extends StatelessWidget {
  const ServiceMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Vspace(30),
        TextWidget(
          text: "Our Services",
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
        Vspace(40),
        MobileExpandablePanelWidget(
            text: "Architecture",
            description:
                "Our world-class architecture is achieved through a commitment to excellence in every aspect of our work. We collaborate closely with clients to create functional, efficient, and meaningful spaces that meet their vision and goals."),
        Vspace(15),
        MobileExpandablePanelWidget(
            text: "Design & Build",
            description:
                "We provide world-class Design & Build services that simplify the construction process for our clients. With a single point of contact responsible for both the design and construction phases, we can offer greater control over the timeline, budget, and quality of the project."),
        Vspace(15),
        MobileExpandablePanelWidget(
          text: "Renovation",
          description:
              "We provide world-class Design & Build services that simplify the construction process for our clients. With a single point of contact responsible for both the design and construction phases, we can offer greater control over the timeline, budget, and quality of the project.",
        ),
        Vspace(15),
        MobileExpandablePanelWidget(
          text: "Building Construction",
          description:
              "We provide world-class Design & Build services that simplify the construction process for our clients. With a single point of contact responsible for both the design and construction phases, we can offer greater control over the timeline, budget, and quality of the project.",
        ),
        Vspace(15),
      ],
    );
  }
}

class MobileExpandablePanelWidget extends StatelessWidget {
  const MobileExpandablePanelWidget({
    super.key,
    required this.text,
    required this.description,
  });
  final String text;
  final String description;
  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: text,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
          Vspace(15),
          Divider()
        ],
      ),
      theme: ExpandableThemeData(iconSize: 30, iconColor: Colors.black),
      collapsed: SizedBox.fromSize(),
      expanded: TextWidget(
        text: description,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class MobileWorkWidget extends StatelessWidget {
  const MobileWorkWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: TextWidget(
            text: "Our Work",
            fontSize: 55,
            fontWeight: FontWeight.w900,
          ),
        ),
        Vspace(20),
        ColoredBox(
          color: Colors.white,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      images[itemIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                  options: CarouselOptions(
                    height: 400,
                    viewportFraction: 0.8,
                    aspectRatio: 16 / 9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    onPageChanged: (index, reason) {},
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileAboutUs extends StatelessWidget {
  const MobileAboutUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppImages.homeImage),
        Vspace(20),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TextWidget(
                text: "Entrust your building with us!",
                fontSize: 60,
                fontWeight: FontWeight.w900,
              ),
              Vspace(30),
              TextWidget(
                text:
                    "Don't let you choose the wrong contractor, besides spending money. \nyou also waste your mind and energy. turn your idea into a building with us",
                height: 1.4,
                color: Colors.grey,
                fontSize: 12,
              ),
              Vspace(30),
              BulletPoint(text: "High Quality Materials"),
              BulletPoint(text: "Professional Designer"),
              BulletPoint(text: "Minimized Time"),
              BulletPoint(text: "Affordable Prices"),
            ],
          ),
        ),
        Vspace(20),
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            AppImages.trust,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class MobileButton extends StatelessWidget {
  const MobileButton({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24),
            backgroundColor: const Color(0xff4844FF)),
        onPressed: () {
          onTap();
        },
        child: const TextWidget(
          text: "Send Inquery",
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18,
        ));
  }
}
