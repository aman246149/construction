import 'package:architecture/core/images/app_images.dart';
import 'package:architecture/core/presentation/widgets/vspace.dart';
import 'package:architecture/features/home/desktop/desktop_home.dart';
import 'package:architecture/features/home/widgets/desktop_home_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../core/presentation/widgets/hspace.dart';
import '../../../core/utils/common_images.dart';
import '../widgets/mobile_home_widgets.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome>
    with SingleTickerProviderStateMixin {
  // Animation Controller
  AnimationController? _animationController;
  late ScrollController _scrollController;
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectKey = GlobalKey();
  final GlobalKey _constructionKey = GlobalKey();
  final GlobalKey _reviewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  _toggleAnimation() {
    _animationController!.isDismissed
        ? _animationController!.forward()
        : _animationController!.reverse();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void goToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeIn,
      duration: const Duration(
        milliseconds: 500,
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
    _toggleAnimation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    return SafeArea(
      child: AnimatedBuilder(
        animation: _animationController!,
        builder: (context, child) {
          double slide = rightSlide * _animationController!.value;
          double scale = 1 - (_animationController!.value * 0.3);
          return Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.black,
                body: DrawerData(
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
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.center,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: const Text("BRAND NAME"),
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        _toggleAnimation();
                      },
                    ),
                  ),
                  body: MobileData(
                    updateKeyOnTap: (p0) {
                      goToSpecificKey(p0);
                    },
                    projectKey: _aboutKey,
                    aboutKey: _constructionKey,
                    reviewKey: _projectKey,
                    constructionKey: _reviewKey,
                    goToContactUs: () {
                      goToBottom();
                    },
                    scrollController: _scrollController,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
