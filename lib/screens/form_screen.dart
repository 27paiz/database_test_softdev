import 'package:flutter/material.dart';
import 'package:flutter_database/models/Transactions.dart';
import 'package:flutter_database/providers/transaction_provider.dart';
import 'package:flutter_database/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  // controller
  final nameController = TextEditingController(); //รับค่าชื่อ
  final addressController = TextEditingController(); //รับค่าที่อยู่
  final tphoneController = TextEditingController(); //รับค่าเบอร์โทรศัพท์
  final emailController = TextEditingController(); //รับค่าอีเมลล์
  final passwordController = TextEditingController(); //รับค่ารหัสผ่าน
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Enter information"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "Name"),
                  autofocus: false,
                  controller: nameController,
                  validator: (String str) {
                    //ชื่อเป็นค่าว่าง
                    if (str.isEmpty) {
                      return "Enter your name.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Address"),
                  autofocus: false,
                  controller: addressController,
                  validator: (String str) {
                    //ที่อยู่เป็นค่าว่าง
                    if (str.isEmpty) {
                      return "Enter your address.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "phone"),
                  autofocus: false,
                  controller: tphoneController,
                  validator: (String str) {
                    //เบอร์โทรศัพท์เป็นค่าว่าง
                    if (str.isEmpty) {
                      return "Enter your phone.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Email"),
                  autofocus: false,
                  controller: emailController,
                  validator: (String str) {
                    //อีเมล์เป็นค่าว่าง
                    if (str.isEmpty) {
                      return "Enter your email.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Password"),
                  autofocus: false,
                  controller: passwordController,
                  validator: (String str) {
                    //รหัสผ่านเป็นค่าว่าง
                    if (str.isEmpty) {
                      return "Enter your password.";
                    }
                    return null;
                  },
                ),
                FlatButton(
                  child: Text("Add"),
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      var name = nameController.text;
                      var address = addressController.text;
                      var tphone = tphoneController.text;
                      var email = emailController.text;
                      var password = passwordController.text;
                      //เตรียมข้อมูล
                      Transactions statement = Transactions(
                          name: name,
                          address: address,
                          tphone: double.parse(tphone),
                          email: email,
                          password: password,
                          date: DateTime.now()); //object

                      //เรียก Provider
                      var provider = Provider.of<TransactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statement);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) {
                                return MyHomePage();
                              }));
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
