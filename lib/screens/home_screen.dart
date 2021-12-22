import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qr_scanner/screens/qr_scan_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16 * 8),
                    child: Text(
                      "Welcome To",
                      style: TextStyle(
                        color: Color(0xFF474747),
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  const SizedBox(height: 16 / 2),
                  const Text(
                    "Easy QR Code Scanner",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A2A2),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                  const SizedBox(height: 100),
                  _buildContinueBtn(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueBtn() {
    return RawMaterialButton(
      splashColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFEE41A3),
              Color(0xFFAE2AE5),
            ],
            stops: [0.1, 0.7],
          ),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        // : BoxDecoration(
        //     color: kDisableColor,
        //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //   ),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 310.0,
          ), // min sizes for Material buttons
          alignment: Alignment.center,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Scan Now',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
      onPressed: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const QRScanScreen(),
        ),
      ),
    );
  }
}
