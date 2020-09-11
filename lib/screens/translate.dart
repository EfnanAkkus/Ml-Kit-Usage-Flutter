import 'package:flutter/material.dart';
import 'package:huawei_ml/translate/ml_translator_client.dart';
import 'package:huawei_ml/translate/ml_translator_settings.dart';
import 'package:huawei_ml/helpers/translate_helpers.dart';

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController controller = TextEditingController();

  MlTranslatorSettings settings;
  String _translateResult = "Translation result will be here";

  @override
  void initState() {
    settings = new MlTranslatorSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Translate"),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.6)),
                    color: Colors.white),
                child: TextField(
                  controller: controller,
                  maxLines: 5,
                  decoration: InputDecoration(
                      labelText: "Source text goes here",
                      border: InputBorder.none),
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(.6)),
                  color: Colors.white),
              child: Text(_translateResult),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: RaisedButton(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Start Translation"),
                  onPressed: _startRecognition,
                )),
          ],
        ),
      ),
    ));
  }

  _startRecognition() async {
    settings.sourceLangCode = MlTranslateLanguageOptions.English;
    settings.sourceText = controller.text;
    settings.targetLangCode = MlTranslateLanguageOptions.Turkish;
    try {
      final String result =
          await MlTranslatorClient.getTranslateResult(settings);
      setState(() {
        _translateResult = result;
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
