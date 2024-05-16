// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _amountController = TextEditingController();
//   final TextEditingController _fromCurrencyController = TextEditingController();
//   final TextEditingController _toCurrencyController = TextEditingController();
//   final TextEditingController _resultController = TextEditingController();
//
//   String _fromCurrency = 'USD';
//   String _toCurrency = 'EUR';
//
//   Future<dynamic> _convertCurrency(String fromCurrency, String amount, String toCurrency) async {
//     final url = Uri.parse(
//         'https://currency-converter-by-api-ninjas.p.rapidapi.com/v1/convertcurrency?have=$fromCurrency&want=$toCurrency&amount=$amount');
//     final headers = {
//       'X-RapidAPI-Key': 'f0bc241e31mshbb59e761d9eb84ap143052jsn93486e4a07a0',
//       'X-RapidAPI-Host': 'currency-converter-by-api-ninjas.p.rapidapi.com'
//     };
//
//     try {
//       final response = await http.get(url, headers: headers);
//       final result = response.body;
//       Map<String, dynamic> data = json.decode(result);
//       double newAmount = data['result']?.toDouble() ?? 0.0;
//
//       setState(() {
//         _resultController.text = newAmount.toStringAsFixed(2);
//       });
//     } catch (error) {
//       print(error);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _amountController,
//                       keyboardType: TextInputType.numberWithOptions(decimal: true),
//                       decoration: InputDecoration(
//                         labelText: 'Amount',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 16.0),
//                   Expanded(
//                     child: DropdownButtonFormField(
//                       value: _fromCurrency,
//                       onChanged: (value) {
//                         setState(() {
//                           _fromCurrency = value.toString();
//                         });
//                       },
//                       items: [
//                         DropdownMenuItem(
//                           value: 'USD',
//                           child: Row(
//                             children: [
//                               Icon(CountryIcons.us),
//                               SizedBox(width: 8.0),
//                               Text('USD'),
//                             ],
//                           ),
//                         ),
//                         DropdownMenuItem(
//                           value: 'EUR',
//                           child: Row(
//                             children: [
//                               Icon(CountryIcons.eu),
//                               SizedBox(width: 8.0),
//                               Text('EUR'),
//                             ],
//                           ),
//                         ),
//                         // Add more currencies here
//                       ],
//                       decoration: InputDecoration(
//                         labelText: 'From Currency',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _toCurrencyController,
//                       decoration: InputDecoration(
//                         labelText: 'To Currency',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 16.0),
//                   Expanded(
//                     child: DropdownButtonFormField(
//                       value: _toCurrency,
//                       onChanged: (value) {
//                         setState(() {
//                           _toCurrency = value.toString();
//                         });
//                       },
//                       items: [
//                         DropdownMenuItem(
//                           value: 'USD',
//                           child: Row(
//                             children: [
//                               Icon(CountryIcons.us),
//                               SizedBox(width: 8.0),
//                               Text('USD'),
//                             ],
//                           ),
//                         ),
//                         DropdownMenuItem(
//                           value: 'EUR',
//                           child: Row(
//                             children: [
//                               Icon(CountryIcons.eu),
//                               SizedBox(width: 8.0),
//                               Text('EUR'),
//                             ],
//                           ),
//                         ),
//                         // Add more currencies here
//                       ],
//                       decoration: InputDecoration(
//                         labelText: 'To Currency',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   String amount = _amountController.text;
//                   String fromCurrency = _fromCurrencyController.text;
//                   String toCurrency = _toCurrencyController.text;
//
//                   await _convertCurrency(fromCurrency, amount, toCurrency);
//                 },
//                 child: Text('Convert'),
//               ),
//               SizedBox(height: 16.0),
//               TextField(
//                 controller: _resultController,
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   labelText: 'Result',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
