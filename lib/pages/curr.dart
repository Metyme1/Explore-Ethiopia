import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Currency extends StatefulWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  State<Currency> createState() => _CurrencyState();
}


class _Currency extends StatefulWidget {
  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  final TextEditingController _fromAmountController = TextEditingController();
  final TextEditingController _toAmountController = TextEditingController();

  String _fromCurrency = 'USD';
  String _toCurrency = 'ETH';
  String _result = '';

  List<String> _currencies = [
    'USD',
    'CAD',
    'EUR',
    'ETH',
    'JPY',
    'CNY',
    'INR',
    'GBP',
    'AUD',
    'BRL'

  ];

  //
  // Future<double> _convertCurrency(String fromCurrency, String amount, String toCurrency) async {
  //   final url = Uri.parse(
  //       'https://currency-converter-by-api-ninjas.p.rapidapi.com/v1/convertcurrency?have=$fromCurrency&want=$toCurrency&amount=$amount');
  //   final headers = {
  //     'X-RapidAPI-Key': 'f0bc241e31mshbb59e761d9eb84ap143052jsn93486e4a07a0',
  //     'X-RapidAPI-Host': 'currency-converter-by-api-ninjas.p.rapidapi.com',
  //   };
  //
  //   try {
  //     final response = await http.get(url, headers: headers);
  //     if (response.statusCode >= 200 && response.statusCode < 300) {
  //       final result = response.body;
  //       Map<String, dynamic> data = json.decode(result);
  //       double newAmount = data['result']?.toDouble() ?? 0.0;
  //       setState(() {
  //         _result = newAmount.toStringAsFixed(2);
  //       });
  //       return newAmount;
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //       return 0.0;
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //     return 0.0;
  //   }
  // }
  // Future<Map<String, dynamic>> getExchangeRates(String baseCurrency) async {
  //   String apiKey = 'f0bc241e31mshbb59e761d9eb84ap143052jsn93486e4a07a0'; // Replace with your API key
  //   String apiUrl = 'http://data.fixer.io/api/latest?access_key=$apiKey&base=$baseCurrency';
  //   http.Response response = await http.get(Uri.parse(apiUrl));
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = json.decode(response.body);
  //     return data['rates'];
  //   } else {
  //     throw Exception('Failed to load exchange rates');
  //   }
  // }
  Future<dynamic> _convertCurrency(String fromCurrency, String amount,
      String toCurrency) async {
    final url = Uri.parse(
        'https://currency-converter-by-api-ninjas.p.rapidapi.com/v1/convertcurrency?have=$fromCurrency&want=$toCurrency&amount=$amount');
    final headers = {
      'X-RapidAPI-Key': 'f0bc241e31mshbb59e761d9eb84ap143052jsn93486e4a07a0',
      'X-RapidAPI-Host': 'currency-converter-by-api-ninjas.p.rapidapi.com'
    };

    try {
      final response = await http.get(url, headers: headers);
      final result = response.body;
      Map<String, dynamic> data = json.decode(result);
      double newAmount = data['result']?.toDouble() ?? 0.0;
      setState(() {
        _result = newAmount.toString();
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100.0), // Set the height of the AppBar
      //   child: AppBar(
      //     backgroundColor: Colors.teal, // Set the background color of the AppBar
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.vertical(
      //         bottom: Radius.circular(30),
      //       ),
      //     ),
      //     //  title: Center(child: Text('Discover Ethiopia')),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 80,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<String>(
                      value: _fromCurrency,
                      onChanged: (String? newValue) {
                        setState(() {
                          _fromCurrency = newValue!;
                        });
                      },
                      items: _currencies
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: <Widget>[
                              Text(
                                getCurrencyFlag(value),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 8),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: _fromAmountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16,
                              horizontal: 12),
                          labelStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onChanged: (value) => setState(() {}),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () async {
                String fromAmount = _fromAmountController.text;
                if (fromAmount.isEmpty) return;
                await _convertCurrency(
                    _fromCurrency, fromAmount, _toCurrency);
                _toAmountController.text = _result;
              },
              icon: Icon(Icons.swap_vert),
              label: Text('Exchange'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                elevation: 5,
                shadowColor: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 70,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<String>(
                      value: _toCurrency,
                      onChanged: (String? newValue) {
                        setState(() {
                          _toCurrency = newValue!;
                        });
                      },
                      items: _currencies
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: <Widget>[
                              Text(
                                getCurrencyFlag(value),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 8),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: _toAmountController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Converted Amount',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16,
                              horizontal: 12),
                          labelStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

          ],
        ),
      ),
    );
  }

  String getCurrencyFlag(String currencyCode) {
    switch (currencyCode) {
      case 'USD':
        return '🇺🇸';
      case 'CAD':
        return '🇨🇦';
      case 'EUR':
        return '🇪🇺';
      case 'ETH':
        return '🇪🇹';
      case 'JPY':
        return '🇯🇵';
      case 'CNY':
        return '🇨🇳';
      case 'INR':
        return '🇮🇳';
      case 'GBP':
        return '🇬🇧';
      case 'AUD':
        return '🇦🇺';
      case 'BRL':
        return '🇧🇷';

      default:
        return '';
    }
  }


//
// class _CurrencyState extends State<Currency> {
//   String? _fromCurrency;
//   String? _toCurrency;
//   final myController = TextEditingController();
//   String _output = "";
//
//   Future<dynamic> CurrencyConverter(
//       String from, String amount, String to) async {
//     final url = Uri.parse(
//         'https://currency-converter-by-api-ninjas.p.rapidapi.com/v1/convertcurrency?have=$from&want=$to&amount=$amount');
//     final headers = {
//       'X-RapidAPI-Key': 'f0bc241e31mshbb59e761d9eb84ap143052jsn93486e4a07a0',
//       'X-RapidAPI-Host': 'currency-converter-by-api-ninjas.p.rapidapi.com'
//     };
//     try {
//       final response = await http.get(url, headers: headers);
//       final result = response.body;
//       Map<String, dynamic> data = json.decode(result);
//       double newAmount = data['result']?.toDouble() ?? 0.0;
//       setState(() {
//         _output = newAmount.toStringAsFixed(2);
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
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text('Currency Converter'),
//         centerTitle: true,
//         backgroundColor: Colors.teal,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               DropdownButtonFormField<String>(
//                 value: _fromCurrency,
//                 decoration: InputDecoration(
//                   labelText: 'From',
//                   border: OutlineInputBorder(),
//                   isDense: true,
//                 ),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _fromCurrency = newValue;
//                   });
//                 },
//                 items: <String>[
//                   'USD',
//                   'EUR',
//                   'GBP',
//                   'INR',
//                   'JPY',
//                   'CAD',
//                   'AUD',
//                   'CHF',
//                   'CNY',
//                   'SEK',
//                   'ETB',
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 8),
//               TextField(
//                 controller: myController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Amount',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 value: _toCurrency,
//                 decoration: InputDecoration(
//                   labelText: 'To',
//                   border: OutlineInputBorder(),
//                   isDense: true,
//                 ),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _toCurrency = newValue;
//                   });
//                 },
//                 items: <String>[
//                   'USD',
//                   'EUR',
//                   'GBP',
//                   'INR',
//                   'JPY',
//                   'CAD',
//                   'AUD',
//                   'CHF',
//                   'CNY',
//                   'SEK',
//                   'ETB',
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () => CurrencyConverter(
//                   _fromCurrency!,
//                   myController.text,
//                   _toCurrency!,
//                 ),
//                 child: Text('Convert'),
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   padding: MaterialStateProperty.all<EdgeInsets>(
//                     EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//                   ),
//                   textStyle: MaterialStateProperty.all<TextStyle>(
//                     TextStyle(fontSize: 18),
//                   ),
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                     Colors.teal,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               if (_output.isNotEmpty)
//                 Text(
//                   '$_output $_toCurrency',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 24),
//                 ),
//             ],
//           ),
//         ),
//       )
}