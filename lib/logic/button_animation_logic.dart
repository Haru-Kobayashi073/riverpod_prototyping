import 'package:flutter/widgets.dart';

class ButtonAnimationLogic {
  late AnimationController _animationController;
  late Animation<double> _animationScale;

  get animationScale => _animationScale;

  ButtonAnimationLogic(TickerProvider tickerProvider) {
    _animationController = AnimationController(
        vsync: tickerProvider, duration: const Duration(milliseconds: 500));

    _animationScale = _animationController
        .drive(CurveTween(curve: const Interval(0.1, 0.7)))
        .drive(Tween(begin: 1.0, end: 1.8));
  }

  @override
  void dispose() {
    _animationController.dispose();
  }

  void start() {
    _animationController
        .forward()
        .whenComplete(() => _animationController.reset());
  }
}
