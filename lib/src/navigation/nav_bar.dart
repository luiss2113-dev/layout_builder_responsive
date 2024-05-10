import 'package:app_mobile_app_yeyo/src/my_web_page.dart';
import 'package:app_mobile_app_yeyo/src/navigation/nav_bar_button.dart';
import 'package:app_mobile_app_yeyo/src/widget/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavBar extends ResponsiveWidget {
  const NavBar({Key? key}) : super(key);

  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopNavBar();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileNavBar();
  }
}

class DesktopNavBar extends HookConsumerWidget {
  const DesktopNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScrolled = ref.watch(scrolledProvider.notifier).state;
    final navBarColor = isScrolled ? Colors.blue : Colors.white;

    return Container(
      padding: const EdgeInsets.all(20),
      color: navBarColor,
      child: Row(
        children: [
          Image.asset(
            'assets/logo.png',
            height: 40.0,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Company Name',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          NavBarButton(onTap: () {}, text: 'Home'),
          NavBarButton(onTap: () {}, text: 'Features'),
          NavBarButton(onTap: () {}, text: 'Screenshots'),
          NavBarButton(onTap: () {}, text: 'Contact'),
        ],
      ),
    );
  }
}

class MobileNavBar extends HookConsumerWidget {
  const MobileNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conatinerHeight = useState<double>(0.0);
    return Stack(children: [
      AnimatedContainer(
        margin: const EdgeInsets.only(top: 70),
        curve: Curves.ease,
        duration: const Duration(milliseconds: 350),
        height: conatinerHeight.value,
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavBarButton(onTap: () {}, text: 'Home'),
              NavBarButton(onTap: () {}, text: 'Features'),
              NavBarButton(onTap: () {}, text: 'Screenshots'),
              NavBarButton(onTap: () {}, text: 'Contact'),
            ],
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 40.0,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Company Name',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Material(
              child: InkWell(
                splashColor: Colors.white60,
                onTap: () {
                  final height = conatinerHeight.value > 0 ? 0.0 : 240.0;
                  conatinerHeight.value = height;
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black45,
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
