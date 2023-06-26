import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monapp/splash_screen.dart';
import 'package:monapp/values/values.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5,),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
      setState(() {});
    });

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
      setState(() {});
    });

    Timer(Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff192028),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Positioned(
                  top: size.height * (animation2.value + .58),
                  left: size.width * .21,
                  child: CustomPaint(
                    painter: MyPainter(50),
                  ),
                ),
                Positioned(
                  top: size.height * .98,
                  left: size.width * .1,
                  child: CustomPaint(
                    painter: MyPainter(animation4.value - 30),
                  ),
                ),
                Positioned(
                  top: size.height * .5,
                  left: size.width * (animation2.value + .8),
                  child: CustomPaint(
                    painter: MyPainter(30),
                  ),
                ),
                Positioned(
                  top: size.height * animation3.value,
                  left: size.width * (animation1.value + .1),
                  child: CustomPaint(
                    painter: MyPainter(60),
                  ),
                ),
                Positioned(
                  top: size.height * .1,
                  left: size.width * .8,
                  child: CustomPaint(
                    painter: MyPainter(animation4.value),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * .1),
                          child:
                          Text(
                            "HelpMama",
                            style: GoogleFonts.pacifico(
                              textStyle: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                wordSpacing: 4,),
                            ),
                          ),
                          /*,Text(
                            'APP NAME',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.7),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 4,
                            ),
                          ),*/
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          //constraints: const BoxConstraints(maxWidth: kTabDimens),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              EntryComponent(Icons.account_circle_outlined,
                                hint: 'User name...',
                              ),
                              EntryComponent(Icons.email_outlined,
                                hint: 'Email...',
                                isEmail: true,
                              ),
                              EntryComponent(Icons.lock_outline,
                                hint: 'Password...',
                                isPassword: true,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonComponent(
                                    'LOGIN',
                                    onPressed: () {
                                      HapticFeedback.lightImpact();
                                      Fluttertoast.showToast(
                                          msg: 'Login button pressed');
                                    },
                                  ),
                                  SizedBox(width: size.width / 20),

                                  ButtonComponent(
                                    'Forgotten password!',
                                    onPressed: () {
                                      HapticFeedback.lightImpact();
                                      //Fluttertoast.showToast(msg: 'Forgotten password button pressed');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonComponent(
                               'Create a new Account',
                              width: 240,
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                Fluttertoast.showToast(
                                    msg: 'Create a new account button pressed');
                              },
                            ),
                            SizedBox(height: size.height * .05),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget EntryComponent(IconData icon, {required String hint, bool isPassword = false, bool? isEmail}) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          height:50 ,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            style: TextStyle(color: Colors.white.withOpacity(.8)),
            cursorColor: Colors.white,
            obscureText: isPassword,
            keyboardType: (isEmail ?? false)
                ? TextInputType.emailAddress
                : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hint,
              hintStyle:
              TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ButtonComponent(
     String text,{
    final double? width,
    VoidCallback? onPressed,}) {

    return OpenContainer(
      closedBuilder: (_, openContainer) {
        return Container(
          constraints: const BoxConstraints(minWidth: 150),
          height: 50,//size.width / 8,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.cyan.withOpacity(.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.white.withOpacity(.8)),
          ),
        );
      },
      closedColor: Colors.transparent,
      openColor: Colors.white,
      closedElevation: 20,
      closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      transitionDuration: Duration(milliseconds: 700),
      openBuilder: (_, closeContainer) {
        onPressed!();
        return TransitPage();
      },
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          highlightColor: Colors.green,
          splashColor: Colors.green,
          //hoverColor: Colors.green,
          onTap: onPressed,
          child: Container(
            constraints: const BoxConstraints(minWidth: 150),
            height: 50,//size.width / 8,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.cyan.withOpacity(.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              text,
              style: TextStyle(color: Colors.white.withOpacity(.8)),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
          colors: [Color(0xffFD5E3D), Color(0xffC43990)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}