import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'values/values.dart' as Color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {


  List Videoinfo=[

      {
        "title": "",
        "time": "45 seconds",
        "thumbnail":" embed/squat1.jpg",
        "videoUrl": "http..."
      },

      {
        "title": "",
        "time": "45 seconds",
        "thumbnail":" embed/squat1.jpg",
        "videoUrl": "http..."
      },

      {
        "title": "",
        "time": "45 seconds",
        "thumbnail":" embed/squat1.jpg",
        "videoUrl": "http..."
      },

      {
        "title": "",
        "time": "45 seconds",
        "thumbnail":" embed/squat1.jpg",
        "videoUrl": "http..."
      },

      {
        "title": "",
        "time": "45 seconds",
        "thumbnail":" embed/squat1.jpg",
        "videoUrl": "http..."
      },

      {
        "title": "",
        "time": "45 seconds",
        "thumbnail":" embed/squat1.jpg",
        "videoUrl": "http..."
      },

      {
        "title": "",
        "time": "45 seconds",
        "thumbnail":" embed/squat1.jpg",
        "videoUrl": "http..."
      },

      {
        "title": "",
        "time": "45 seconds",
        "thumbnail":" embed/squat1.jpg",
        "videoUrl": "http..."
      },

      {
        "title": "",
        "time": "45 seconds",
        "thumbnail":" embed/squat1.jpg",
        "videoUrl": "http..."
      },

      {
        "title": "",
        "time": "45 seconds",
        "thumbnail":" embed/squat1.jpg",
        "videoUrl": "http..."
      }
    ];


  /*_initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      info= json.decode(value);
    });
  }*/

  @override
  void initState(){
  super.initState();
  //_initData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.AppColor.gradientFirst.withOpacity(0.9),
              Color.AppColor.gradientSecond
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding:  const EdgeInsets.only(top: 70,left: 30, right: 30),
              width:  MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap:(){
                         Get.back();
                        },
                          child: Icon(Icons.arrow_back_ios, size: 20 ,color:Colors.white,)),
                          Expanded(child: Container()),
                          Icon(Icons.info_outline, size: 20 ,color:Colors.white,),// espace entre les deux icons

                    ],
                  ),
                  SizedBox(height: 30,),
                  Text(
                    "joyeux de vous voir",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.AppColor.homePageBackground11),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "and Gluttes workout",
                    style: TextStyle(fontSize: 25, color: Color.AppColor.homePageBackground11),),
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.AppColor.homePageBackground9,
                              Color.AppColor.homePageBackground12,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer,size: 20, color:  Color.AppColor.homePageBackground8,),
                            SizedBox(width:5,),
                            Text("68 min",style: TextStyle(
                                fontSize: 16,
                                color: Color.AppColor.homePageBackground8
                            ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color.AppColor.homePageBackground9,
                                Color.AppColor.homePageBackground12,
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.handyman_outlined,size: 20, color:  Color.AppColor.homePageBackground8,),
                            SizedBox(width:5,),
                            Text(" votre journee",style: TextStyle(
                                fontSize: 16,
                                color: Color.AppColor.homePageBackground8
                            ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: Container(decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(70),
              )
            ),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      SizedBox(width: 30,),
                      Text(
                        "Circuit 1: Legs Toning",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.AppColor.homePageBackground3,
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(Icons.loop,size: 30,color: Color.AppColor.homePageBackground2,),
                          SizedBox(width: 10,),
                          Text(
                            " 3 sets",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.AppColor.homePageBackground8,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 20,),
                    ],
                  )
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
