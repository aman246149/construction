import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../core/images/app_images.dart';
import '../../../core/presentation/widgets/hspace.dart';
import '../../../core/presentation/widgets/vspace.dart';
import '../../../core/widgets/border_textfield.dart';

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
    required this.onTap,
  });
  final BoxConstraints constraints;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80, right: 80, top: 50),
      child: Row(
        children: [
          const Expanded(child: Hspace(0)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(24),
                  backgroundColor: const Color(0xff4844FF)),
              onPressed: () {
                onTap();
              },
              child: const TextWidget(
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
    required this.aboutOnTap,
    required this.projectTap,
    required this.constructionTap,
    required this.reviewTap,
  });
  final BoxConstraints constraints;
  final Function() aboutOnTap;
  final Function() projectTap;
  final Function() constructionTap;
  final Function() reviewTap;
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
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    aboutOnTap();
                  },
                  child: TextWidget(
                    text: "About",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff818181),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    projectTap();
                  },
                  child: TextWidget(
                    text: "Project",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff818181),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    constructionTap();
                  },
                  child: GestureDetector(
                    child: TextWidget(
                        text: "Construction",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff818181)),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    reviewTap();
                  },
                  child: TextWidget(
                      text: "Review",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff818181)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontSize,
      this.textAlign,
      this.fontWeight,
      this.height,
      this.minFontSize = 12});
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
        ));
  }
}

class HomeTopContainer extends StatelessWidget {
  const HomeTopContainer({
    super.key,
    required this.constraints,
    required this.onTap,
  });
  final BoxConstraints constraints;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 80, right: 80, top: 170),
      height: constraints.maxHeight,
      width: constraints.maxWidth / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: "Make your idea come true with great team and experience",
            minFontSize: 14,
            fontSize: 70,
            fontWeight: FontWeight.w900,
          ),
          const Vspace(40),
          SizedBox(
            width: constraints.maxWidth / 4,
            child: const TextWidget(
              text:
                  "Dont't let you choose the wrong contractor besides spending money. you also waste your mind and energy. turn your idea into a building with us",
              color: Color(0xffB1B1B1),
              fontSize: 14,
              fontWeight: FontWeight.normal,
              height: 1.3,
            ),
          ),
          const Vspace(40),
          DesktopButton(
            onTap: () {
              onTap();
            },
          ),
        ],
      ),
    );
  }
}

class SecondContainer extends StatelessWidget {
  const SecondContainer({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return FullHeightContainer(
      constraints: constraints,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 100),
        child: Row(
          children: [
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth / 2,
              child: Image.asset(
                AppImages.trust,
                fit: BoxFit.cover,
              ),
            ),
            const Hspace(30),
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth / 3,
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
                  ),
                  Vspace(30),
                  BulletPoint(text: "High Quality Materials"),
                  BulletPoint(text: "Professional Designer"),
                  BulletPoint(text: "Minimized Time"),
                  BulletPoint(text: "Affordable Prices"),
                ],
              ),
            ),
          ],
        ),
      
      
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  const BulletPoint({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 20,
      leading: const Icon(
        Icons.square,
        color: Colors.black,
        size: 16,
      ),
      title: TextWidget(
        text: text,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

class ServicesContainer extends StatelessWidget {
  const ServicesContainer({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return FullHeightContainer(
      constraints: constraints,
      child: SizedBox(
        width: double.infinity,
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Vspace(30),
                TextWidget(
                  text: "Our Services",
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                Vspace(40),
                ExpandedWidget(
                    text: "Architecture",
                    description:
                        "Our world-class architecture is achieved through a commitment to excellence in every aspect of our work. We collaborate closely with clients to create functional, efficient, and meaningful spaces that meet their vision and goals.",
                    constraints: constraints),
                Vspace(15),
                ExpandedWidget(
                    text: "Design & Build",
                    description:
                        "We provide world-class Design & Build services that simplify the construction process for our clients. With a single point of contact responsible for both the design and construction phases, we can offer greater control over the timeline, budget, and quality of the project.",
                    constraints: constraints),
                Vspace(15),
                ExpandedWidget(
                    text: "Renovation",
                    description:
                        "We provide world-class Design & Build services that simplify the construction process for our clients. With a single point of contact responsible for both the design and construction phases, we can offer greater control over the timeline, budget, and quality of the project.",
                    constraints: constraints),
                Vspace(15),
                ExpandedWidget(
                    text: "Building Construction",
                    description:
                        "We provide world-class Design & Build services that simplify the construction process for our clients. With a single point of contact responsible for both the design and construction phases, we can offer greater control over the timeline, budget, and quality of the project.",
                    constraints: constraints),
                Vspace(15),
              ],
            ),
         
          ),
        ),
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({
    super.key,
    required this.text,
    required this.description,
    required this.constraints,
  });
  final String text;
  final String description;
  final BoxConstraints constraints;
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
      theme: ExpandableThemeData(iconSize: 60, iconColor: Colors.black),
      collapsed: SizedBox.fromSize(),
      expanded: SizedBox(
          width: constraints.maxWidth / 2 - 200,
          child: TextWidget(
            text: description,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}

class WorkWidget extends StatelessWidget {
  const WorkWidget({
    super.key,
    required this.images,
    required this.constraints,
  });
  final BoxConstraints constraints;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return FullHeightContainer(
      constraints: constraints,
      child: SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Stack(
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
                      height: constraints.maxHeight / 2,
                      viewportFraction: 0.4,
                      aspectRatio: 4 / 3,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.1,
                      onPageChanged: (index, reason) {},
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: TextWidget(
                    text: "Our Work",
                    fontSize: 55,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
   
    );
  }
}

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return FullHeightContainer(
      constraints: constraints,
      child: SizedBox(
        width: double.infinity,
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.contact,
                      fit: BoxFit.cover,
                      width: constraints.maxWidth / 3,
                    ),
                    Hspace(20),
                    SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth / 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          DesktopButton(
                            onTap: () {},
                          ),
                          Vspace(15),
                          TextWidget(
                              text: "Directly Contact Us",
                              fontWeight: FontWeight.w800,
                              fontSize: 18),
                          Vspace(18),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.3),
                                ),
                                child: TextWidget(text: "123456789"),
                              ),
                              Hspace(15),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.3),
                                ),
                                child: TextWidget(text: "xyz@gmail.com"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
         
          ),
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.maxLine,
  });
  final String label;
  final String hintText;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Vspace(10),
        TextWidget(text: label, fontWeight: FontWeight.w800, fontSize: 18),
        Vspace(10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.3),
            borderRadius: BorderRadius.circular(14),
          ),
          child: BorderedTextFormField(
            hintText: hintText,
            maxline: maxLine,
          ),
        )
      ],
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
