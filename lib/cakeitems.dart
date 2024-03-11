import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'showcakedetails.dart';

class CakeItems extends StatefulWidget {
  const CakeItems({super.key});

  @override
  State<CakeItems> createState() => _CakeItemsState();
}

class _CakeItemsState extends State<CakeItems> {
  nextPage(String title, String image, String description) {
    // navigate to next page
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ShowCakeDetails(
              description: description, imageUrl: image, title: title)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: globals.primaryColor,
          title: const Text(
            globals.appName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(
                        top: 35, left: 16, right: 16, bottom: 16),
                    child: Text(
                      globals.welcomeMessage,
                      style: const TextStyle(
                          fontSize: globals.primaryFontSize,
                          fontWeight: FontWeight.bold),
                    )),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: globals.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Flexible(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 16),
                            child: Text(
                              globals.items[index]['title'],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: globals.secondaryFontSize,
                                  color: Color.fromARGB(255, 16, 16, 16),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Stack(children: [
                            Image.network(globals.items[index]['image'],
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.cover),
                            Container(
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.bottomRight,
                              child: globals.buttonWidget('discover', () {
                                nextPage(
                                    globals.items[index]['title'],
                                    globals.items[index]['image'],
                                    globals.items[index]['description']);
                              }, Colors.black),
                            )
                          ])
                        ],
                      ),
                    );
                  },
                )
              ],
            )));
  }
}
