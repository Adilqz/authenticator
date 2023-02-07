import 'package:flutter/material.dart';


class confidentialityPage extends StatefulWidget {
  confidentialityPage({Key? key}) : super(key: key);

  @override
  _confidentialityPageState createState() => _confidentialityPageState();
}

class _confidentialityPageState extends State<confidentialityPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Экран конфиденциальности',
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
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Экран конфиденциальности', style: TextStyle(fontSize: 16),),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                  
                ],
              ),
              Text('Когда экран конфиденциальности включен, доступ к этому приложению ограничивается с помощью код-пароля.', style: TextStyle(fontSize: 14),)
            ],
          ),
        )
    );
  }
}