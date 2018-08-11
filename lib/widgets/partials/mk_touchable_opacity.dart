import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MkTouchableOpacity extends StatefulWidget {
  const MkTouchableOpacity({
    @required this.child,
    this.padding,
    this.disabledColor,
    this.pressedOpacity = 0.1,
    @required this.onPressed,
  }) : assert(pressedOpacity == null ||
            (pressedOpacity >= 0.0 && pressedOpacity <= 1.0));

  final Widget child;
  final EdgeInsetsGeometry padding;

  final Color disabledColor;
  final VoidCallback onPressed;

  final double pressedOpacity;

  bool get enabled => onPressed != null;

  @override
  _MkTouchableOpacityState createState() => new _MkTouchableOpacityState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      new FlagProperty('enabled', value: enabled, ifFalse: 'disabled'),
    );
  }
}

class _MkTouchableOpacityState extends State<MkTouchableOpacity>
    with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 10);
  static const Duration kFadeInDuration = Duration(milliseconds: 100);
  Tween<double> _opacityTween;

  AnimationController _animationController;

  void _setTween() {
    _opacityTween = new Tween<double>(
      begin: 1.0,
      end: widget.pressedOpacity ?? 1.0,
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _setTween();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController = null;
    super.dispose();
  }

  @override
  void didUpdateWidget(MkTouchableOpacity old) {
    super.didUpdateWidget(old);
    _setTween();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = _buttonHeldDown;
    final Future<Null> ticker = _buttonHeldDown
        ? _animationController.animateTo(1.0, duration: kFadeOutDuration)
        : _animationController.animateTo(0.0, duration: kFadeInDuration);
    ticker.then((Null value) {
      if (mounted && wasHeldDown != _buttonHeldDown) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;

    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: enabled ? _handleTapDown : null,
      onTapUp: enabled ? _handleTapUp : null,
      onTapCancel: enabled ? _handleTapCancel : null,
      onTap: widget.onPressed,
      child: new Semantics(
        button: true,
        child: new FadeTransition(
          opacity: _opacityTween.animate(new CurvedAnimation(
            parent: _animationController,
            curve: Curves.decelerate,
          )),
          child: new Center(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
