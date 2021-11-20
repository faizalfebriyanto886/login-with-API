import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:login_by_php/home_page.dart';
import 'package:login_by_php/register_page.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  dynamic data;

  Future<dynamic> getData() async {
    final DocumentReference dataLogin = FirebaseFirestore.instance.collection('login').where('email', isEqualTo: _emailController).snapshots() as DocumentReference<Object?>;

    await dataLogin.get().then<dynamic>((DocumentSnapshot snapshot) {
      setState(() {
        data = snapshot.data();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_rszcjj5i.json',
                  fit: BoxFit.cover
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 450),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.email_outlined,
                        ) 
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.password_outlined,
                        )
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          'Apakah anda sudah punya akun ?',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                          },
                          child: Text(
                            'Daftarkan',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[400]
                            ),
                          )
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child:  ElevatedButton(
                        onPressed: () {
                          if (data['email'] != null && data['password'] != null) {
                            _emailController.text = data['email'] ?? '';
                            _passwordController.text = data['password'] ?? '';
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                          } else  {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.info,
                              text: 'Silahkan cek email dan password !!'
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          elevation: 15.0
                        ),
                        child:  const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}