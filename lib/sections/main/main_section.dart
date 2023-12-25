import 'package:devendramaurya/animations/entrance_fader.dart';
import 'package:devendramaurya/configs/app.dart';
import 'package:devendramaurya/configs/app_dimensions.dart';
import 'package:devendramaurya/configs/app_theme.dart';
import 'package:devendramaurya/configs/app_typography.dart';
import 'package:devendramaurya/configs/space.dart';
import 'package:devendramaurya/constants.dart';
import 'package:devendramaurya/provider/app_provider.dart';
import 'package:devendramaurya/provider/drawer_provider.dart';
import 'package:devendramaurya/provider/scroll_provider.dart';
import 'package:devendramaurya/responsive/responsive.dart';
import 'package:devendramaurya/utils/navbar_utils.dart';
import 'package:devendramaurya/utils/utils.dart';
import 'package:devendramaurya/widget/arrow_on_top.dart';
import 'package:devendramaurya/widget/navbar_actions_button.dart';
import 'package:devendramaurya/widget/navbar_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;

part 'widgets/_body.dart';
part 'widgets/_mobile_drawer.dart';
part 'widgets/_navbar_desktop.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);

    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      drawer: !Responsive.isDesktop(context) ? const _MobileDrawer() : null,
      body: SafeArea(
        child: Stack(
          children: [
            const _Body(),
            const ArrowOnTop(),
            Responsive.isTablet(context) || Responsive.isMobile(context)
                ? const _NavBarTablet()
                : const _NavbarDesktop(),
          ],
        ),
      ),
    );
  }
}
