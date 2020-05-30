import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedButton extends StatefulWidget {
  final Function pressEvent;
  final String text;
  final IconData icon;
  final double width;
  final bool isFixedHeight;
  final Color color;

  const AnimatedButton(
      {@required this.pressEvent,
      this.text,
      this.icon,
      this.color,
      this.isFixedHeight = true,
      this.width = double.infinity});
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with AnimationMixin {
  Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    final curveAnimation = CurvedAnimation(
        parent: controller, curve: Curves.easeIn, reverseCurve: Curves.easeIn);
    _scale = Tween<double>(begin: 1, end: 0.9).animate(curveAnimation);
  }

  void _onTapDown(TapDownDetails details) {
    controller.play(duration: Duration(milliseconds: 150));
  }

  void _onTapUp(TapUpDetails details) {
    if (controller.isAnimating) {
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed)
          controller.playReverse(duration: Duration(milliseconds: 100));
      });
    } else
      controller.playReverse(duration: Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.pressEvent();
        //  _controller.forward();
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () {
        controller.playReverse(
          duration: Duration(milliseconds: 100),
        );
      },
      child: Transform.scale(
        scale: _scale.value,
        child: _animatedButtonUI,
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: widget.isFixedHeight ? 50.0 : null,
        width: widget.width,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: widget.color ?? Theme.of(context).primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.icon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Icon(
                      widget.icon,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
            SizedBox(
              width: 5,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                '${widget.text}',
                // maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
            ),
          ],
        ),
      );
}
