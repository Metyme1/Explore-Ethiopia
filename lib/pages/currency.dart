import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatefulWidget {
  @override
  _CurrencyConverterAppState createState() => _CurrencyConverterAppState();
}

class _CurrencyConverterAppState extends State<CurrencyConverterApp> {
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';
  double _amount = 0.0;
  double _result = 0.0;

  Future<void> _convertCurrency() async {
    final url =
        'https://currency-converter-by-api-ninjas.p.rapidapi.com/v1/convertcurrency?have=$_fromCurrency&want=$_toCurrency&amount=$_amount';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'X-RapidAPI-Key': 'e9eebdf3bdmsh451dd0cf277ac32p15f00ejsn4f6111fead58',
        'X-RapidAPI-Host': 'currency-converter-by-api-ninjas.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final result = double.parse(jsonResponse['response']['value']);
      setState(() {
        _result = result;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Currency Converter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'From',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _fromCurrency = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'To',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _toCurrency = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _amount = double.parse(value);
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _convertCurrency,
                child: Text('Convert'),
              ),
              SizedBox(height: 16.0),
              Text(
                '$_amount $_fromCurrency = $_result $_toCurrency',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}