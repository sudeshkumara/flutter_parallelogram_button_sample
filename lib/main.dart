import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing Paths',
      home: Scaffold(
        body: Center(
          child: Container(
            width: 278,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => print('Do Something'),
                    child: CustomPaint(
                      child: Container(
                          height: 50,
                          width: 150,
                          child: Center(
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      size: Size(150, 50),
                      painter: CurvePainter(Color(0xFFE9AF11)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => print('Do Something'),
                    child: CustomPaint(
                      child: Container(
                          height: 50,
                          width: 150,
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      size: Size(150, 50),
                      painter: CurvePainter(Color(0xFFD30F50)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final Color color;

  CurvePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(size.width * 0.15, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.85, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
