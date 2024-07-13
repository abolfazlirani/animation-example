import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Animation')),
        body: Center(child: FadeInOutButton()),
      ),
    );
  }
}

class FadeInOutButton extends StatefulWidget {
  @override
  _FadeInOutButtonState createState() => _FadeInOutButtonState();
}

class _FadeInOutButtonState extends State<FadeInOutButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
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
    return Opacity(
      opacity: _animation.value,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Fade In Out'),
      ),
    );
  }
}
