import 'package:app/FireBase_FireStore_DataBase/My_DataBase.dart';
import 'package:app/FireBase_FireStore_DataBase/car/car.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:app/UI/user_interface/taps/Paymentpage.dart';
import 'package:app/UI/user_interface/taps/viewcarsdetailsscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Show_car_Widget extends StatelessWidget {
  Car car;
  Show_car_Widget({required this.car});

  @override
  Widget build(BuildContext context) {
    var mediaQuere = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PaymentPage.routeName , arguments: car);
      },
      onDoubleTap: (){
        Navigator.pushNamed(context, ViewCarDetailsScreen.routeName , arguments: car);

      },
      onLongPress: (){
        cardetialsmodalbuttomsheet(context , car);
      },
      child: Container(
        decoration: BoxDecoration(
            color: MyTheme.blue,

            borderRadius: BorderRadius.circular(20)
        ),
        margin:const EdgeInsets.all(20),
        child: Slidable(
          key: const ValueKey(1),
          startActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                flex: 2,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20) ,bottomLeft: Radius.circular(20)),
                onPressed: (BuildContext) async {
                  Navigator.pushNamed(context, ViewCarDetailsScreen.routeName , arguments: car);
                },
                backgroundColor: MyTheme.blue,
                foregroundColor: Colors.white,
                icon: Icons.remove_red_eye_rounded,
                label: 'View',
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  MyTheme.lightbule,
                  MyTheme.white,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(-3,3),
                  blurRadius: 10
                )
              ]
            ),
            padding: EdgeInsets.only(top:20 ,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("${car.ManufacturCompany} ${car.CarModel}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize:30),textAlign: TextAlign.center,),
                const SizedBox(height: 10,),
                Image.network(car.Image , height: mediaQuere.height*0.2, fit: BoxFit.contain,),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                        child: Text('${car.Price} EGP' , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize:22),textAlign: TextAlign.center),
                    ),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, PaymentPage.routeName , arguments: car);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )))
                          ),
                          child: Text('Rent Now' , style: TextStyle(fontSize: 20),)
                        ),
                    )
                  ],
                ),
              ],
            ),
            // child: Row(
            //   children: [
            //     Expanded(
            //       flex: 2,
            //       child: Container(
            //         child: Image.network(car.Image),
            //       ),
            //     ),
            //     Expanded(
            //       flex: 3,
            //       child: Container(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text("${car.ManufacturCompany} ${car.CarModel}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 24),textAlign: TextAlign.center,),
            //
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Icon(Icons.airline_seat_recline_normal_rounded , color: MyTheme.primarycolor,),
            //                 Text(": ${car.Seats}" ,style: TextStyle(fontSize: 18),)
            //               ],
            //             ),
            //
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Icon(Icons.speed_rounded , color: MyTheme.primarycolor,),
            //                 Text(": ${car.MaximumSpeed} Kmh" ,style: TextStyle(fontSize: 18),)
            //               ],
            //             ),
            //             Container(
            //               margin: EdgeInsets.only(left: 15),
            //               child: ElevatedButton(
            //                     onPressed: (){
            //                       Navigator.pushNamed(context, PaymentPage.routeName , arguments: car);
            //                     },
            //                     style: ButtonStyle(
            //                       padding: MaterialStateProperty.all(EdgeInsets.all(15)),
            //                         backgroundColor:MaterialStateProperty.all(MyTheme.primarycolor),
            //                         fixedSize: MaterialStateProperty.all(Size.fromWidth(mediaQuere.width),),
            //                       shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topLeft: Radius.circular(20))) )
            //                     ),
            //                     child: Text('Rent Now' , style: TextStyle(fontSize: 20),)
            //                 ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
  cardetialsmodalbuttomsheet (BuildContext context , Car car){
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20))
        ),
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(30),
            child:ListView (
              children: [
                Text("${car.ManufacturCompany} ${car.CarModel}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize:30),textAlign: TextAlign.center,),
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Car Model : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                    Text("${car.ManufacturCompany} ${car.CarModel}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                  ],
                ),
                Container(
                  color: MyTheme.primarycolor,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Color  : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                    Text("${car.Color}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                  ],
                ),
                Container(
                  color: MyTheme.primarycolor,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Horse Power : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                    Text("${car.HorsePower}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                  ],
                ),
                Container(
                  color: MyTheme.primarycolor,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Maximum Speed : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                    Text("${car.MaximumSpeed}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                  ],
                ),
                Container(
                  color: MyTheme.primarycolor,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transmission Type : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                    Text("${car.TransmissionType}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                  ],
                ),
                Container(
                  color: MyTheme.primarycolor,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Year Model : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                    Text("${car.YearModel}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                  ],
                ),
                Container(
                  color: MyTheme.primarycolor,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Number of Seats : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                    Text("${car.Seats}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                  ],
                ),
                Container(
                  color: MyTheme.primarycolor,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                    Text("${car.Price}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                  ],
                ),
                Container(
                  color: MyTheme.primarycolor,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 0,
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, PaymentPage.routeName , arguments: car);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)))
                    ),
                    child: Text('Rent Now' , style: Theme.of(context).textTheme.headline2,)
                ),
              ],
            )
          );
        },
    );
  }
}
