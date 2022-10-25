import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class MyTicketServices{

  static Future<http.Response> getMyTickets(int? pk)async{
    var response = await http.get(Uri.parse(Constants.apiBaseUrl + '/bblapi/babuland/v1/mock_ticket_dt'),
      headers: {
        'ORDER_ID' : pk.toString(),
      },
    );
    //print(response.body);
    return response;
  }
}