import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Home extends StatelessWidget {
  final String nama;
  final String npm;
  const Home({
    Key? key,
    required this.nama,
    required this.npm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: const Color(0xFFC8C8C8),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        npm,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}