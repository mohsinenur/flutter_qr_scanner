import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ResultScreen extends StatefulWidget {
  final String result;
  const ResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF474747),
            ),
            iconSize: 24.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Result",
                style: TextStyle(
                  color: Color(0xFF474747),
                  fontWeight: FontWeight.w400,
                  fontSize: 32.0,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "QR Code Details:",
                style: TextStyle(
                  color: Color(0xFFA2A2A2),
                  fontWeight: FontWeight.w200,
                  fontSize: 14.0,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.result,
                style: const TextStyle(
                  color: Color(0xFF5E6167),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
