import 'package:flutter/material.dart';

class InformationWidget extends StatefulWidget {

  final String photo;
  final Function()? onclick;

  const InformationWidget({Key? key, required this.photo, this.onclick}) : super(key: key);

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onclick,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          width: double.infinity,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          bottomLeft: Radius.circular(16.0)),
                      image: DecorationImage(
                          image: AssetImage(widget.photo),
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0)),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8.0,),

            ],
          ),
        ),
      ),
    );
  }
}
