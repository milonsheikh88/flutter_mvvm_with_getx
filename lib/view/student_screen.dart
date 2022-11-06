import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/student_model.dart';
import '../view_model/student_view_model.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final  StudentViewModel studentViewModel=Get.find();

  final nameController = TextEditingController();
  int? studentId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter MVVM with GetX"),
        ),
        body: Obx(
          () => Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Enter name'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          if (nameController.text != "") {
                            studentViewModel.addStudent(StudentModel(id: null, name: nameController.text));
                            nameController.text = "";
                          }
                        },
                        child: const Text("Add")),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (nameController.text != "") {
                            studentViewModel.updateStudent(StudentModel(id: studentId, name: nameController.text));
                            nameController.text = "";
                          }
                        },
                        child: const Text("Update"))
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: studentViewModel.allStudent.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              studentId = studentViewModel.allStudent[index].id!;
                              nameController.text = studentViewModel.allStudent[index].name!;
                            },
                            child: Card(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(studentViewModel.allStudent[index].name!),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        studentViewModel.deleteStudent(studentViewModel.allStudent[index].id!);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 32,
                                      ))
                                ],
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
