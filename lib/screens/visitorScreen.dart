
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visitors_app/screens/IDCard.dart';

class VisitorForm extends StatefulWidget {
  const VisitorForm({Key? key}) : super(key: key);

  @override
  State<VisitorForm> createState() => _VisitorFormState();
}

class _VisitorFormState extends State<VisitorForm> {
  Uint8List? _image;
  File? selectedIMage;
  String? purposeDropdownValue;
  String? departmentDropdownValue;
  DateTime date = DateTime.now();
  
  TextEditingController name=new TextEditingController();
  
  TextEditingController purposeOfVisit=new TextEditingController();
   void selectDatePicker() async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1999),
        lastDate: DateTime(2030));
    if (datePicker != null && datePicker != date) {
      setState(() {
        date = datePicker;
      });
    }
  }
  late TimeOfDay time;
  _selectTime() async {
    TimeOfDay? picker =
        await showTimePicker(context: context, initialTime: time);
    if (picker != null) {
      setState(() {
        time = picker;
      });
    }
  }
   @override
  void initState() {
    super.initState();
    time = TimeOfDay.now();
    
  }
  List<String> purpose = <String>[
    'Meet HR',
    'Business',
    'Certificate',
    'Salary',
    'Legal'
  ];
  List<String> department = <String>[
    'IT',
    'BPO',
    'HR',
    'Cloud',
    'CEO'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 202, 233, 247),
      appBar: AppBar(
        title: Text(
          "Enter Details",
          style: TextStyle(fontStyle: FontStyle.normal, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _image != null
                  ? CircleAvatar(
                      radius: 100, backgroundImage: MemoryImage(_image!))
                  : const CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                    ),
              Positioned(
                  bottom: -0,
                  left: 140,
                  child: IconButton(
                      onPressed: () {
                        showImagePickerOption(context);
                      },
                      icon: const Icon(Icons.add_a_photo))),
                Container(
                  
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: DropdownButton<String>(
                    
                    hint: Text("Purpose of Visit", style: TextStyle(
                    ),),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    iconSize: 25,
                    value: purposeDropdownValue,

                    onChanged: (String? newValue) {
                      setState(() {
                        purposeOfVisit.text = newValue!;
                        purposeDropdownValue=newValue;
                      });
                    },
                    items: purpose.map((String valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: DropdownButton<String>(
                    
                    hint: Text("Department", style: TextStyle(
                    ),),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 25,
                    isExpanded: true,
                    //iconSize: 36,
                    value: departmentDropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        departmentDropdownValue = newValue!;
                      });
                    },
                    items: department.map((String valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  
                    
                  child: TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                    
                     
                      
                      labelText: 'Name',
                     
                      suffixIcon: Icon(Icons.person),
                      
                    ),
                    onChanged: (String? value) {

                    name.text = value!;
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                    },
                  ),
                 

                ),
               
                  
                   Container(
                    
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                              hintText: "Enter your Mobile Number",
                              suffixIcon: Icon(Icons.phone),
                             
                              ),
                                  ),
                    ),
                  ),
                // ElevatedButton(
                //   onPressed: () {
                //     selectDatePicker();
                //   },
                //   child: const Text("Pick Your Date")),
                 ElevatedButton.icon(
           
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 32, 117, 186),
              enabledMouseCursor: MouseCursor.uncontrolled,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              
            ),
          ), 
          onPressed: () {

            selectDatePicker();
          },
          icon: const Icon(Icons.check, color: Colors.white,),
          label:  Text("Date", style: TextStyle(color: Colors.white)),
          
          ),
              const SizedBox(
                height: 10,
              ),
              // disply chosen Date
              Text(date.toString()),
              // ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       _selectTime();
              //     });
              //   },
              //   child: const Text(
              //     "Pick Your Time",
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              ElevatedButton.icon(
           
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 32, 117, 186),
              enabledMouseCursor: MouseCursor.uncontrolled,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              
            ),
          ), 
          onPressed: () {

            setState(() {
                 _selectTime();
                   });
          },
          icon: const Icon(Icons.check, color: Colors.white,),
          label:  Text("Time", style: TextStyle(color: Colors.white)),
          
          ),
              Text("${time.hour}:${time.minute}"),
              SizedBox(height: 30),
         
        // ElevatedButton(onPressed: (){
        //   Navigator.push(context, MaterialPageRoute(builder:(_)=> VisitorForm(),));
          
        // }, child: Text("Submit OTP", style: TextStyle( color: Colors.blue)))
         ElevatedButton.icon(
           
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 32, 117, 186),
              enabledMouseCursor: MouseCursor.uncontrolled,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              
            ),
          ), 
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> PrintScreen(name: name.text, purposeOfVisit: purposeOfVisit.text, image: selectedIMage ),));
          },
          icon: const Icon(Icons.check, color: Colors.white,),
          label:  Text("Submit Form", style: TextStyle(color: Colors.white)),
          
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
