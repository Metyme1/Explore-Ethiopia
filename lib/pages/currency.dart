import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Currency extends StatefulWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  // from
  String? _fromCurrency;
  // amount
  final myController2 = TextEditingController();
  // to
  String? _toCurrency;

  String _output = "";
  // converter
  Future<dynamic> CurrencyConveter(String from, String amount, String to) async {
    final url = Uri.parse(
        'https://currency-converter-by-api-ninjas.p.rapidapi.com/v1/convertcurrency?have=$from&want=$to&amount=$amount');
    final headers = {
      'X-RapidAPI-Key': 'be7a58fecbmsh61cc619f8964da9p15b2fbjsnf44ff427ddf2',
      'X-RapidAPI-Host': 'currency-converter-by-api-ninjas.p.rapidapi.com'
    };

    try {
      final response = await http.get(url, headers: headers);
      final result = response.body;
      Map<String, dynamic> data = json.decode(result);
      double newAmount = data['new_amount']?.toDouble() ?? 0.0;
      setState(() {
        _output = newAmount.toString();
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
    onPressed: () {
    Navigator.pop(context);
    },
        ),
       // title: Text('Currency Converter'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: DropdownButtonFormField<String>(
                  value: _fromCurrency,
                  decoration: InputDecoration(
                    labelText: 'From Currency',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _fromCurrency = newValue;
                    });
                  },
                  items: <String>[
                    'USD',
                    'EUR',
                    'GBP',
                    'INR',
                    'JPY',
                    'CAD',
                    'AUD',
                    'CHF',
                    'CNY',
                    'SEK',
                    'ETB',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: myController2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: DropdownButtonFormField<String>(
                  value: _toCurrency,
                  decoration: InputDecoration(
                    labelText: 'To Currency',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _toCurrency = newValue;
                    });
                  },
                  items: <String>[
                    'USD',
                    'EUR',
                    'GBP',
                    'INR',
                    'JPY',
                    'CAD',
                    'AUD',
                    'CHF',
                    'CNY',
                    'SEK',
                    'ETB',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // do something
                },
                child: Text('Click me'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 18),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.brown,
                  ),
                ),
              ),
              SizedBox(height: 20),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Text(
                  _output,
                  key: ValueKey<String>(_output),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}