import 'package:flutter/material.dart';

class BasicVariations extends StatefulWidget {
  const BasicVariations({super.key});

  @override
  State<BasicVariations> createState() => _BasicVariationsState();
}

class _BasicVariationsState extends State<BasicVariations> {
  Widget getClipperWidget(
      {required CustomClipper<Path> clipper,
      double width = 100,
      double height = 100,
      Color color = Colors.blue}) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Variations"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              getClipperWidget(clipper: LineClipper()),
              const SizedBox(
                height: 20,
              ),
              getClipperWidget(clipper: CircleClipper()),
              const SizedBox(
                height: 20,
              ),
              getClipperWidget(clipper: TriangleClipper()),
              const SizedBox(
                height: 20,
              ),
              getClipperWidget(clipper: RectangleClipper(), width: 200),
              const SizedBox(
                height: 20,
              ),
              //For Square Give Same Height and Width
              getClipperWidget(clipper: RectangleClipper()),
              const SizedBox(
                height: kBottomNavigationBarHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LineClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height - 5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 5);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class RectangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
