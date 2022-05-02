import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        //Stack:Coloca Widgets sobre otros
        children: [_PurpleBox(), _HeaderIcon(), this.child],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.personal_injury_sharp, color: Colors.white, size: 100),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _buildBoxDecoration(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 120, left: 10),
          Positioned(child: _Bubble(), top: 20, right: 50),
          Positioned(child: _Bubble(), top: -50, left: 10),
          Positioned(child: _Bubble(), bottom: 10, right: -10),
          Positioned(child: _Bubble(), bottom: -50, left: 100),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(30, 63, 156, 1),
        Color.fromRGBO(80, 70, 178, 1),
      ]));
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.07)),
    );
  }
}
