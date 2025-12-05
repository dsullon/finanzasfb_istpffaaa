import 'package:flutter/material.dart';

class AuthHeaderBackground extends StatelessWidget {
  final Widget child;
  const AuthHeaderBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [_Background(), _HeaderIcon(), this.child]),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, Colors.red.withAlpha(200)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(bottom: -100, child: _HeaderCircle()),
          Positioned(right: -100, top: 100, child: _HeaderCircle()),
          Positioned(top: -100, left: -100, child: _HeaderCircle()),
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.person_pin_rounded, color: Colors.white, size: 100),
      ),
    );
  }
}

class _HeaderCircle extends StatelessWidget {
  const _HeaderCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white10,
      ),
    );
  }
}
