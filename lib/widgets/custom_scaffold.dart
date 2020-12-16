// custom appbar

import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  CustomScaffold({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          /* 
        SafeArea untuk memposisikan widget didalamnya pada lokasi yang aman dari
        status bar atau notch dari device
      */
          SafeArea(
              child:
                  /* 
            susunan layoutnya tumpukan(stack) dengan nilai argumen
            body ditumpukan paling bawah
          */
                  Stack(
        /*
                      children kedua stack atau di atas body disusun custom
                      appbar-nya. App bar ini menggunakan komponen material Card
                    */
        children: [
          body,
          _buildShortAppBar(context),
        ],
      )),
    );
  }
}

Widget _buildShortAppBar(BuildContext context) {
  return Card(
    margin: EdgeInsets.all(0), //menghilangkan margin bawaan dari Wdget Card
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            'N',
            style: Theme.of(context).textTheme.headline6,
          ),
        )
      ],
    ),
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(16.0),
      ),
    ),
  );
}
