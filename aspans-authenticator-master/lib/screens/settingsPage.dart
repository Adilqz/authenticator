import 'package:flutter/material.dart';
import 'package:aspans_authenticator/screens/confidentialityPage.dart';
import 'package:aspans_authenticator/screens/useIdentificatorPage.dart';

class settingsPage extends StatefulWidget {
  settingsPage({Key? key}) : super(key: key);

  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Настройки',
            style: TextStyle(color: Colors.black87, fontSize: 20),
          ),
          centerTitle: true,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              setState(() {});
              // Get.to(mainPage());

              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Column(
            children: [
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Экран конфиденциальности', style: TextStyle(fontSize: 16),),
                    Icon(Icons.arrow_forward_ios, size: 16,),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => confidentialityPage()));
                },
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Идентификатор использования Google', style: TextStyle(fontSize: 16),),
                    Icon(Icons.arrow_forward_ios, size: 16,),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => useIdentificatorPage()));
                },
              ),
            ],
          ),
        ));
  }
}
