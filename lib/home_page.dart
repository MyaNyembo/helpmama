import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:monapp/DemoApp.dart';
import 'package:monapp/infoAlimentation.dart';
import 'package:monapp/settings.dart';
import 'package:monapp/widget/evolution_widget.dart';
import 'package:monapp/widget/information_widget.dart';

import 'InfoHabillement.dart';
import 'bebe.dart';
import 'values/values.dart' as Color;

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              tooltip: "Paramètres",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Settings())
                );
              },
              icon: Icon(
                Icons.settings_rounded,
                size: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
          title: Text(
            "HelpMama",
            style: GoogleFonts.pacifico(
              textStyle: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: const EvolutionWidget(),
                flex: 0,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                flex: 1,
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    InformationWidget(photo: "", onclick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const InfoAlimentation())
                      );
                    },),
                    const SizedBox(height: 8.0,),
                    InformationWidget(photo: "", onclick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const InfoHabillement())
                      );
                    },),
                    const SizedBox(height: 8.0,),
                    InformationWidget(photo: "", onclick: () {},),
                    const SizedBox(height: 8.0,),
                    InformationWidget(photo: "", onclick: () {},),
                    const SizedBox(height: 8.0,),
                    InformationWidget(photo: "", onclick: () {},),
                    const SizedBox(height: 8.0,),
                  ],
                ),
              ))
            ],
          ),
        ));
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
