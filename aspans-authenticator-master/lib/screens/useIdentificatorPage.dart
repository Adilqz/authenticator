import 'package:flutter/material.dart';


class useIdentificatorPage extends StatefulWidget {
  useIdentificatorPage({Key? key}) : super(key: key);

  @override
  _useIdentificatorPageState createState() => _useIdentificatorPageState();
}

class _useIdentificatorPageState extends State<useIdentificatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Идентификатор',
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
          padding: EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Идентификатор использования Google - это текст, который отправляется в Google вместе с данными об использовании наих сервисов. С их помощью нельзя установить вашу личность или найти ваш аккаунт Google', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20,),
                  Text('Ваше устройство отправляет в Google данные о работе сервисов, что позволяет нам совершенствовать их. Чтобы узнать, как Google обеспечивает безопасность ваших данных, ознакомьтесь с Политикой конфиденциальности.', style: TextStyle(fontSize: 16))
                ],
              ),
              TextButton(
                child: Text('СБРОСИТЬ ИД ИСПОЛЬЗОВАНИЯ', style: TextStyle(fontSize: 16, color: Colors.blueAccent),),
                onPressed: () {
                  showAlertDialog(context);
                },
                
              ),
            ],
          ),
          margin: EdgeInsets.only(bottom: 40),
        ),
    );
  }
}

showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("ДА"),
    onPressed:  () {
       Navigator.of(context).pop();
      showAlertStatus(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text("НЕТ"),
    onPressed:  () {
       Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("Сбросить ИД использования Google?"),
    content: Text("Сбросить ИД использования Google?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertStatus(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("ОК"),
    onPressed: () {
       Navigator.of(context).pop();
        
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("My title"),
    content: Text("Идентификатор сброшен"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}