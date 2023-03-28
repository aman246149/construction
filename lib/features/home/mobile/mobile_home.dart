import 'package:architecture/core/images/app_images.dart';
import 'package:architecture/core/presentation/widgets/vspace.dart';
import 'package:architecture/features/home/widgets/desktop_home_widgets.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
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
              const Scaffold(
                backgroundColor: Colors.black,
                body: DrawerData(),
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
                  body: const MobileData(),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class MobileData extends StatefulWidget {
  const MobileData({super.key});

  @override
  State<MobileData> createState() => _MobileDataState();
}

class _MobileDataState extends State<MobileData> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          const Center(child: MobileButton()),
          const Vspace(20),
          Image.asset(AppImages.homeImage)
        ],
      ),
    );
  }
}

class MobileButton extends StatelessWidget {
  const MobileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24), backgroundColor: const Color(0xff4844FF)),
        onPressed: () {},
        child: const TextWidget(
          text: "Send Inquery",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ));
  }
}
