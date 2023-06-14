import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:monapp/video_info.dart';
import 'colors.dart' as Color;
import 'colors.dart';
import 'package:flutter/src/painting/strut_style.dart';

class Infobebe extends StatefulWidget {
  const Infobebe({Key? key}) : super(key: key);

  @override
  State<Infobebe> createState() => _InfobebeState();
}

class _InfobebeState extends State<Infobebe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.AppColor.homePageBackground,
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text("HelpMama",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.AppColor.homePageBackground1,
                        fontWeight: FontWeight.w700)),

                Expanded(child: Container()),
                Icon(Icons.arrow_back_ios,
                    size: 20, color: Color.AppColor.homePageBackground1),
                SizedBox(
                  width: 10,
                ),
                //espace entre le calendrier et les petites fleches a cote
                Icon(Icons.calendar_today_outlined,
                    size: 20, color: Color.AppColor.homePageBackground2),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 20, color: Color.AppColor.homePageBackground1),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            // on cree la ligne d'en dessous

            Row(
              children: [
                Text("Votre Bébé",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.AppColor.homePageBackground2,
                        fontWeight: FontWeight.w700)),
                Expanded(child: Container()),
                // pour decaler les deux textes
                Text("Plus des details",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.AppColor.homePageBackground2,
                    )),
                SizedBox(width: 5),
                //pour decaler l'icon de la fleche avec les ecrits
                InkWell(
                  onTap: () {
                    Get.to(() => VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Color.AppColor.homePageBackground1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //pour decaler entre la ligne des ecrits et la colonne du conteneur

            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.AppColor.gradientFirst.withOpacity(0.8),
                      Color.AppColor.gradientSecond.withOpacity(0.9),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  // on va creer une bordure encercler au bout des chaques cotes sauf la droite qui sera un peu differente
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 10),
                        blurRadius: 20,
                        color: Color.AppColor.gradientSecond.withOpacity(0.2))
                  ]),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next workout Ortega",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.AppColor.homePageBackground5),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "joyeux de vous voir",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.AppColor.homePageBackground5),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "and gluttes workout",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.AppColor.homePageBackground5),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.timer,
                                size: 20,
                                color: Color.AppColor.homePageBackground5),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60 min",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.AppColor.homePageBackground5),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.AppColor.gradientFirst,
                                  blurRadius: 10,
                                  offset: Offset(4, 8),
                                )
                              ]),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            //distance entre les deux conteneurs d'images
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/rectancleRose2.jpg"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  /*Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(right: 200,bottom: 30),
        decoration: BoxDecoration(
          //color: Colors.redAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(
              "assets/femmeEnceinte2.jpg"
            ),
            //fit: BoxFit.fill
          ),
        ),

      ),*/
                  Container(
                      width: double.maxFinite,
                      height: 100,
                      margin: const EdgeInsets.only(left: 150, top: 50),
                      child: Column(
                        children: [
                          Text(
                            "you are doing great",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.AppColor.homePageBackground5),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "Keep it up\n",
                                  style: TextStyle(
                                    color: Color.AppColor.homePageBackground5,
                                    fontSize: 16,
                                  ),
                                  children: [
                                TextSpan(text: "stick to your plan"),
                              ]))
                        ],
                      ))
                ],
              ),
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/rectancleRose2.jpg"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  /*Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(right: 200,bottom: 30),
        decoration: BoxDecoration(
          //color: Colors.redAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(
              "assets/femmeEnceinte2.jpg"
            ),
            //fit: BoxFit.fill
          ),
        ),

      ),*/
                  Container(
                      width: double.maxFinite,
                      height: 100,
                      margin: const EdgeInsets.only(left: 150, top: 50),
                      child: Column(
                        children: [
                          Text(
                            "you are doing great",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.AppColor.homePageBackground5),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "Keep it up\n",
                                  style: TextStyle(
                                    color: Color.AppColor.homePageBackground5,
                                    fontSize: 16,
                                  ),
                                  children: [
                                TextSpan(text: "stick to your plan"),
                              ]))
                        ],
                      ))
                ],
              ),
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/rectancleRose2.jpg"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  /*Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(right: 200,bottom: 30),
        decoration: BoxDecoration(
          //color: Colors.redAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(
              "assets/femmeEnceinte2.jpg"
            ),
            //fit: BoxFit.fill
          ),
        ),

      ),*/
                  Container(
                      width: double.maxFinite,
                      height: 100,
                      margin: const EdgeInsets.only(left: 150, top: 50),
                      child: Column(
                        children: [
                          Text(
                            "you are doing great",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.AppColor.homePageBackground5),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "Keep it up\n",
                                  style: TextStyle(
                                    color: Color.AppColor.homePageBackground5,
                                    fontSize: 16,
                                  ),
                                  children: [
                                TextSpan(text: "stick to your plan"),
                              ]))
                        ],
                      )
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
