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

  Future<void> _convertCurrency(String fromCurrency, String amount, String toCurrency) async {
    final url = Uri.parse(
        'https://currency-converter-by-api-ninjas.p.rapidapi.com/v1/convertcurrency?have=$fromCurrency&want=$toCurrency&amount=$amount');
    final headers = {
      'X-RapidAPI-Key': 'f0bc241e31mshbb59e761d9eb84ap143052jsn93486e4a07a0',
      'X-RapidAPI-Host': 'currency-converter-by-api-ninjas.p.rapidapi.com'
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final result = response.body;
        Map<String, dynamic> data = json.decode(result);
        double newAmount = data['new_amount']?.toDouble() ?? 0.0;
        print('Conversion result: $newAmount');

        setState(() {
          _result = newAmount.toStringAsFixed(2);
          _toAmountController.text = _result;
        });
      } else {
        print('API request failed with status code ${response.statusCode}');
        // Display error message to user
        setState(() {
          _result = 'Error: ${response.statusCode}';
          _toAmountController.text = '';
        });
      }
    } catch (error) {
      print('API request failed with error: $error');
      // Display error message to user
      setState(() {
        _result = 'Error: $error';
        _toAmountController.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // Set the height of the AppBar
        child: AppBar(
          backgroundColor: Colors.brown, // Set the background color of the AppBar
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              // bottom: Radius.circular(30),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text('Currency Converter'),
          ),
        ),
      ),
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
                            color: Colors.brown,
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
                String fromAmount = _fromAmountController.text.toString();
                if (fromAmount.isEmpty) return;
                await _convertCurrency(
                    _fromCurrency, fromAmount ,_toCurrency);

              },
              icon: Icon(Icons.swap_vert),
              label: Text('Exchange'),
              style: ElevatedButton.styleFrom(
                primary: Colors.brown,
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
                            color: Colors.brown,
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
}