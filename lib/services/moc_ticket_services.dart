import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class MocTicketServices{
  static Future<http.Response> getMocTickets()async{
    var response = await http.get(Uri.parse(Constants.apiBaseUrl + '/bblapi/babuland/v1/mock_ticket_ms'),
      headers: {
        'MOBILE_NUMBER' : '01717956094',
      },
    );
    //print(response.body);
    return response;
  }
}