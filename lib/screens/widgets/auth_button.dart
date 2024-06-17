import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.label,
    this.isOutlined=false,
    this.onPressed
  });
  final String label;
  final bool isOutlined;
final Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return isOutlined? OutlinedButton(
      style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      onPressed: onPressed, child: Text(label)): ElevatedButton(
         style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),)),
        onPressed: onPressed,child: Text(label),);
  }
}
