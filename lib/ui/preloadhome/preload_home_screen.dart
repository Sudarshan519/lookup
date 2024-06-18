import 'package:flutter/material.dart';

class BottomClipper extends StatefulWidget {
  const BottomClipper({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<BottomClipper> createState() => _BottomClipperState();
}

class _BottomClipperState extends State<BottomClipper> {
  @override
  Widget build(BuildContext context) {
    return OvalClipper(height: widget.height!, width: widget.width!);
  }
}

class OvalClipper extends StatelessWidget {
  final double height;
  final double width;

  const OvalClipper({super.key, required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomOvalClipper(),
      child: Container(color: Colors.blue, height: height, width: width),
    );
  }
}

class InvertedBottomOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      size.width / 2, size.height, // Control point
      size.width, size.height - 30, // End point
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2, size.height - 100, // Control point
      size.width, size.height, // End point
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}