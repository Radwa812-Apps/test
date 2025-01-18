import 'package:bookly_app/Features/home/presentition/views/home.dart';
import 'package:bookly_app/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:bookly_app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SplashViewBodyWidget extends StatefulWidget {
  const SplashViewBodyWidget({super.key});

  @override
  State<SplashViewBodyWidget> createState() => _SplashViewBodyWidgetState();
}

class _SplashViewBodyWidgetState extends State<SplashViewBodyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    MyAnimation();

    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(
      //   const HomePage(),
      //   transition: Transition.fadeIn,
      //   duration: Kduration,
      // );
      GoRouter.of(context).push('/HomeView');
    });
  }

  @override
  void dispose() {
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset('assets/images/Logo.png')),
        const SizedBox(
          // const مش هيحصله ابديت
          height: 10,
        ),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void MyAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    slidingAnimation = Tween(begin: const Offset(0, 5), end: Offset.zero)
        .animate(animationController);

    animationController.forward();

    // setState(() {
    //   slidingAnimation.addListener(() {});
    // });
  }
}
