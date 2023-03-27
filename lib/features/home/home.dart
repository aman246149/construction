import 'package:architecture/features/home/desktop/desktop_home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/mobile_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return DesktopHome();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return DesktopHome();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
          return Container(color: Colors.yellow);
        }

        return MobileHome();
      },
    );
  }
}
