import 'dart:convert';

import 'package:babuland/services/moc_ticket_services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../models/moc_ticket_model.dart';

class DashboardController extends GetxController{
  final isLoading = true.obs;
  final mocTicketList = <Item>[].obs;

  @override
  void onInit(){
    Future.delayed(const Duration(seconds: 1),(){
      FlutterNativeSplash.remove();
    });
    super.onInit();
  }



  //get all Moc ticket
  void getAllMocTicket()async{
    var response = await MocTicketServices.getMocTickets();

    try{
      isLoading.value = true;
      var jsonResponse = json.decode(response.body);
      if(response.statusCode == 200){
        isLoading.value = false;

        if(jsonResponse['items'] != null){
          //print("Items: "+jsonResponse['items'].toString());

          final mocTicketModel = mocTicketModelFromJson(response.body);

          mocTicketList.clear();

          mocTicketList.addAll(mocTicketModel.items!.toList());

          //print("mocTicketListLength: "+mocTicketList.length.toString());
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
      print("=======DashboardController===========getAllMocTicket()==================="+e.toString());
    }
  }
}