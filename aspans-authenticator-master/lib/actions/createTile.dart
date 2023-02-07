import 'package:flutter/material.dart';
import 'dart:async';
import 'package:aspans_authenticator/screens/mainPage.dart';
import 'dart:math';
import 'package:aspans_authenticator/screens/addAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';

addTile(var email) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  
}


// randomNumber() {
    
//       Random random = new Random();
//       int randomNumber = random.nextInt(5);
//       print('$randomNumber');
// }

// createTile(var seconds, maxSeconds) {
//   randomNumber();
//     return ListTile(
//       title: Text('trustedcoin.com',
//           style: TextStyle(
//               fontSize: 20,
//               color: Colors.black87,
//               fontWeight: FontWeight.normal)),
//       contentPadding: EdgeInsets.all(16.0),
//       horizontalTitleGap: 56,
//       subtitle: Text(
//         '$randomNumber',
//         style: TextStyle(fontSize: 40, color: Colors.blueAccent),
//       ),
//       trailing: CircularProgressIndicator(
//         // backgroundColor: Colors.greenAccent,
//         // value: 50/50,
//         valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
//         strokeWidth: 8,
//         value: seconds / maxSeconds,
//         backgroundColor: Colors.white,
//       ),
//       isThreeLine: true,
//     );

    
//   }