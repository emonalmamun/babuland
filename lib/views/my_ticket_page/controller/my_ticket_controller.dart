import 'dart:convert';

import 'package:babuland/services/my_ticket_services.dart';
import 'package:get/get.dart';

import '../../../models/my_ticket_model.dart';

class MyTicketController extends GetxController{
  final isLoading = true.obs;
  final myTicketList = <Item>[].obs;

  final myTicketIndex = 0.obs;

  //get all My ticket
  void getAllMyTicket(int? pk)async{
    var response = await MyTicketServices.getMyTickets(pk);

    try{
      isLoading.value = true;
      var jsonResponse = json.decode(response.body);

      if(response.statusCode == 200){
        isLoading.value = false;

        if(jsonResponse['items'] != null){
          //print("Items: "+jsonResponse['items'].toString());

          final myTicketModel = myTicketModelFromJson(response.body);

          myTicketList.clear();

          myTicketList.addAll(myTicketModel.items!.toList());

          //print("myTicketListLength: "+myTicketList.length.toString());
        }else{
          isLoading.value = false;
          print("Items: "+jsonResponse['items'].toString());

        }

      }else{
        isLoading.value = false;
        print("Items: "+jsonResponse['items'].toString());
      }

    }on Exception catch(e){
      isLoading.value = false;
      print("=======MyTicketController===========getAllMyTicket()==================="+e.toString());
    }
  }
}