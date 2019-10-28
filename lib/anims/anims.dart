import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

//Helper Enum Class
enum SlideFrom { TOP, BOTTOM, LEFT, RIGHT }

getOffset(animation, SlideFrom from) {
  switch (from) {
    case SlideFrom.TOP:
      return Offset(0, -animation["translateX"]);
      break;
    case SlideFrom.BOTTOM:
      return Offset(0, animation["translateX"]);
      break;
    case SlideFrom.LEFT:
      return Offset(-animation["translateX"], 0);
      break;
    case SlideFrom.RIGHT:
      return Offset(animation["translateX"], 0);
      break;
    default:
  }
}

//SimpleAnimationLibrary
class FadeIn extends StatelessWidget {
  final double delay;
  final Widget child;
  final Playback playback;
  final SlideFrom from;
  final bool fade;

  FadeIn(
      {this.delay = 0,
      this.child,
      this.fade = true,
      this.playback = Playback.PLAY_FORWARD,
      this.from = SlideFrom.RIGHT});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateX").add(
          Duration(milliseconds: 500), Tween(begin: 60.0, end: 0.0),
          curve: Curves.fastLinearToSlowEaseIn)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (200 * delay).round()),
      playback: playback,
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: fade ? animation["opacity"] : 1,
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
  final Widget child;
  final Playback playback;
  final SlideFrom from;
  final double slideDistance;

  Slide(
      {this.delay = 0,
      this.child,
      this.duration = 1,
      this.slideDistance = 60.0,
      this.playback = Playback.PLAY_FORWARD,
      this.from = SlideFrom.RIGHT});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("translateX").add(Duration(milliseconds: (500 * duration).round()),
          Tween(begin: slideDistance, end: 0.0),
          curve: Curves.easeInOut),
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (200 * delay).round()),
      playback: playback,
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Transform.translate(
        offset: getOffset(animation, from),
        child: child,
        //offset: Offset(animation["translateX"], 0), child: child),
      ),
    );
  }
}

class ScaleFade extends StatelessWidget {
  final double delay;
  final Widget child;
  final Playback playback;
  final double duration;
  final bool fade;
  final double scale;
  ScaleFade({
    this.delay = 1,
    this.duration = 1,
    this.child,
    this.fade = true,
    this.scale = 0.7,
    this.playback = Playback.PLAY_FORWARD,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: (500 * duration).round()),
          fade ? Tween(begin: 0.0, end: 1.0) : Tween(begin: 1.0, end: 1.0)),
      Track("scale").add(Duration(milliseconds: (500 * duration).round()),
          Tween(begin: scale, end: 1.0),
          curve: Curves.elasticOut)
    ]);

    return ControlledAnimation(
        delay: Duration(milliseconds: (200 * delay).round()),
        playback: playback,
        duration: tween.duration,
        tween: tween,
        child: child,
        builderWithChild: (context, child, animation) => Opacity(
              opacity: animation["opacity"],
              child: Transform.scale(
                scale: animation["scale"],
                alignment: Alignment.center,
                child: child,
                //offset: Offset(animation["translateX"], 0), child: child),
              ),
            ));
  }
}

class Scale extends StatelessWidget {
  final double delay;
  final Widget child;
  final Playback playback;
  final double duration;
  final bool fade;
  final Curve curve;
  final double scalebegin;
  Scale({
    this.delay = 1,
    this.duration = 1,
    this.child,
    this.scalebegin = 0.7,
    this.curve = Curves.elasticOut,
    this.fade = true,
    this.playback = Playback.PLAY_FORWARD,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("scale").add(Duration(milliseconds: (500 * duration).round()),
          Tween(begin: scalebegin, end: 1.0),
          curve: curve)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (200 * delay).round()),
      playback: playback,
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Transform.scale(
        scale: animation["scale"],
        alignment: Alignment.center,
        child: child,
        //offset: Offset(animation["translateX"], 0), child: child),
      ),
    );
  }
}

class ShowHide extends StatelessWidget {
  final double delay;
  final Widget child;
  final double duration;
  final bool isShow;
  ShowHide({
    this.delay = 1,
    this.duration = 1,
    this.child,
    this.isShow = true,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("scale").add(Duration(milliseconds: (500 * duration).round()),
          Tween(begin: 0.0, end: 1.0),
          curve: Curves.linear)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (200 * delay).round()),
      playback: isShow ? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Transform.scale(
        scale: animation["scale"],
        alignment: Alignment.center,
        child: child,
        //offset: Offset(animation["translateX"], 0), child: child),
      ),
    );
  }
}
