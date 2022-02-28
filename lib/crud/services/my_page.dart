import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_with_firebase/crud/services/user_screen.dart';

import 'crud_function.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context,AsyncSnapshot<QuerySnapshot> petSnapshot) {
            if (petSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final petDocs = petSnapshot.data?.docs;

              return ListView.builder(

                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(petDocs![index]['age']),
                    title: Text(petDocs[index]['name']),
                    subtitle: Text(petDocs[index]['email']),
                    trailing: IconButton(onPressed:() async{
                     await   delete('users', petDocs[index].id );
                    },icon: Icon(Icons.delete)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserScreenPage(
                            userName: petDocs[index]['name'],
                            userEmail: petDocs[index]['email'],
                            age: petDocs[index]['age'],
                          ),
                        ),
                      );
                    },
                  );
                },
                itemCount: petDocs?.length,
              );
            }
          },
        ),
      ),
    );
  }
}
