import 'package:flutter/material.dart';
import 'package:petstore_test/Models/pet.api.dart';
import 'package:petstore_test/Views/Widgets/PetCard.dart';
import 'package:petstore_test/Views/Widgets/Widget_select_status.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.pets),
            SizedBox(
              width: MediaQuery.of(context).size.height / 15,
            ),
            Text('Pet Shop')
          ]),
        ),
        body: Column(
          children: [
            Pet_View(),
          ],
        ));
  }
}
