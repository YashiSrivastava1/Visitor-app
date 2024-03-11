import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visitors_app/Controllers/baseAPI.dart';
import 'package:visitors_app/screens/IDCard.dart';
import 'package:visitors_app/screens/hostScreen.dart';

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
  String? _selectedIdType;
  TextEditingController department_of_visiting_person_controller=new TextEditingController();
  TextEditingController purpose_of_visit_controller=new TextEditingController();
  TextEditingController name=new TextEditingController();
  TextEditingController name_of_Host=new TextEditingController();
  TextEditingController companyName=new TextEditingController();
  TextEditingController companyAddress=new TextEditingController();
  TextEditingController idNumberController=new TextEditingController();
  TextEditingController idNumbervalue = new TextEditingController();
  TextEditingController timeOfEntry=new TextEditingController();
  TextEditingController mobNo=new TextEditingController();
  TextEditingController hostMobNo=new TextEditingController();
 // import 'dart:convert';
//import 'package:http/http.dart' as http;



Future<void> submitFormData(String imagePath) async {
  // API endpoint
  var endpoint='newVisitor';
  var baseUrl= BaseApi().baseApi;
  var finalUrl=baseUrl+endpoint;
  var url = Uri.parse(finalUrl);

  // Read the image file as bytes
  List<int> imageBytes = await File(imagePath).readAsBytes();

  // Create a multipart request
  var request = http.MultipartRequest('POST', url);

  // Add the image file to the request
  request.files.add(await http.MultipartFile.fromPath('imageMultipart', selectedIMage!.path));

  // Add other form fields
  request.fields['mobNo'] = mobNo.text;
  request.fields['name'] = name.text;
  request.fields['hostName'] = name_of_Host.text;
  request.fields['hostMobNo'] = mobNo.text;
  request.fields['department'] = department_of_visiting_person_controller.text;
  request.fields['office'] = companyName.text;
  request.fields['purposeOfVisit'] = purpose_of_visit_controller.text;

  // Send the request
  try {
    var response = await request.send();
      var responseData = await response.stream.bytesToString();
      var data = jsonDecode(responseData);


    //var data = json.decode(map);
    print("map here $data");

    if (response.statusCode == 200) {
      print('Form data submitted successfully');
      
      
           Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HostScreen(name: name.text, purposeOfVisit: purpose_of_visit_controller.text, image: selectedIMage, company: companyName.text, companyAdd: companyAddress.text, id: idNumberController.text, department: department_of_visiting_person_controller.text, idNumber: idNumbervalue.text,time: timeOfEntry.text,)),
                     
                      );

    } else {
      print('Failed to submit form data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error submitting form data: $e');
  }
}


//   extension AadharNumberValidator on String {
//   bool isValidAadharNumber() {
//     return RegExp(
//             r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$')
//         .hasMatch(this);
//   }
// }

// extension PanCardValidator on String {
//   bool isValidPanCardNo() {
//     return RegExp(
//             r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$')
//         .hasMatch(this);
//   }
// }

// extension DrivingLicense Validator on String {
//   bool isValidLicenseNo() {
//     return RegExp(
//             r'^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$')
//         .hasMatch(this);
//   }
// }
  
  DateTime date = DateTime.now();

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

  // List<String> purpose = <String>[
  //   'Meet HR',
  //   'Business',
  //   'Certificate',
  //   'Salary',
  //   'Legal'
  // ];
 //  List<String> department = <String>['IT', 'BPO', 'HR', 'Cloud', 'CEO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 202, 233, 247),
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/cyflogo.jpeg',
                fit: BoxFit.contain,
              ),

// SizedBox(

// width: 60,

