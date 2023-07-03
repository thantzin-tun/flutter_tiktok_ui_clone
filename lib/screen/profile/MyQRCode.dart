import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widgets_testing/screen/profile/ProfileBottomSheet.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';

class MyQRCodeScreen extends StatefulWidget {
  const MyQRCodeScreen({super.key});

  @override
  State<MyQRCodeScreen> createState() => _MyQRCodeScreenState();
}

class _MyQRCodeScreenState extends State<MyQRCodeScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  List<Color> myColor = [
    Colors.greenAccent,
    AppColor.tittokRed,
    Colors.purpleAccent,
    AppColor.pinking,
    AppColor.secondaryTextColor,
    AppColor.activeColor,
    AppColor.defaultWhiteColor
  ];

  int colorIndex = 0;
  int previousColorIndex = 0;
  double dx = 0.0;
  double dy = 0.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.decelerate))
      ..addListener(() {
        setState(() {});
      });
  }

  void animationFunc(var details) {
    setState(() {
      dx = details.localPosition.dx;
      dy = details.localPosition.dy;
      if (colorIndex == 6) {
        previousColorIndex = colorIndex;
        colorIndex = 0;
      } else {
        previousColorIndex = colorIndex;
        colorIndex++;
      }
    });
    animationController.reset();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTapDown: animationFunc,
      child: Scaffold(
        backgroundColor: myColor[previousColorIndex],

        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
          child: Container(
              color: Colors.white,
              height: 130,
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  MyTextWidget(
                    text: "Share to",
                    color: AppColor.defaultBlackColor,
                    fontSize: 18,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Image.asset(
                                  "assets/images/facebook.webp",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              MyTextWidget(
                                text: "Facebook",
                                color: AppColor.secondaryTextColor,
                                fontSize: 13,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              )),
        ),


        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.defaultWhiteColor,
              )),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_2))
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[

              CustomPaint(
                painter: MyPainter(
                    
                    backColor: myColor[colorIndex],
                    radius: 1000 * animationController.value,
                    dx: dx ,
                    dy: dy
                    
                    ),
              ),


              Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      width: w * 0.85,
                      height: h * 0.50,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            height: h * 0.45,
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 50,
                                ),
                                MyTextWidget(
                                  text: "Thant Zin Tun",
                                  color: AppColor.defaultBlackColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: w * 0.5,
                                  height: 250,
                                  child: Image.asset(
                                    "assets/images/six.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                MyTextWidget(
                                  text:
                                      "Share your QR code so others can follow you",
                                  color: AppColor.defaultBlackColor,
                                  fontSize: 13.0,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: 0,
                              left: (w * 0.85 - 90) / 2,
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                    color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(45),
                                    border: Border.all(
                                        width: 6,
                                        color: AppColor.defaultWhiteColor)),
                                child: const Center(
                                    child: MyTextWidget(
                                  text: "Z",
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                )),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyTextWidget(
                      text: "Tap background to change color",
                      fontSize: 15,
                    )
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  double radius;
  double dx;
  double dy;
  Color backColor;
  MyPainter(
      {required this.radius,
      required this.dx,
      required this.dy,
      required this.backColor});
  @override
  void paint(Canvas canvas, Size size) {
    var myPaint = Paint();
    myPaint.color = backColor;
    myPaint.style = PaintingStyle.fill;
    myPaint.strokeWidth = 1.0;

    canvas.drawCircle(Offset(dx, dy), radius, myPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
