import 'package:app/UI/Admin_Interface/cartaps/editdataofthecar.dart';
import 'package:app/UI/Admin_Interface/employeetaps/addEmployee.dart';
import 'package:app/UI/Admin_Interface/employeetaps/editemployeescreen.dart';
import 'package:app/UI/user_interface/home_screen.dart';
import 'package:app/UI/user_interface/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'UI/Admin_Interface/Admin_home_Screen.dart';
import 'UI/Admin_Interface/cartaps/addcarscreen.dart';
import 'UI/theme/themedatafile.dart';
import 'firebase_options.dart';

void main ()async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        LoginPage.routeName :(_) => LoginPage(),
        User_Home_screen.routeName : (_) => User_Home_screen(),
        AddEmployeeSCreen.routeName :(_) => AddEmployeeSCreen(),
        editCerScreen.routeName :(_) => editCerScreen(),
        EditEmployeeScreen.routeName : (_) => EditEmployeeScreen(),
        AdminHomeScree.routeName : (_) => AdminHomeScree(),
        AddCerScreen.routeName :(_) => AddCerScreen(),
      } ,
      initialRoute: LoginPage.routeName,
      theme: MyTheme.LightTheme,
    );
  }
}
