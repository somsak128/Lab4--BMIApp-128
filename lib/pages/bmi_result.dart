// ignore_for_file: avoid_unnecessary_containers, unnecessary_const, camel_case_types

import 'package:flutter/material.dart';

class resuit extends StatefulWidget {
  const resuit({ Key? key,this.height, this.weight}) : super(key: key);

  
  final String? height;
  final String? weight;
  

  @override
  _resuitState createState() => _resuitState();
}

class _resuitState extends State<resuit> {

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  double? _bmi;

  String _message = 'Please enter your height an weight';

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

     setState(() {
      _bmi = (widget.weight! / (widget.height! * widget.height));
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
}
