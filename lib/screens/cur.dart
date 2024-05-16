// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
//
// class Currency extends StatefulWidget {
//   const Currency({super.key});
//
//   @override
//   State<Currency> createState() => _CurrencyState();
// }
//
// class _CurrencyState extends State<Currency> {
//   // from
//   final myController = TextEditingController();
//   // amount
//   final myController2 = TextEditingController();
//   // to
//   final myController3 = TextEditingController();
//
//   // String _output = "Test one two three";
//   // converter
//   Future<dynamic> currencyConveter(
//       String from, String amount, String to, String outPlace) async {
//     final url = Uri.parse(
//         'https://currency-converter-by-api-ninjas.p.rapidapi.com/v1/convertcurrency?have=$from&want=$to&amount=$amount');
//     final headers = {
//       'X-RapidAPI-Key': 'f0bc241e31mshbb59e761d9eb84ap143052jsn93486e4a07a0',
//       'X-RapidAPI-Host': 'currency-converter-by-api-ninjas.p.rapidapi.com'
//     };
//
//     try {
//       final response = await http.get(url, headers: headers);
//       final result = response.body;
//       Map<String, dynamic> data = json.decode(result);
//       double newAmount = data['new_amount'];
//       setState(() {
//         // _output = newAmount.toString();
//         if (outPlace == '1') {
//           // value
//           myController.text = newAmount.toString();
//           // place holder
//           amount1 = newAmount.toString();
//         } else {
//           // place holder
//           myController2.text = newAmount.toString();
//           // value
//           amount2 = newAmount.toString();
//         }
//       });
//     } catch (error) {
//       print('something went wrong');
//       print(error);
//     }
//   }
//
//   String dropdownFromValue = 'ETB';
//   String dropdownToValue = 'USD';
//   String amount1 = 'Amount1';
//   String amount2 = 'Amount2';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         //Floating action button on Scaffold
//         backgroundColor: Color(0xffd27405),
//         onPressed: () {
//           //code to execute on button press
//
//         },
//         child: Icon(
//           Icons.home,
//           color: Color(0xff1c1c1c),
//         ), //icon inside button
//       ),
//
//       floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
//       //floating action button location to left
//
//       bottomNavigationBar: BottomAppBar(
//         //bottom navigation bar on scaffold
//         color: Color(0xff1c1c1c),
//         shape: CircularNotchedRectangle(), //shape of notch
//         notchMargin:
//         5, //notche margin between floating button and bottom appbar
//         // child: Row(
//         //   //children inside bottom appbar
//         //   mainAxisSize: MainAxisSize.max,
//         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //   children: <Widget>[
//         //     Padding(
//         //       padding: EdgeInsets.only(left: 90),
//         //       child: IconButton(
//         //         icon: Icon(
//         //           Icons.calendar_month,
//         //           color: Color(0xffd27405),
//         //         ),
//         //         onPressed: () {
//         //           Navigator.pushNamed(context, route.calendar);
//         //         },
//         //       ),
//         //     ),
//         //     IconButton(
//         //       icon: const FaIcon(
//         //         FontAwesomeIcons.moneyBillTrendUp,
//         //         color: Color(0xffd27405),
//         //       ),
//         //       onPressed: () {
//         //         Navigator.pushNamed(context, route.currency);
//         //       },
//         //     ),
//         //     IconButton(
//         //       icon: Icon(
//         //         Icons.info,
//         //         color: Color(0xffd27405),
//         //       ),
//         //       onPressed: () {},
//         //     ),
//         //     IconButton(
//         //       icon: FaIcon(
//         //         FontAwesomeIcons.user,
//         //         color: Color(0xffd27405),
//         //       ),
//         //       onPressed: () {},
//         //     ),
//         //     // IconButton(
//         //     //   icon: Icon(
//         //     //     Icons.user,
//         //     //     color: Color(0xffd27405),
//         //     //   ),
//         //     //   onPressed: () {},
//         //     // ),
//         //   ],
//         // ),
//       ),
//       backgroundColor: Color(0xff1c1c1c),
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Currency Converter'),
//         foregroundColor: Color(0xffd27405),
//         backgroundColor: Color(0xff1c1c1c),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 50,
//                         width: 100,
//                         decoration: const BoxDecoration(
//                           color: Color(0xff1c1c1c),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black,
//                               offset: Offset(0, 3),
//                               blurRadius: 10,
//                             )
//                           ],
//                         ),
//                         child: Image.asset(
//                           'assets/currency/$dropdownFromValue.png',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Container(
//                           padding: const EdgeInsets.only(left: 5, right: 5),
//                           decoration: const BoxDecoration(
//                             color: Color(0xff1c1c1c),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black,
//                                 offset: Offset(0, 3),
//                                 blurRadius: 10,
//                               )
//                             ],
//                           ),
//                           child: DropdownButton<String>(
//                             value: dropdownFromValue,
//                             // isExpanded: true,
//                             items: <String>['USD', 'ETB', 'GBP', 'JPY', 'EUR']
//                                 .map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(
//                                   value,
//                                   style: const TextStyle(
//                                     color: Color(0xffd27405),
//                                     fontSize: 16.0,
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                             // Step 5.
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 dropdownFromValue = newValue!;
//                                 print(dropdownFromValue);
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // Todo add arrow
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: FaIcon(
//                     FontAwesomeIcons.arrowsRotate,
//                     color: Color(0xffd27405),
//                   ),
//                 ),
//
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 50,
//                         width: 100,
//                         decoration: const BoxDecoration(
//                           color: Color(0xff1c1c1c),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black,
//                               offset: Offset(0, 3),
//                               blurRadius: 10,
//                             )
//                           ],
//                         ),
//                         child: Image.asset(
//                           'assets/currency/$dropdownToValue.png',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Container(
//                           padding: const EdgeInsets.only(left: 5, right: 5),
//                           decoration: const BoxDecoration(
//                             color: Color(0xff1c1c1c),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black,
//                                 offset: Offset(0, 3),
//                                 blurRadius: 10,
//                               )
//                             ],
//                           ),
//                           child: DropdownButton<String>(
//                             value: dropdownToValue,
//                             // isExpanded: true,
//                             items: <String>['USD', 'ETB', 'GBP', 'JPY', 'EUR']
//                                 .map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(
//                                   value,
//                                   style: const TextStyle(
//                                     color: Color(0xffd27405),
//                                     fontSize: 16.0,
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                             // Step 5.
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 dropdownToValue = newValue!;
//                                 print(dropdownToValue);
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             // ! Amount 1
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 100,
//                   child: TextField(
//                     controller: myController,
//                     keyboardType: TextInputType.number,
//                     style: const TextStyle(color: Colors.white),
//                     textAlign: TextAlign.center,
//                     decoration: InputDecoration(
//                       hintText: amount1,
//
//                       hintStyle: TextStyle(
//                         color: Colors.grey,
//                       ),
//
//                       // ? border
//                       border: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                           color:
//                           Colors.white, // Set the default border color here
//                         ),
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Color(
//                               0xffd27405), // Set the focused border color here
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   // width: 30,
//                   height: 35,
//                   width: 50,
//                   child: Center(
//                     child: Text(
//                       dropdownFromValue,
//                       style: const TextStyle(
//                         color: Color(0xffd27405),
//                         fontFamily: 'Poppins',
//                         fontSize: 20,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//
//             // ! Convert button
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: GestureDetector(
//                 // onTap: () => currencyConveter(
//                 //     myController.text, , myController3.text),
//                 onTap: () {
//                   if (myController2.text == "") {
//                     //   currencyConveter(
//                     //       dropdownFromValue, dropdownToValue, myController2.text);
//
//                     currencyConveter(dropdownFromValue.toString(),
//                         myController.text, dropdownToValue.toString(), '2');
//                     print('Button Clicked2');
//                   } else if (myController.text == "") {
//                     // currencyConveter(
//                     //     dropdownToValue, dropdownFromValue, myController2.text);
//                     currencyConveter(dropdownToValue.toString(),
//                         myController2.text, dropdownFromValue.toString(), '1');
//
//                     print('Button Clicked1');
//                   } else {
//                     print('Button Clicked3');
//                   }
//                 },
//                 child: Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                       color: Color(0xff1c1c1c),
//                       borderRadius: BorderRadius.circular(50),
//                       border: Border.all(
//                           width: 1, color: Color.fromARGB(255, 102, 100, 100))
//                     // boxShadow: const [
//                     //   BoxShadow(
//                     //     color: Colors.grey,
//                     //     offset: Offset(0, 3),
//                     //     blurRadius: 7,
//                     //   )
//                     // ],
//                   ),
//                   child: FaIcon(
//                     FontAwesomeIcons.arrowsRotate,
//                     // color: Color.fromARGB(255, 90, 81, 81),
//                     color: Color(0xffd27405),
//                   ),
//                   alignment: Alignment.center,
//                 ),
//               ),
//             ),
//
//             // ! Amount 2
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 100,
//                   child: TextField(
//                     controller: myController2,
//                     keyboardType: TextInputType.number,
//                     style: const TextStyle(color: Colors.white),
//                     textAlign: TextAlign.center,
//                     decoration: InputDecoration(
//                       hintText: amount2,
//
//                       hintStyle: TextStyle(
//                         color: Colors.grey,
//                       ),
//
//                       // ? border
//                       border: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                           color:
//                           Colors.white, // Set the default border color here
//                         ),
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Color(
//                               0xffd27405), // Set the focused border color here
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   // width: 30,
//                   height: 35,
//                   width: 50,
//                   child: Center(
//                     child: Text(
//                       dropdownToValue,
//                       style: const TextStyle(
//                         color: Color(0xffd27405),
//                         fontFamily: 'Poppins',
//                         fontSize: 20,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             //? from
//             // Row(
//             //   children: [
//             //     Padding(
//             //       padding: const EdgeInsets.all(5.0),
//             //       child: Container(
//             //         padding: const EdgeInsets.only(left: 5, right: 5),
//             //         decoration: const BoxDecoration(
//             //           color: Color(0xff1c1c1c),
//             //           boxShadow: [
//             //             BoxShadow(
//             //               color: Colors.black,
//             //               offset: Offset(0, 3),
//             //               blurRadius: 10,
//             //             )
//             //           ],
//             //         ),
//             //         child: DropdownButton<String>(
//             //           value: dropdownFromValue,
//             //           // isExpanded: true,
//             //           items: <String>['ETB', 'USD', 'GBP', 'JPY', 'EUR']
//             //               .map<DropdownMenuItem<String>>((String value) {
//             //             return DropdownMenuItem<String>(
//             //               value: value,
//             //               child: Text(
//             //                 value,
//             //                 style: const TextStyle(
//             //                   color: Color(0xffd27405),
//             //                   fontSize: 16.0,
//             //                 ),
//             //               ),
//             //             );
//             //           }).toList(),
//             //           // Step 5.
//             //           onChanged: (String? newValue) {
//             //             setState(() {
//             //               dropdownFromValue = newValue!;
//             //               print(dropdownFromValue);
//             //             });
//             //           },
//             //         ),
//             //       ),
//             //     ),
//             //     Container(
//             //       width: 200,
//             //       child: TextField(
//             //         decoration: InputDecoration(hintText: 'Amount'),
//             //         controller: myController,
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             // Row(
//             //   children: [
//             //     Padding(
//             //       padding: const EdgeInsets.all(5.0),
//             //       child: Container(
//             //         padding: const EdgeInsets.only(left: 5, right: 5),
//             //         decoration: const BoxDecoration(
//             //           color: Color(0xff1c1c1c),
//             //           boxShadow: [
//             //             BoxShadow(
//             //               color: Colors.black,
//             //               offset: Offset(0, 3),
//             //               blurRadius: 10,
//             //             )
//             //           ],
//             //         ),
//             //         child: DropdownButton<String>(
//             //           value: dropdownToValue,
//             //           // isExpanded: true,
//             //           items: <String>['USD', 'ETB', 'GBP', 'JPY', 'EUR']
//             //               .map<DropdownMenuItem<String>>((String value) {
//             //             return DropdownMenuItem<String>(
//             //               value: value,
//             //               child: Text(
//             //                 value,
//             //                 style: const TextStyle(
//             //                   color: Color(0xffd27405),
//             //                   fontSize: 16.0,
//             //                 ),
//             //               ),
//             //             );
//             //           }).toList(),
//             //           // Step 5.
//             //           onChanged: (String? newValue) {
//             //             setState(() {
//             //               dropdownToValue = newValue!;
//             //               print(dropdownToValue);
//             //             });
//             //           },
//             //         ),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//
//             // TextField(
//             //   controller: myController,
//             // ),
//             // TextField(
//             //   controller: myController2,
//             // ),
//             // TextField(
//             //   controller: myController3,
//             // ),
//             // ElevatedButton(
//             // onPressed: () => currencyConveter(
//             //     myController.text, myController2.text, myController3.text),
//             //   child: const Text('Convert'),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }