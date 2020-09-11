/*
    Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'package:flutter/material.dart';
import 'package:mlkitflutter/screens/text.dart';
import 'package:mlkitflutter/widgets/custom_grid_element.dart';
import 'package:mlkitflutter/screens/translate.dart';
import 'package:mlkitflutter/screens/landmark.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("FLUTTER HMS ML Kit Demo",
              style: TextStyle(color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 230),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomGridElement(
                        name: "Text",
                        imagePath: "text",
                        page: TextRecognition()),
                    CustomGridElement(
                        name: "Translate",
                        imagePath: "trans",
                        page: TranslatePage()),
                    CustomGridElement(
                        name: "Landmark",
                        imagePath: "landmark",
                        page: LandmarkRecognitionPage()),
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
