import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _npm = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final firestoreAdd = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran'),
        backgroundColor: const Color(0xFF455A63),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _npm,
                    decoration: const InputDecoration(
                      labelText: 'NPM',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: _password,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF455A63),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        elevation: 15.0
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(70, 15, 70, 15),
                        child:Text(
                          'Daftar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      onPressed: () {
                        firestoreAdd.collection('login').add({
                          'nama': _name.text,
                          'npm': _npm.text,
                          'email': _email.text,
                          'password': _password.text,
                        }).then((value) {
                          CoolAlert.show(
                            context: context, 
                            type: CoolAlertType.success,
                            text: 'Data berhasil di tambahkan',
                            autoCloseDuration: const Duration(seconds: 3)  
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ]        
      ),
    );
  }
}