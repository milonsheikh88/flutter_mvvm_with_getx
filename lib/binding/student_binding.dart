import 'package:get/instance_manager.dart';

import '../data/db_helper.dart';
import '../repository/student_repository.dart';
import '../view_model/student_view_model.dart';

class StudentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StudentViewModel());
    Get.lazyPut(() => StudentRepository());
    Get.lazyPut(() => DBHelper());
  }
}