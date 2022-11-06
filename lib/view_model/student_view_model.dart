import 'package:get/get.dart';
import '../model/student_model.dart';
import '../repository/student_repository.dart';

class StudentViewModel extends GetxController{
  var allStudent = <StudentModel>[].obs;

  final StudentRepository studentRepository=Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllStudent();
  }

  fetchAllStudent() async{
    var student = await studentRepository.getStudent();
    allStudent.value = student;
  }

  addStudent(StudentModel studentModel){
    studentRepository.add(studentModel);
    fetchAllStudent();
  }

  updateStudent(StudentModel studentModel){
    studentRepository.update(studentModel);
    fetchAllStudent();
  }

  deleteStudent(int id){
    studentRepository.delete(id);
    fetchAllStudent();
  }

}