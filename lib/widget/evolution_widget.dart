import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bebe.dart';
import '../values/values.dart';

class EvolutionWidget extends StatefulWidget {
  const EvolutionWidget({Key? key}) : super(key: key);

  @override
  State<EvolutionWidget> createState() => _EvolutionWidgetState();
}

class _EvolutionWidgetState extends State<EvolutionWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/s2.jpeg"),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        tooltip: "Plus des détails",
                        onPressed: () {
                          // on click bebe page ...
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InfoBebe()));
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )),
                    SizedBox(width: 8.0),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [],
            ),
          ),
          Row(
            children: [
              Chip(label: Text("2 Semaines", style: GoogleFonts.inter(),), avatar: Icon(Icons.calendar_month),),
              const SizedBox(width: 8.0,),
              Chip(label: Text("200 cm")),
              const SizedBox(width: 8.0,),
              Chip(label: Text("200 cm")),
            ],
          )
        ],
      ),
    );
  }
}
