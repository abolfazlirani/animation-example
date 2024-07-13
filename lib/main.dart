import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Complex Animation')),
        body: Center(child: AnimatedCard()),
      ),
    );
  }
}

class AnimatedCard extends StatefulWidget {
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _sizeAnimation = Tween<double>(begin: 100, end: 200).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _rotationAnimation.value,
      child: Container(
        width: _sizeAnimation.value,
        height: _sizeAnimation.value,
        color: Colors.blue,
        child: Center(child: Text('Animated Card', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
