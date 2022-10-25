import 'package:babuland/views/dashboard_page/binding/dashboard_binding.dart';
import 'package:babuland/views/dashboard_page/view/dashboard_page.dart';
import 'package:babuland/views/my_ticket_page/binding/my_ticket_binding.dart';
import 'package:babuland/views/my_ticket_page/view/my_ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Developed by emonalmamun@gmail.com',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.orange,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=> DashboardPage(), binding: DashboardBinding()),
        GetPage(name: "/my_ticket_page", page: ()=> MyTicketPage(), binding: MyTicketBinding()),
      ],
    );
  }
}