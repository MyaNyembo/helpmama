import 'package:flutter/material.dart';

class ImageInformationWIdget extends StatefulWidget {

  final String photo;

  const ImageInformationWIdget({Key? key, required this.photo}) : super(key: key);

  @override
  State<ImageInformationWIdget> createState() => _ImageInformationWIdgetState();
}

class _ImageInformationWIdgetState extends State<ImageInformationWIdget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(widget.photo)
        )
      ),
    );
  }
}
