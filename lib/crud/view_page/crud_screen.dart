import 'package:flutter/material.dart';

class CRUDScreenWidget extends StatelessWidget {
  const CRUDScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('CRUD Screen'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('CRUD Oeration on cloud firestore',style: TextStyle(color: Colors.blue),),
            MaterialButton(
              onPressed: () {},
              child: Row(
                children:<Widget> [

                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
