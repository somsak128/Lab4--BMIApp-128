// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, duplicate_ignore, unnecessary_const, camel_case_types

import 'package:flutter/material.dart';

class bmimain extends StatefulWidget {
  const bmimain({ Key? key }) : super(key: key);

  @override
  _bmimainState createState() => _bmimainState();
}

class _bmimainState extends State<bmimain> {

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  double? _bmi;

  String _message = 'Please enter your height an weight';

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

     if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _message = "น้ำหนักน้อยเกินไป";
      } else if (_bmi! < 23) {
        _message = 'น้ำหนักปกติ';
      } else if (_bmi! < 25) {
        _message = 'น้ำหนักเกิน (ท้วม)';
      } else if (_bmi! < 30) {
        _message = 'อ้วนระดับ 1 (อ้วนระยะเริ่มต้น)';
      } else if (_bmi! < 40) {
        _message = 'อ้วนระดับ 2 (อ้วนมาก)';
      }else if (_bmi! > 40) {
        _message = 'อ้วนระดับ 3 (อ้วนระดับรุนแรงมาก)';
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: AppBar(
        title: const Text('BMI PAGE',style: const TextStyle(fontSize: 20,color: Colors.white),),
      ),
      body: Center(
          child: Container(
            decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/1.png'),
              fit: BoxFit.cover,
            )),
            child: Center(
              
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 2, 10, 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.android_sharp,size: 200,color: Colors.amber[600],),

                    Height(),
                    const SizedBox(height:10),
                    Weight(),
                    
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: _calculate,
                        child: const Text('Calculate'),
                      
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(300),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.amber[400]),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height:40),
                    Container(
                      child: Text(
                        _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 50,color: Colors.white),
                        textAlign: TextAlign.center,
                        
                      ),
                    ),
                    const SizedBox(height:40),
                    Container(
                      child: Text(
                        _message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ),
        ),
      );
  }

  TextField Weight() {
    return TextField(
                    controller: _weightController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    
                    decoration: const InputDecoration(
                    labelText: 'Weight (kg)',
                    prefixIcon: Icon(Icons.line_weight_rounded),
                    
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0
                      ),
                    ),
                  ),
                  );
  }

  // ignore: non_constant_identifier_names
  TextField Height() {
    return TextField(
                    controller: _heightController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Height (m)',
                    prefixIcon: Icon(Icons.height_rounded),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0
                      ),
                    ),
                  ));
  }
}