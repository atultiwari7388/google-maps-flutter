import 'package:flutter/material.dart';

class RoundButtonWidget extends StatelessWidget {
  const RoundButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.loading = false,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepOrange,
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white, strokeWidth: 3)
              : Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
        ),
      ),
    );
  }
}
