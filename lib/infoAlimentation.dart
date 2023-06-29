import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monapp/Textealimentation.dart';
import 'package:monapp/values/values.dart';
import 'package:monapp/widget/image_information_widget.dart';

class InfoAlimentation extends StatefulWidget {
  const InfoAlimentation({Key? key}) : super(key: key);

  @override
  State<InfoAlimentation> createState() => _InfoAlimentationState();
}

class _InfoAlimentationState extends State<InfoAlimentation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageInformationWIdget(photo: "assets/femmeEnceintebelle.jpg"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("1.Pourquoi bien manger", style: GoogleFonts.inter(fontSize: 30, color: AppColor.homePageBackground3)),
                    SizedBox(height: 12,),
                    Text(TextesAlimentation().body,style: GoogleFonts.inter(fontSize: 16),),
                    Text("1.Des conseils pour bien manger pendant la grossesse", style: GoogleFonts.inter(fontSize: 30, color: AppColor.homePageBackground3)),
                    SizedBox(height: 12,),
                    Text(TextesAlimentation().ortega,style: GoogleFonts.inter(fontSize: 16),),


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
