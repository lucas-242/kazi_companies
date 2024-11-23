import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_core/kazi_core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final containerAnimationDuration = const Duration(milliseconds: 1000);
  final opacityAnimationDuration = const Duration(milliseconds: 1100);
  final minimumSplashTime = const Duration(milliseconds: 3500);
  final delayToInitAnimation = const Duration(milliseconds: 1000);

  late Timer timer;

  bool showText = false;
  bool canNavigate = false;

  @override
  void initState() {
    timer = Timer(minimumSplashTime, () => canNavigate = true);
    WidgetsBinding.instance.addPostFrameCallback((_) => _initAnimation());
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => {
        if (mounted) context.navigateTo(AppPages.services),
      },
    );
    super.initState();
  }

  Future<void> _initAnimation() async {
    await Future.delayed(
      delayToInitAnimation,
      () => setState(() => showText = true),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsScheme.primary,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SvgPicture.asset(
            //   KaziAssets.logo,
            //   height: 55,
            // ),
            AnimatedContainer(
              duration: containerAnimationDuration,
              height: KaziSizings.logoHeight,
              width: showText ? context.width * 0.19 : 0,
              child: Center(
                child: AnimatedOpacity(
                  duration: opacityAnimationDuration,
                  opacity: showText ? 1 : 0,
                  child: Text(
                    'Kazi',
                    style: KaziTextStyles.loginTitle,
                    softWrap: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
