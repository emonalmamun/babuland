import 'package:babuland/views/my_ticket_page/controller/my_ticket_controller.dart';
import 'package:get/get.dart';

class MyTicketBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyTicketController());
  }

}