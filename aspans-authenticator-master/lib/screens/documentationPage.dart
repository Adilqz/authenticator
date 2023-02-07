import 'package:flutter/material.dart';


class documentationPage extends StatefulWidget {
  documentationPage({Key? key}) : super(key: key);

  @override
  _documentationPageState createState() => _documentationPageState();
}

class _documentationPageState extends State<documentationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Документация',
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
                    Text('Условия использования', style: TextStyle(fontSize: 16),),
                    Icon(Icons.arrow_forward_ios, size: 16,),
                  ],
                ),
                onTap: () {
                 
                },
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Политика конфиденциальности', style: TextStyle(fontSize: 16),),
                    Icon(Icons.arrow_forward_ios, size: 16,),
                  ],
                ),
                onTap: () {
                  
                },
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Юридические уведомления', style: TextStyle(fontSize: 16),),
                    Icon(Icons.arrow_forward_ios, size: 16,),
                  ],
                ),
                onTap: () {
                 
                },
              ),
            ],
          ),
        ),
    );
  }
}