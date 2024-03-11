// import 'package:flutter/foundation.dart';
// import 'package:visitors_app/Controllers/baseAPI.dart';
// import 'package:visitors_app/models/getVisitorModel.dart';
// import 'package:http/http.dart' as http;
// import 'package:visitors_app/screens/visitorList.dart';
// class VisitorProvider extends ChangeNotifier {
//   List<Visitor> _visitors = [];

//   List<Visitor> get visitors => _visitors;

//  Future<void> getVisitorList() async {
//   var endpoint = 'getVisitor';
//   var baseUrl = BaseApi().baseApi;
//   var finalUrl = baseUrl + endpoint;

//   http.Response response = await http.get(Uri.parse(finalUrl));

//   if (response.statusCode == 200) {
//     try {
//      // List<dynamic> dataList = json.decode(response.body)['data'];
//       _visitors = dataList.map((data) => Visitor(
//         id: data['id'],
//         name: data['name'],
//         department: data['department'],
//         hostName: data['hostName'],
//         mobNo: data['mobNo'],
//         purposeOfVisit: data['purposeOfVisit'],
//       )).toList();
//       notifyListeners();
//     } catch (e) {
//       print('Error parsing JSON: $e');
//     }
//   } else {
//     print('HTTP Error: ${response.statusCode}');
//   }
// }

    
  
// }
