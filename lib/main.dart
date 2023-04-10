// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = [];
    controllers.add(TextEditingController(text: "A"));
    controllers.add(TextEditingController(text: "B"));
    controllers.add(TextEditingController(text: "C"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controllers.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                                child: TextField(
                                    controller: controllers[index],
                                    decoration: const InputDecoration(
                                      hintText: '(e.g. Road washout 8 miles in.)',
                                    ),
                                    onChanged: (text) {
                                      setState(() {
                                        if (index == controllers.length - 1) {
                                          controllers.add(TextEditingController(text: ""));
                                        }
                                      });
                                    }
                                )
                            ),
                            Flexible(
                                flex: 0,
                                child: index == 0 ? const SizedBox.shrink() : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      controllers.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  color: Colors.red,
                                )
                            )
                          ],
                        );
                      }
                  )
                ]
            )
        ));
  }
}
