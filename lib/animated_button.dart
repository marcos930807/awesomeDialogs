import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final Function pressEvent;
  final String text;
  final IconData icon;
  final double width;
  final Color color;

  const AnimatedButton(
      {@required this.pressEvent,
      this.text,
      this.icon,
      this.color,
      this.width = double.infinity});
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  Animation<double> _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });
    final curveAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInBack,
        reverseCurve: Curves.easeOut);
    _scale = Tween<double>(begin: 1, end: 0.8).animate(curveAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  // void _onTapUp(TapUpDetails details) {
  //   _controller.reverse();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.pressEvent();
        //  _controller.forward();
      },
      onTapDown: _onTapDown,
      // onTapUp: _onTapUp,
      child: Transform.scale(
        scale: _scale.value,
        child: _animatedButtonUI,
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 50,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: widget.color ?? Theme.of(context).primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.icon != null
                ? Icon(
                    widget.icon,
                    color: Colors.white,
                  )
                : SizedBox(),
            SizedBox(
              width: 5,
            ),
            Text(
              '${widget.text}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ],
        ),
      );
}