// )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Expanded(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/blueBackgroundScreen.jpg'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
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
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                                controller: purpose_of_visit_controller,
                                style: TextStyle(),
                                keyboardType: TextInputType.text,
                                //inputFormatters: <TextInputFormatter>[],
                                decoration: InputDecoration(
                                    labelText: "Purpose of Visit",
                                    hintText: "Enter Purpose of Visit",
                                    icon: Icon(
                                        Icons.picture_in_picture_alt_sharp))),
                          ),
                          DropdownButton<String>(
                            items: <String>['Business Meeting', 'Official Meeting', 'Interview', 'Reporting','D.C. Visit']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                                onTap: () {
                                  purpose_of_visit_controller.text = value;
                                },
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                                controller:
                                    department_of_visiting_person_controller,
                                style: TextStyle(),
                                keyboardType: TextInputType.text,
                               // inputFormatters: <TextInputFormatter>[],
                                decoration: InputDecoration(
                                    labelText: "Department of visiting person",
                                    hintText: "Enter Department of Visit",
                                    icon: Icon(Icons.account_tree_sharp))),
                          ),
                          DropdownButton<String>(
                            items: <String>['IT', 'BPO', 'Data Center', 'HR']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                                onTap: () {
                                  department_of_visiting_person_controller.text = value;
                                },
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ],
                      ),
                    ),
                    // Container(
                      

                    //   width: MediaQuery.of(context).size.width,
                    //   child: Row(
                    //     children: [
                    //       Text("Choose ID card", style: TextStyle(color: Colors.black), ),
                          
                    //       DropdownButton<String>(
                    //         //labelText "Choose ID Card",
                    //         items: <String>['IT', 'BPO', 'Data Center', 'HR']
                    //             .map((String value) {
                    //           return DropdownMenuItem<String>(
                    //            //labelText: "Choose ID Card",
                              
                    //             value: value,
                    //             child: Text(value),
                    //             onTap: () {
                    //               department_of_visiting_person_controller.text = value;
                    //               icon: Icon(Icons.card_giftcard);


                    //             },
                    //           );
                    //         }).toList(),
                    //         onChanged: (_) {},
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          labelText: 'Visitor Name',
                          icon: Icon(Icons.person),
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String? value) {
                          return (value != null && value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        controller: companyName,
                        decoration: const InputDecoration(
                          labelText: 'Comapny Name/College Name',
                          icon: Icon(Icons.business),
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String? value) {
                          return (value != null && value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        controller: companyAddress,
                        decoration: const InputDecoration(
                          labelText: 'Comapny Address',
                          icon: Icon(Icons.post_add),
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String? value) {
                          return (value != null && value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                     Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: DropdownButton<String>(
                        
                        //controller: idNumberController,
                       // controller: idNumberController,
                        icon: Icon(Icons.perm_identity),
                        value: _selectedIdType,
                        hint: Text('Select ID Type'),
                        onChanged: (String? value) {
                          setState(() {
                            
                            _selectedIdType = value;
                          });
                        },
                        items: <String>['Aadhar', 'Pan', 'Driving License']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            //controller: idNumberController,
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    // Text field for ID number
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        controller: idNumbervalue,
                        decoration: InputDecoration(
                          labelText: 'ID Number',
                          icon: _selectedIdType == null
                              ? null
                              : _selectedIdType == 'Aadhar'
                                  ? Icon(Icons.credit_card)
                                  : _selectedIdType == 'Pan'
                                      ? Icon(Icons.credit_card)
                                      : _selectedIdType == 'Driving License'
                                          ? Icon(Icons.credit_card)
                                          : null,
                        ),
                        validator: (value) {
                          if (_selectedIdType == null) {
                            return 'Please select ID Type';
                          }
                          if (value == null || value.isEmpty) {
                            return 'Please enter ID Number';
                          } else {
                            switch (_selectedIdType) {
                              case 'Aadhar':
                                if (!RegExp(
                                        r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$')
                                    .hasMatch(value)) {
                                      Fluttertoast.showToast(msg: "Adhar number not valid");
                                  return 'Invalid Aadhar Number';
                                }
                                break;
                              case 'Pan':
                                if (!RegExp(
                                        r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$')
                                    .hasMatch(value)) {
                                      Fluttertoast.showToast(msg: "PAN number not valid");
                                  return 'Invalid Pan Card Number';
                                }
                                break;
                              case 'Driving License':
                                if (!RegExp(
                                        r'^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$')
                                    .hasMatch(value)) {
                                      Fluttertoast.showToast(msg: "Driving Lisence number not valid");
                                  return 'Invalid Driving License Number';
                                }
                                break;
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        controller: name_of_Host,
                        decoration: const InputDecoration(
                          labelText: 'Host Name',
                          icon: Icon(Icons.person),
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String? value) {
                          return (value != null && value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                    ),
                   SizedBox(
                    height: 5,
                   )
                   ,
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: TextField(
                          controller: mobNo,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Enter Host's Mobile Number",
                            icon: Icon(Icons.phone),
                          ),
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       selectDatePicker();
                    //     },
                    //     child: const Text("Pick Your Date")),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // // disply chosen Date
                    // Text(date.toString()),
                    Container(
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                     
                      child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,      
                        children: [
                          ElevatedButton(
                            
                            onPressed: () {
                              setState(() {
                                
                                _selectTime();
                              });
                            },
                            child: const Text(
                            
                              "Pick Your Time",
                              style: TextStyle(
                                backgroundColor: Colors.blue,
                                
                                color: Colors.white,
                              ),
                            ),
                          ),
                        
                      Text("${time.hour}:${time.minute}",),
                      SizedBox(height: 30),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  enabledMouseCursor: MouseCursor.uncontrolled,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {
                  submitFormData(selectedIMage!.path);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HostScreen(name: name.text, purposeOfVisit: purpose_of_visit_controller.text, image: selectedIMage, company: companyName.text, companyAdd: companyAddress.text, id: idNumberController.text, department: department_of_visiting_person_controller.text, idNumber: idNumbervalue.text,time: timeOfEntry.text,)),
                     
                      );
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                label:
                    Text("Submit", style: TextStyle(color: Colors.white)),
              ),
                  ],
                ),
              ),
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
