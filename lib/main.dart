import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto_list/crypto_list_widget.dart';


void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(
    new MaterialApp(
      title: 'Crypto Diary',
      home: new CryptoListWidget(currencies)
    )
  );
}

Future<List> getCurrencies() async {
  String url = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}