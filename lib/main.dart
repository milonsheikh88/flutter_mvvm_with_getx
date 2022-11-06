import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_mvvm_with_getx/view/student_screen.dart';

import 'binding/student_binding.dart';

void main() async{

  /** Initialize all controllers manually....*/
  WidgetsFlutterBinding.ensureInitialized();
  StudentBinding().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: StudentBinding(),
      title: 'Flutter MVVM with GetX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StudentScreen(),
    );
  }
}

