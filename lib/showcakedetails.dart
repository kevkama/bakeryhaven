import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class ShowCakeDetails extends StatelessWidget {
  const ShowCakeDetails(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl});
  final String title;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    void prevPage() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: globals.primaryColor,
          title: Text(
            title,
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
          child: Column(
        children: [
          // title
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 35, bottom: 16),
            child: Text(
              textAlign: TextAlign.left,
              title,
              style: const TextStyle(
                  fontSize: globals.primaryFontSize,
                  color: Color.fromARGB(255, 71, 71, 71),
                  fontWeight: FontWeight.bold),
            ),
          ),
          // image

          Image.network(imageUrl,
              height: 300, width: double.infinity, fit: BoxFit.cover),
          // description
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            child: Text(
              description,
              style: const TextStyle(
                  fontSize: globals.paragraphFontSize,
                  color: Color.fromARGB(255, 71, 71, 71),
                  fontWeight: FontWeight.w200),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: globals.buttonWidget('back', prevPage, globals.primaryColor),
          ),
        ],
      )),
    );
  }
}
