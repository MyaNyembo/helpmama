import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:monapp/admin/dashboard.dart';
import 'package:monapp/video_info.dart';
//import 'values/colors.dart' as Color;
import 'values/values.dart' as Color;
import 'package:flutter/src/painting/strut_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [
    {"title": "Alimentation", "img": "assets/femmeEnceintebelle.jpg"},
    {"title": "Habillement", "img": "assets/femmeEnceintebelle.jpg"},
    {"title": "A eviter", "img": "assets/femmeEnceintebelle.jpg"},
    {"title": "Le Saviez-vous", "img": "assets/femmeEnceintebelle.jpg"},
  ];

  /*_initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      info= json.decode(value);
    });
  }*/

  @override
  void initState() {
    super.initState();
    //_initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.AppColor.homePageBackground,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1280),
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Text("HelpMama",
                      style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                              fontSize: 30,
                              color: Color.AppColor.homePageBackground1,
                              fontWeight: FontWeight.w700)),
                      ),


                  Expanded(child: Container()),
                  Icon(Icons.arrow_back_ios,
                      size: 20, color: Color.AppColor.homePageBackground1),
                  const SizedBox(
                    width: 10,
                  ),
                  //espace entre le calendrier et les petites fleches a cote
                  Icon(Icons.calendar_today_outlined,
                      size: 20, color: Color.AppColor.homePageBackground2),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 20, color: Color.AppColor.homePageBackground1),
                ],
              ),
              const SizedBox(
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
                  const SizedBox(width: 5),
                  //pour decaler l'icon de la fleche avec les ecrits
                  InkWell(
                    onTap: () {
                      Get.to(() => const VideoInfo());
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Color.AppColor.homePageBackground1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
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
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80),
                    ),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(5, 10),
                          blurRadius: 20,
                          color: Color.AppColor.gradientSecond.withOpacity(0.2))
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.AppColor.homePageBackground5),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Poid: ... Kg",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.AppColor.homePageBackground5),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Taille: ...  metre",
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
                              Icon(Icons.monitor_weight_outlined,
                                  size: 20,
                                  color: Color.AppColor.homePageBackground5),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "semaine",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.AppColor.homePageBackground5),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          //const Spacer(),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, AdminDashboard.route());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.AppColor.gradientFirst,
                                      blurRadius: 10,
                                      offset: Offset(4, 8),
                                    )
                                  ]),
                              child: const Icon(
                                Icons.play_circle_fill,
                                color: Colors.white,
                                size: 50,
                              ),
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
                        margin: const EdgeInsets.only(left: 10, top: 50, right: 10),
                        child: Column(
                          children: [
                            Text(
                              "Nous sommes ravi de vous accompagner  ",
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
                                    text: "Decouvrez quelques conseils pour vous \n",
                                    style: TextStyle(
                                      color: Color.AppColor.homePageBackground5,
                                      fontSize: 16,
                                    ),
                                    children: [
                                  TextSpan(text: "conseils pour vous"),
                                ]))
                          ],
                        ))
                  ],
                ),
              ),

              Row(
                children: [
                  Text(
                    "Une nouvelle vie",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color.AppColor.homePageBackground6,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: OverflowBox(
                  //maxWidth: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: info.length,
                        itemBuilder: (_, i) {
                          return Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0, right: 16.0),
                                child: Container(
                                  width: (MediaQuery.of(context).size.width - 90) / 2,
                                  height: 170,
                                  padding: const EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      //couleur autours de la photo
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: AssetImage(info[i]["img"]),
                                        fit: BoxFit.cover
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: const Offset(5, 5),
                                            color: Color.AppColor.gradientSecond
                                                .withOpacity(0.5)),
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: const Offset(-5, -5),
                                            color: Color.AppColor.gradientSecond
                                                .withOpacity(0.5)),
                                      ]),
                                  child: Center(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        info[i]["title"],
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color
                                                .AppColor.homePageBackground5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
Container(
                                width:
                                    (MediaQuery.of(context).size.width - 90) /
                                        2,
                                height: 170,
                                margin: EdgeInsets.only(
                                    left: 30, bottom: 15, top: 15),
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //couleur autours de la photo
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(info[i]["img"]),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3,
                                          offset: Offset(5, 5),
                                          color: Color.AppColor.gradientSecond
                                              .withOpacity(0.1)),
                                      BoxShadow(
                                          blurRadius: 3,
                                          offset: Offset(-5, -5),
                                          color: Color.AppColor.gradientSecond
                                              .withOpacity(0.1)),
                                    ]),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      info[i]["title"],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color
                                              .AppColor.homePageBackground5),
                                    ),
                                  ),
                                ),
                              ),
* */