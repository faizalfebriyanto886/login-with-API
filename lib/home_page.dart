import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data;
  Future<dynamic> getData () async {
    final DocumentReference documents = FirebaseFirestore.instance.collection('login').doc('zrY29hISGdolfzKjVILp');

    await documents.get().then<dynamic>((DocumentSnapshot snapshot) async {
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
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.black
          ),  
        ),
        backgroundColor: const Color(0xFFC8C8C8),
      ),
      body: Center(
        child: CardScreen(
          nama: data['nama'] ?? '',
          npm: data['npm'] ?? '',
        ),
      ),
    );
  }
}

class CardScreen extends StatelessWidget {
  final String nama;
  final String npm;
  const CardScreen({
    Key? key,
    required this.nama,
    required this.npm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.network(
          'https://assets6.lottiefiles.com/packages/lf20_toc5zbpc.json',
          width: 200,
        ),
        Card(
        color: const Color(0xFFC8C8C8),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.white70,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(55),
            child: Column(
              children: <Widget>[
                Text(
                  nama,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  npm,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )

        )
      ],
    );
  }
}