import 'package:flutter/material.dart';
import 'cakeitems.dart';

// importing global variables
import 'globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// function to naviagte from one page to another
  navigateToNextPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CakeItems()));
  }

  // function to attain the input from use in the text field
  final nameController = TextEditingController();

  void listenToInput() {
    globals.name = nameController.text.trim();
  }

  @override
  void initState() {
    super.initState();
    // listens to the user input
    nameController.addListener(listenToInput);
  }

  @override
  void dispose() {
    // disposes the namecontroller
    nameController.dispose();
    super.dispose();
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
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(
                      top: 35, left: 16, right: 16, bottom: 16),
                  child: const Text(
                    globals.homePageTitle,
                    style: TextStyle(
                        fontSize: globals.primaryFontSize,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 25),
                  child: const Text(
                    globals.homePagetextOne,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: globals.secondaryFontSize,
                        fontWeight: FontWeight.w400),
                  )),
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      top: 30, left: 16, right: 16, bottom: 16),
                  child: const Text(
                    globals.homePagetextTwo,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: globals.paragraphFontSize,
                        fontWeight: FontWeight.w300),
                  )),
              // get started section
              Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 36, top: 24),
                child: TextField(
                  controller: nameController,
                  style: const TextStyle(
                      fontSize: globals.paragraphFontSize,
                      fontWeight: FontWeight.w400),
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
              ),

              // button
              Container(
                  child: globals.buttonWidget(
                      " proceed ", navigateToNextPage, Colors.black))
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
