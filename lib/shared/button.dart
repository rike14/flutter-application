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
  // ignore: library_private_types_in_public_api
  _ButtonDefaultState createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressd,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            widget.backGroundColor ?? Colors.purpleAccent),
      ),
      child: const Text('Evolução'),
    );
  }
}
