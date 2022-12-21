import 'package:app/FireBase_FireStore_DataBase/car/employee.dart';
import 'package:app/UI/Admin_Interface/cartaps/ShowCarsTap.dart';
import 'package:app/UI/Admin_Interface/cartaps/addcarscreen.dart';
import 'package:app/UI/Admin_Interface/employeetaps/Show_Emplyoee_Tap.dart';
import 'package:app/UI/Admin_Interface/employeetaps/addEmployee.dart';
import 'package:app/UI/Admin_Interface/reportsscreen.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:flutter/material.dart';

import '../../FireBase_FireStore_DataBase/My_DataBase.dart';
import '../user_interface/profile/profilescreen.dart';
import '../user_interface/regestration/loginpage.dart';


class AdminHomeScree extends StatefulWidget {
  static const String routeName = 'Admin home Scree';

  @override
  State<AdminHomeScree> createState() => _AdminHomeScreeState();
}

class _AdminHomeScreeState extends State<AdminHomeScree> {
  int curantindex = 0;
  var taps = [ShowCarsTap(),ShowEmployeeTap()];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyTheme.lightbule,
            MyTheme.white,
          ],
          begin: Alignment.bottomLeft ,
          end: Alignment.topRight,
        ),
      ),
      child: Scaffold(
        drawer: Drawer(
            child: Column(
              children: [

                const SizedBox(height: 70,),
                Row(
                  children: [
                    const SizedBox(width: 15,),
                    const Icon(Icons.info_outline_rounded , size: 30, color: MyTheme.primarycolor,),
                    const SizedBox(width: 10,),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ReportsScreen.routeName);
                      },
                      child:Text("Reports " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 22 ,fontWeight: FontWeight.w500),textAlign: TextAlign.start,) ,
                    ),
                  ],
                ),
                Container(height: 1, margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 5), color: MyTheme.primarycolor,),
                Row(
                  children: [
                    const SizedBox(width: 15,),
                    const Icon(Icons.logout_rounded, size: 30, color:Colors.red,),
                    const SizedBox(width: 10,),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.popAndPushNamed(context, LoginPage.routeName);
                      },
                      child:Text("Sign Out" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 22 ,fontWeight: FontWeight.w500, color: Colors.red),textAlign: TextAlign.start ,) ,
                    ),
                  ],
                ),
              ],
            ),
          ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Home"),
        ),

        body: Column(
          children: [
            Expanded(child: taps[curantindex])
          ],
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 6 , color: MyTheme.white),
            borderRadius: BorderRadius.circular(1000)
          ),
          child: FloatingActionButton(
            onPressed: (){
              Show_Modal_Buttom_Sheet(context);

            },
            child:const Icon(Icons.add_rounded , size: 36, color: MyTheme.white,),
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          color: MyTheme.white,
          child: BottomNavigationBar(
            currentIndex: curantindex,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onTap: (index){
              curantindex = index;
              setState(() {});
            },
            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.car_rental_rounded) , label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person_rounded) , label: ""),
            ],
          ),
        )
      ),
    );
  }
  Show_Modal_Buttom_Sheet (BuildContext context){
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30))),
        builder: (context) => Container(

          child: Container(
            height: 200,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(200))),
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                    fixedSize: MaterialStateProperty.all(Size.infinite)
                  ),
                    onPressed: (){
                      Navigator.pushNamed(context, AddCerScreen.routeName);
                    },
                    child: Text('Add Car' , style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 22),)
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(200))),
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                        backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                        fixedSize: MaterialStateProperty.all(Size.infinite)
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, AddEmployeeSCreen.routeName);
                    },
                    child: Text('Add Employee', style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 22),)
                )
              ],
            ),
          ),
        ),
    ) ;
  }
}
