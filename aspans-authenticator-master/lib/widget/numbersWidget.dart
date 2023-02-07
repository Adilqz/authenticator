

import 'package:flutter/material.dart';


class numbersWidget extends StatelessWidget {
  const numbersWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      buildButton(context, '4.5', 'Стаж'),
      buildDivider(),
      VerticalDivider(),
      buildButton(context, '34', 'Пример'),
      buildDivider(),
      buildButton(context, '28', 'Текста'),
    ],
  ),);

  Widget buildDivider() => const SizedBox(
    height: 24,
    child: VerticalDivider()
,
  );

  Widget buildButton(BuildContext context, String value, String text) => MaterialButton(
    padding: EdgeInsets.symmetric(vertical: 4),
    onPressed: () {},
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        SizedBox(height: 2,),
        Text(text, style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    ),
  );
  
}