import 'package:cloud_firestore/cloud_firestore.dart';

create(String colName, docName, name, email, age) async {
  await FirebaseFirestore.instance
      .collection(colName)
      .doc(docName)
      .set({'name': name, 'email': email, 'age': age});
  print('Data Created');
}

update(String? colName, docName, key, var newValue) async {
  await FirebaseFirestore.instance
      .collection(colName!)
      .doc(docName)
      .update({key: newValue});
  print('Data Updated');
}

delete(String colName, docName) async {
  await FirebaseFirestore.instance.collection(colName).doc(docName).delete();
  print('Data Deleted');
}
