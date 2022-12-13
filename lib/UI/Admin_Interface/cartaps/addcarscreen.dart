import 'dart:io';
import 'dart:math';
import 'dart:core';
import 'package:app/DataBase/DataClasses/Car.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddCerScreen extends StatefulWidget {
  static const String routeName = 'add car screen' ;

  @override
  State<AddCerScreen> createState() => _AddCerScreenState();
}

class _AddCerScreenState extends State<AddCerScreen> {
    Car car =Car(CarID: 0 , DepartmentID: 0 , MakerID: 0 , Color: 'Color', ManufacturCompany: 'ManufacturCompany', CarModel: 'CarModel',
        EngineCapacity: 'EngineCapacity', HorsePower: 'HorsePower', MaximumSpeed: 'MaximumSpeed', TransmissionType: 'TransmissionType', YearModel: 'YearModel', Fuel: 'Fuel', TankSize: 'TankSize',
        Seats: 'Seats', TractionType: "", FuelTankCapacity: 'FuelTankCapacity', NumberOfCylinder: 'NumberOfCylinder', Price: 'Price', Image: 'Image');

    File? image;
    final imagepicker = ImagePicker();

    uploadImage() async {
      // the image in the page
      XFile? pickedImage = await imagepicker.pickImage(source: ImageSource.camera);
      if (pickedImage == null) return;
      image = File(pickedImage.path);
      setState(() {

      });
    }
    // cars list
    final Car_makers_name_list = [
      'All Brands' , 'Abarth' , 'Alfa Romeo' , 'Aston Martin' , 'Audi' , 'Bentley' ,
      'BMW' , 'Bugatti' , 'Cadillac' , 'Caterham' , 'Chery' , 'Chevrolet' , 'Chrysler' , 'Citroen' , 'Daewoo' , 'Daihatsu' ,
      'Datsun' , 'Dodge' , 'Ferrari' , 'Fiat' , 'Ford' , 'Genesis' , 'Great Wall' , 'Haval' , 'Holden' , 'Honda' ,
      'Hyundai' , 'Infiniti' , 'Isuzu UTE' , 'Jaguar' , 'Jeep' , 'Kia' , 'Lamborghini' , 'Land Rover' , 'LDV' ,
      'Lexus' , 'Lotus' , 'Maserati' , 'Mazda' , 'McLaren' , 'Mercedes-Benz' , 'MG' , 'Mini' , 'Mitsubishi' ,
      'Nissan' , 'Opel' , 'Peugeot' , 'Porsche' , 'Proton' , 'Renault' , 'Rolls Royce' , 'Saab' , 'ŠKODA' ,
      'Smart' , 'SsangYong' , 'Subaru' ,  'Suzuki' ,  'Tesla' ,  'Toyota' , 'Volkswagen' , 'Volvo'
    ];
    String Car_Maker = 'All Brands' ;

