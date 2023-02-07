import 'package:aspans_authenticator/models/account_list.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:aspans_authenticator/widget/profileWidget.dart';
import 'package:aspans_authenticator/widget/numbersWidget.dart';
import 'package:aspans_authenticator/widget/buttonWidget.dart';


class myProfilePage extends StatefulWidget {
  myProfilePage({Key? key}) : super(key: key);

  @override
  _myProfilePageState createState() => _myProfilePageState();
}

class _myProfilePageState extends State<myProfilePage> {

  final double coverHeight = 280;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black, onPressed:() {
          setState(() {
                    
                  });
                  // Get.to(mainPage());
                  
                  Future.delayed(Duration.zero, () {
                    Navigator.pop(context);
                  });
        } ,),
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          profileWidget(
            
            onClicked: () {

            },
          ),
          const SizedBox(height: 24,),
          buildNameSur(),
          const SizedBox(height: 24,),
          Center(child: buildButton(),),
          const SizedBox(height: 24,),
          const numbersWidget(),
          const SizedBox(height: 48,),
          buildAbout(),
        ],
      )
    );
  }


  Widget buildNameSur() => Column(
    children: [
      Text('Nariman Krutoyev', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
      const SizedBox(height: 4,),
      Text('krutoinariman@aspans.com', style: TextStyle(color: Colors.grey),)
    ],
  );


  Widget buildButton() => buttonWidget(
    text: 'Пример функционала',
    onClicked: () {},
  );

  Widget buildAbout() => Container(
    padding: EdgeInsets.symmetric(horizontal: 34),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'About',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16,),
      Text(
        'Благодаря высокому уровню Вашего профессионализма нам совместно удается выполнять такую важную миссию – вносить свою лепту в успешное развитие экономики нашего города и страны!',
        style: TextStyle(fontSize: 16, height: 1.4),
      ),
    ],
  )
  );
}

