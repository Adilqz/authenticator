import 'package:flutter/material.dart';
import 'package:aspans_authenticator/screens/sideBar.dart';
import 'package:aspans_authenticator/screens/accountTwoExport.dart';

class accountExport extends StatefulWidget {
  const accountExport({ Key? key }) : super(key: key);

  @override
  _accountExportState createState() => _accountExportState();
}

class _accountExportState extends State<accountExport> {
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 34),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
            Icon(Icons.download, color: Colors.blueAccent, size: 34,),
            SizedBox(height: 24,),
            Text('Экспорт аккаунтов', style: TextStyle(fontSize: 24),),
            SizedBox(height: 24,),
            Text('Переносите аккаунты на другое устройство. За один раз можно экспортировать один или несколько аккаунтов.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
          ],
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 25),
              // decoration: BoxDecoration(
              //   color: Colors.blueAccent
              // ),
              child: TextButton(
                
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5, bottom: 5),
                primary: Colors.white,
                textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                
                backgroundColor: Colors.blueAccent
              ),
              onPressed: () {
                Navigator.push(context,
                      MaterialPageRoute(builder: (context) => accountTwoExport()));
              }, 
              child: Text('Продолжить'),
              
            ),
            )
          ],
        )
          ],
        )
      )
    );
  }
}