    // the transition type
    final Transmission_Type_List = ['Automatic' , 'Manual'];
    String Transmition_type = 'Automatic' ;
    // the transition type
    final Year_List = ['Year' , '2000' , '2001', '2002', '2003', '2004' , '2005', '2006', '2007', '2008'
      , '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020'
      , '2021', '2022'
    ];
    String Year = 'Year' ;
    // the transition type
    final Fual_list = ['Fual Type' , 'Kerosene' , 'Solar Oil', 'Diesel Oil', 'Fuel Oil', 'Biodiesel' , 'Gasoline' ];
    String Fual = 'Fual Type' ;
    // the transition type
    final Seats_list = ['Seats' , '2' , '3', '4', '5', '5' , '7' ];
    String Seats = 'Seats' ;
    // the transition type
    final TractionType_list = ['Traction Type' , 'Front Wheel Drive – FWD Meaning' , 'Rear Wheel Drive – RWD Meaning',
      'Four Wheel Drive – 4WD Meaning', 'All-Wheel Drive – AWD Meaning'];
    String TractionType = 'Traction Type' ;
    // ----------------------------------------
    // final _formKey = GlobalKey<FormState>();
    // final TextEditingController _carid = new TextEditingController();
    // final TextEditingController _Departmentid = new TextEditingController();
    // final TextEditingController _nameController = new TextEditingController();
    // final TextEditingController _nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter The New Car Data"),
      ),
      body: Column(
        children: [
          // the profile screen code
          Container(
            width: mediaquery.width,
            height: mediaquery.height * 0.3,
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(100000),
                onTap: uploadImage,
                child: Container(
                  decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyTheme.primarycolor,
                  ),
                  height: mediaquery.height*0.25,
                  width: mediaquery.width,
                  child:image == null? Icon(Icons.camera_alt_rounded , color: MyTheme.white, size: 40,):Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: FileImage(image! ),fit: BoxFit.cover),
                    ),
                  )
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(

                child: Form(
                  child: ListView(
                    children: [
                      // car id
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        child: TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(decimal: false , signed: false),
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const  BorderSide( width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              label: Text( "Car ID",
                                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          cursorColor: MyTheme.primarycolor,
                          validator: validatcarID,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                      // Department ID
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        child: TextFormField(
                          keyboardType:const TextInputType.numberWithOptions(decimal: false , signed: false),
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              label: Text( "Department ID",
                                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          cursorColor: MyTheme.primarycolor,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                      // Maker id
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        child: TextFormField(
                          keyboardType:const TextInputType.numberWithOptions(decimal: false , signed: false),
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              label: Text( "Maker ID",
                                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          cursorColor: MyTheme.primarycolor,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                      // car brand
                      Container(
                        padding:const EdgeInsets.symmetric(horizontal: 20),
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 1 ,color: MyTheme.primarycolor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: Car_Maker,
                            style: Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.primarycolor , fontWeight: FontWeight.w400),
                            dropdownColor: MyTheme.white,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            icon:const Icon(Icons.add, color: MyTheme.primarycolor,),
                            items: Car_makers_name_list.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) => setState(() {this.Car_Maker = value!;}),
                          ),
                        ),
                      ),
                      // Car Model
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              label: Text( "Car Model",
                                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          cursorColor: MyTheme.primarycolor,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                      // Engine Capacity
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              label: Text( "Engine Capacity",
                                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          cursorColor: MyTheme.primarycolor,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                      // Horse Power
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              label: Text( "Horse Power",
                                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          cursorColor: MyTheme.primarycolor,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                      // Maximum Speed
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              label: Text( "Maximum Speed",
                                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          cursorColor: MyTheme.primarycolor,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                      // TankSize
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              label: Text( "Tank Size",
                                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          cursorColor: MyTheme.primarycolor,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                      // Transmition Type
                      Container(
                        padding:const EdgeInsets.symmetric(horizontal: 20),
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 1 ,color: MyTheme.primarycolor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: Transmition_type,
                            style: Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.primarycolor , fontWeight: FontWeight.w400),
                            dropdownColor: MyTheme.white,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            icon:const Icon(Icons.add, color: MyTheme.primarycolor,),
                            items: Transmission_Type_List.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) => setState(() {this.Transmition_type = value!;}),
                          ),
                        ),
                      ),
                      // year
                      Container(
                        padding:const EdgeInsets.symmetric(horizontal: 20),
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 1 ,color: MyTheme.primarycolor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: Year,
                            style: Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.primarycolor , fontWeight: FontWeight.w400),
                            dropdownColor: MyTheme.white,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            icon:const Icon(Icons.add, color: MyTheme.primarycolor,),
                            items: Year_List.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) => setState(() {this.Year = value!;}),
                          ),
                        ),
                      ),
                      //Fual
                      Container(
                        padding:const EdgeInsets.symmetric(horizontal: 20),
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 1 ,color: MyTheme.primarycolor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: Fual,
                            style: Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.primarycolor , fontWeight: FontWeight.w400),
                            dropdownColor: MyTheme.white,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            icon:const Icon(Icons.add, color: MyTheme.primarycolor,),
                            items: Fual_list.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) => setState(() {this.Fual= value!;}),
                          ),
                        ),
                      ),
                      //Seats
                      Container(
                        padding:const EdgeInsets.symmetric(horizontal: 20),
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 1 ,color: MyTheme.primarycolor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: Seats,
                            style: Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.primarycolor , fontWeight: FontWeight.w400),
                            dropdownColor: MyTheme.white,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            icon:const Icon(Icons.add, color: MyTheme.primarycolor,),
                            items: Seats_list.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) => setState(() {this.Seats= value!;}),
                          ),
                        ),
                      ),
                      //TractionType
                      Container(
                        padding:const EdgeInsets.symmetric(horizontal: 20),
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 1 ,color: MyTheme.primarycolor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: TractionType,
                            style: Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.primarycolor , fontWeight: FontWeight.w400),
                            dropdownColor: MyTheme.white,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            icon:const Icon(Icons.add, color: MyTheme.primarycolor,),
                            items: TractionType_list.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) => setState(() {this.TractionType = value!;}),
                          ),
                        ),
                      ),
                      // FuelTankCapacity
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              label: Text( "Fuel Tank Capacity",
                                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          cursorColor: MyTheme.primarycolor,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                      // NumberOfCylinder
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              label: Text( "Number Of Cylinder",
                                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          cursorColor: MyTheme.primarycolor,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                      // NumberOfCylinder
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              label: Text( "Price",
                                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          cursorColor: MyTheme.primarycolor,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }

  // validation funcrions
  String? validatcarID (String? value){
    if (value == null || value.isEmpty || value.trim().isEmpty||value.contains(".")||value.contains(",")){
      setState(() {

      });
      return "Invalid Car ID" ;
    }
    else {
      setState(() {

      });
      return null;
    }
  }
}
