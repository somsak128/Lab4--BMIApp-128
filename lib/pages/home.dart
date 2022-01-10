import 'package:bmi_app/pages/bmi_main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              menuHeader(),
              
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 1, 20, 350),
                child: Text(
                  'ยินดีต้อนรับเข้าสู่ \n แอปพลิเคชันคำนวณ BMI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              bottomBtn(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox bottomBtn() {
    return SizedBox(
      width: 230,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: ElevatedButton(
          onPressed: () {
            var route = MaterialPageRoute(
                  builder: (context) => const bmimain(),
                  );
                  Navigator.push(context, route);
          },
          child: const Text(
            'เริ่มต้นใช้งาน',
            style: TextStyle(fontSize: 20),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(300),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.yellow[600]),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ),
    );
  }


  Row menuHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.help),
          label: const Text('ความช่วยเหลือ'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        Container(
          width: 2,
          height: 20,
          color: Colors.grey,
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.info),
          label: const Text('เกี่ยวกับแอป'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ],
    );
  }
}
