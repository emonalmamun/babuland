import 'package:babuland/services/my_ticket_services.dart';
import 'package:babuland/views/my_ticket_page/controller/my_ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyTicketPage extends StatelessWidget {
  final myTicketController = Get.find<MyTicketController>();
   MyTicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    myTicketController.getAllMyTicket(Get.arguments);
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        color: Colors.orange.shade50,
        child: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Obx((){
                      return myTicketController.isLoading.value?
                      Center(child: CircularProgressIndicator())
                          :
                      myTicketController.myTicketList.value.length > 0?
                      ListView.builder(
                        itemCount: myTicketController.myTicketList.length,
                        itemBuilder: (context,index) {
                          return InkWell(
                            onTap: (){
                              myTicketController.myTicketIndex.value = index;
                            },
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade200,
                                  borderRadius: BorderRadius.all(Radius.circular(0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 3,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      //color: Colors.grey,
                                      //borderRadius: BorderRadius.all(Radius.circular(20))
                                        border: Border(
                                          left: BorderSide(color: Colors.deepOrange, width: 5.0),
                                          top: BorderSide(color: Colors.green, width: 5.0),
                                          right: BorderSide(color: Colors.blue, width: 5.0),
                                          bottom: BorderSide(color: Colors.red, width: 5.0),
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                'assets/icons/logo_babuland.png',
                                                fit: BoxFit.contain,
                                              ),
                                              SizedBox(height: 10,),
                                              Text("Uttara"),
                                              Container(
                                                height: 1,
                                                width: 50,
                                                color: Colors.orange,
                                              ),
                                              Text("Wari"),
                                              Container(
                                                height: 1,
                                                width: 50,
                                                color: Colors.orange,
                                              ),
                                              Text("Badda"),
                                              Container(
                                                height: 1,
                                                width: 50,
                                                color: Colors.orange,
                                              ),
                                              Text("Mirpur"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text("Child Ticket",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                                              !myTicketController.myTicketList[index].pk!.isNegative?
                                              Text("SL NO: ${myTicketController.myTicketList[index].pk}")
                                                  :
                                              Text("Sl NO: 0",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                                              SizedBox(height: 10,),
                                              !myTicketController.myTicketList[index].qty!.isNegative?
                                              Text("Quantity: ${myTicketController.myTicketList[index].qty}", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red.shade700),)
                                                  :
                                              Text("Quantity: 0",style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red.shade700)),
                                              SizedBox(height: 10,),
                                              Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Center(
                                                      child: !myTicketController.myTicketList[index].mrp!.isNegative?
                                                      Text("Price: ${myTicketController.myTicketList[index].mrp} tk",style: TextStyle(color: Colors.white, fontSize: 16),)
                                                          :
                                                      Text("Price: 0",style: TextStyle(color: Colors.white, fontSize: 16)),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },)
                          :
                      Center(child: Text("No data!"));
                    }),
                  ),
                ),
            ),
            _myOrderDetails(),
          ],
        ),
      )
    );
  }

  _appBar(){
    return AppBar(
      backgroundColor: Colors.white70,
      title: Text("My Tickets",style: TextStyle(color: Colors.orange),),
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.chevron_left_sharp), color: Colors.orange,
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  _myOrderDetails(){
    return Obx((){
      return myTicketController.myTicketList.isEmpty?
      Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0,top: 5,right: 14,bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(height: 10,),
              Text("Scan QR code to avail ticket", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order ID",style: TextStyle(color: Colors.grey),),
                      Text("00000",style: TextStyle(color: Colors.orange),),
                      Text("Ticket Purchase Date",style: TextStyle(color: Colors.grey),),
                      Text("24/Oct/2022",style: TextStyle(color: Colors.orange),),
                      Text("Ticket Expire Date",style: TextStyle(color: Colors.grey),),
                      Text("None",style: TextStyle(color: Colors.orange),),
                      Text("Ticket Price",style: TextStyle(color: Colors.grey),),
                      Text("0 tk",style: TextStyle(color: Colors.orange),),
                    ],
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/icons/qrcode.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
          :
      Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0,top: 5,right: 14,bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(height: 10,),
              Text("Scan QR code to avail ticket", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order ID",style: TextStyle(color: Colors.grey),),
                      Obx((){
                        return Text("${myTicketController.myTicketList[myTicketController.myTicketIndex.value].tslmsFk}",style: TextStyle(color: Colors.orange),);
                      }),
                      Text("Ticket Purchase Date",style: TextStyle(color: Colors.grey),),
                      Text("24/Oct/2022",style: TextStyle(color: Colors.orange),),
                      Text("Ticket Expire Date",style: TextStyle(color: Colors.grey),),
                      Text("None",style: TextStyle(color: Colors.orange),),
                      Text("Ticket Price",style: TextStyle(color: Colors.grey),),
                      Obx((){
                        return Text("${myTicketController.myTicketList[myTicketController.myTicketIndex.value].mrp} tk",style: TextStyle(color: Colors.orange),);
                      }),
                    ],
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/icons/qrcode.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

    });
  }
}
