import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NavBarButton extends HookConsumerWidget {
  final VoidCallback onTap;
  final String text;
  const NavBarButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textColor = useState<Color>(Colors.black);
    return MouseRegion(
      onEnter: (value) {
        textColor.value = Colors.blue;
      },
      onExit: (event) {
        textColor.value = Colors.black;
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              text,
              style: TextStyle(
                color: textColor.value,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
