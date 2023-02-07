import 'package:aspans_authenticator/models/account_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names


Widget DomainCard(domain, key, seconds, maxSeconds) {
  
  return Container(
    child: Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(domain,
                style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.normal)),
            // IconButton(onPressed: () {
              
            // }, icon: Icon(Icons.delete, color: Colors.teal,)),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Row(
          children: [
            Text(
              key,
              style: TextStyle(
                  fontSize: 40, color: Colors.blueAccent, fontFamily: 'Lato', fontWeight: FontWeight.w300),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: CircularProgressIndicator(

                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(Colors.teal),
                strokeWidth: 20,
                value: 83/100,
                
              ),
              height: 10,
              width: 20,
              
            )
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 8)),
        Divider(
          color: Colors.black38,
        ),
      ],
    ),
  );
}

buildTimer(var seconds, maxSeconds) {
  return CircularProgressIndicator(
    value: seconds / maxSeconds,
    valueColor: AlwaysStoppedAnimation(Colors.white),
    strokeWidth: 12,
    backgroundColor: Colors.teal,
  );
}
