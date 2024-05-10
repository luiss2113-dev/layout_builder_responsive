import 'package:app_mobile_app_yeyo/src/content/contact_content.dart';
import 'package:app_mobile_app_yeyo/src/content/features_content.dart';
import 'package:app_mobile_app_yeyo/src/content/home_content.dart';
import 'package:app_mobile_app_yeyo/src/content/screenshots_content.dart';
import 'package:app_mobile_app_yeyo/src/navigation/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scrolledProvider = StateProvider<bool>((_) => false);

class MyWebPage extends HookConsumerWidget {
  const MyWebPage({super.key});

  void onScroll(ScrollController controller, WidgetRef ref) {
    final isScrolled = ref.read(scrolledProvider.notifier).state;

    if (controller.position.pixels > 5 && !isScrolled) {
      ref.read(scrolledProvider.notifier).state = true;
    } else if (controller.position.pixels <= 5 && isScrolled) {
      ref.read(scrolledProvider.notifier).state = false;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();
    final double width = MediaQuery.of(context).size.width;
    final double maxWidth = width > 1200 ? 1200 : width;

    useEffect(() {
      controller.addListener(() => onScroll(controller, ref));
      return controller.dispose;
    }, [controller]);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: maxWidth,
          child: Column(
            children: [
              //Navigation Bar
              const NavBar(),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  child: const Column(
                    children: [
                      HomeContent(),
                      FeaturesContent(),
                      ScreenshotsContent(),
                      ContactContent()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
