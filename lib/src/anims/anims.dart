import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

//Helper Enum Class
enum SlideFrom { top, bottom, left, right }

Offset getOffset(MultiTweenValues<AniProps> animation, SlideFrom from) {
  switch (from) {
    case SlideFrom.top:
      return Offset(0, -(animation.get(AniProps.translateX) as double));
    case SlideFrom.bottom:
      return Offset(0, animation.get(AniProps.translateX));
    case SlideFrom.left:
      return Offset(-(animation.get(AniProps.translateX) as double), 0);
    case SlideFrom.right:
      return Offset(animation.get(AniProps.translateX), 0);
    default:
      return Offset.zero;
  }
}

//SimpleAnimationLibrary
enum AniProps { opacity, translateX, scale }

class FadeIn extends StatelessWidget {
  final double delay;
  final Widget? child;
  final CustomAnimationControl control;
  final SlideFrom from;
  final bool fade;
  final Curve curve;

  const FadeIn({
    Key? key,
    this.delay = 0,
    this.child,
    this.fade = true,
    this.control = CustomAnimationControl.play,
    this.from = SlideFrom.right,
    this.curve = Curves.ease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MultiTween<AniProps> newTween = MultiTween<AniProps>()
      ..add(
        AniProps.opacity,
        Tween<double>(begin: 0.0, end: 1.0),
        const Duration(milliseconds: 500),
      )
      ..add(
        AniProps.translateX,
        Tween<double>(begin: 60.0, end: 0.0),
        const Duration(milliseconds: 500),
        curve,
      );

    return CustomAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (200 * delay).round()),
      control: control,
      duration: newTween.duration,
      tween: newTween,
      child: child,
      builder: (
        BuildContext context,
        Widget? child,
        MultiTweenValues<AniProps> animation,
      ) =>
          Opacity(
        opacity: fade ? animation.get(AniProps.opacity) : 1,
        child: Transform.translate(
          offset: getOffset(animation, from),
          child: child,
        ),
      ),
    );
  }
}

class Slide extends StatelessWidget {
  final double delay;
  final double duration;
  final Widget? child;
  final CustomAnimationControl control;
  final SlideFrom from;
  final double slideDistance;
  final Curve curve;

  const Slide({
    Key? key,
    this.delay = 0,
    this.child,
    this.duration = 1,
    this.slideDistance = 60.0,
    this.control = CustomAnimationControl.play,
    this.from = SlideFrom.right,
    this.curve = Curves.ease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MultiTween<AniProps> tween = MultiTween<AniProps>()
      ..add(
        AniProps.translateX,
        Tween<double>(begin: slideDistance, end: 0.0),
        Duration(
          milliseconds: (500 * duration).round(),
        ),
        curve,
      );
    return CustomAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (200 * delay).round()),
      control: control,
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (
        BuildContext context,
        Widget? child,
        MultiTweenValues<AniProps> animation,
      ) =>
          Transform.translate(
        offset: getOffset(animation, from),
        child: child,
        //offset: Offset(animation["translateX"], 0), child: child),
      ),
    );
  }
}

class ScaleFade extends StatelessWidget {
  final double delay;
  final Widget? child;
  final CustomAnimationControl control;
  final double duration;
  final bool fade;
  final double scale;
  final Curve curve;

  const ScaleFade({
    Key? key,
    this.delay = 1,
    this.duration = 1,
    this.child,
    this.fade = true,
    this.scale = 0.7,
    this.control = CustomAnimationControl.play,
    this.curve = Curves.easeIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MultiTween<AniProps> tween = MultiTween<AniProps>()
      ..add(
        AniProps.opacity,
        fade
            ? Tween<double>(begin: 0.0, end: 1.0)
            : Tween<double>(begin: 1.0, end: 1.0),
        Duration(milliseconds: (500 * duration).round()),
      )
      ..add(
        AniProps.scale,
        Tween<double>(begin: scale, end: 1.0),
        Duration(milliseconds: (500 * duration).round()),
        curve,
      );

    return CustomAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (200 * delay).round()),
      control: control,
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (
        BuildContext context,
        Widget? child,
        MultiTweenValues<AniProps> animation,
      ) =>
          Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.scale(
          scale: animation.get(AniProps.scale),
          child: child,
          //offset: Offset(animation["translateX"], 0), child: child),
        ),
      ),
    );
  }
}

class ShowHide extends StatelessWidget {
  final double delay;
  final Widget? child;
  final double duration;
  final bool isShow;

  const ShowHide({
    Key? key,
    this.delay = 1,
    this.duration = 1,
    this.child,
    this.isShow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MultiTween<AniProps> tween = MultiTween<AniProps>()
      ..add(
        AniProps.scale,
        Tween<double>(begin: 0.0, end: 1.0),
        Duration(milliseconds: (500 * duration).round()),
        Curves.linear,
      );

    return CustomAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (200 * delay).round()),
      control: isShow
          ? CustomAnimationControl.play
          : CustomAnimationControl.playReverse,
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (
        BuildContext context,
        Widget? child,
        MultiTweenValues<AniProps> animation,
      ) =>
          Transform.scale(
        scale: animation.get(AniProps.scale),
        child: child,
        //offset: Offset(animation["translateX"], 0), child: child),
      ),
    );
  }
}
