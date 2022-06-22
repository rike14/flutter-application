import 'package:flutter/material.dart';

class ButtonDefault extends StatefulWidget {
  final Color? backGroundColor;
  final Widget child;
  final VoidCallback onPressd;
  const ButtonDefault(
    this.child,
    this.onPressd, {
    Key? key,
    this.backGroundColor,
  }) : super(key: key);

  @override
  _ButtonDefaultState createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressd,
      child: const Text('Evolução'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            widget.backGroundColor ?? Colors.purpleAccent),
      ),
    );
  }
}
