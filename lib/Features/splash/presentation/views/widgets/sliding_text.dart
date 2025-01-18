import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // عشان يعيد بناء دى بس
      animation: slidingAnimation,
      builder: ((context, child) {
        return SlideTransition(
            position: slidingAnimation,
            child: const Text('Read Free Books'));
      }),
    );
  }
}
