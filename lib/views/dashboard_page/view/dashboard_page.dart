import 'package:babuland/services/moc_ticket_services.dart';
import 'package:babuland/views/dashboard_page/controller/dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class DashboardPage extends StatelessWidget {
  final dashboardController = Get.find<DashboardController>();
   DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //MocTicketServices.getMocTickets();
    dashboardController.getAllMocTicket();
    Future<bool> showExitPopup() async {
      return await showDialog(
        //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Container(
            width: 100,
            height: 100,
            child: Image.asset('assets/icons/splashlogo.png',fit: BoxFit.contain,),
          ),
          content: Text(
            'Do you want to exit?',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child: Text(
                'No',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              //return true when click on "Yes"
              child: Text(
                'Yes',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
      ) ?? false; //if showDialouge had returned null, then return false
    }
    return WillPopScope(
      onWillPop: showExitPopup,
        child: Scaffold(
          appBar: _appBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Obx((){
                return dashboardController.isLoading.value?
                Center(child: CircularProgressIndicator())
                    :
                dashboardController.mocTicketList.value.length > 0?
                ListView.builder(
                  itemCount: dashboardController.mocTicketList.length,
                  itemBuilder: (context,index) {
                    return Card(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                                  left: BorderSide(color: Colors.deepOrange, width: 3.0),
                                  top: BorderSide(color: Colors.green, width: 3.0),
                                  right: BorderSide(color: Colors.blue, width: 3.0),
                                  bottom: BorderSide(color: Colors.red, width: 3.0),
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        child: CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.lightBlue.shade200,
                                          //backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2013/07/12/15/55/cricket-150561_960_720.png'),
                                          // backgroundImage: AssetImage(
                                          //   'assets/icons/logo_babuland.png',
                                          // ),
                                          child: Image.asset(
                                            'assets/icons/logo_babuland.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        alignment: Alignment.topLeft,
                                      ),
                                      Column(
                                        children: [
                                          Text("This is your Entry Ticket",style: TextStyle(fontWeight: FontWeight.w900)),
                                          !dashboardController.mocTicketList[index].pk!.isNegative?
                                          Text("Order ID: ${dashboardController.mocTicketList[index].pk}")
                                              :
                                          Text("Order ID: 0"),
                                        ],
                                      ),
                                      Align(
                                        child: CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.lightBlue.shade200,
                                          //backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2013/07/12/15/55/cricket-150561_960_720.png'),
                                          backgroundImage: AssetImage(
                                              'assets/icons/mobile.png'
                                          ),
                                        ),
                                        alignment: Alignment.topRight,
                                      ),
                                    ],
                                  ),
                                  //SizedBox(height: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      !dashboardController.mocTicketList[index].total!.isNegative?
                                      Text("Ticket Price: ${dashboardController.mocTicketList[index].total} tk", style: TextStyle(fontWeight: FontWeight.w600),)
                                          :
                                      Text("Ticket Price: 0 tk", style: TextStyle(fontWeight: FontWeight.w600),),
                                      //SizedBox(height: 10,),
                                      SizedBox(
                                        width: 100,
                                        child: ElevatedButton(
                                            onPressed: (){
                                              //print("${dashboardController.mocTicketList[index].pk}");
                                              Get.toNamed('/my_ticket_page',arguments: dashboardController.mocTicketList[index].pk);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text("Active",style: TextStyle(color: Colors.white),),
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                  //SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child:
                                        dashboardController.mocTicketList[index].sellDate != null?
                                        Text("Purchase Date ${dashboardController.mocTicketList[index].sellDate}",style: TextStyle(fontSize: 12),)
                                            :
                                        Text("Purchase Date 0}",style: TextStyle(fontSize: 12)),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          print("Details");
                                        },
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Text("Details", style: TextStyle(color: Colors.orange),),
                                              SizedBox(width: 10,),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius: BorderRadius.all(Radius.circular(50))
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: Icon(Icons.arrow_forward,color: Colors.white,size: 18,),
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
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
    );
  }

  _appBar(){
    return AppBar(
      title: Text("Tickets",style: TextStyle(color: Colors.white),),
      centerTitle: true,
      elevation: 0,
    );
  }

}
