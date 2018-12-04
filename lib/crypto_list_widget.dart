import 'package:flutter/material.dart';

class CryptoListWidget extends StatelessWidget {

  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];
  final List _currencies;

  CryptoListWidget(this._currencies);

  Widget _getAppTitleWidget() {
    return new Text(
      'Cryptocurrencies',
      style: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24.0
      )
    );
  }

  CircleAvatar _getLeadingWidget(String currencyName, MaterialColor color) {
    return new CircleAvatar(
      backgroundColor: color,
      child: new Text(currencyName[0]),
    );
  }

  Text _getTitleWidget(String currencyName) {
    return new Text(
      currencyName,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Text _getSubtitleWidget(String priceUsd, String percentChange1h) {
    return new Text('\$$priceUsd\n1 hour: $percentChange1h%');
  }

  ListTile _getListTile(Map currency, MaterialColor color) {
    return new ListTile(
      leading: _getLeadingWidget(currency['name'], color),
      title: _getTitleWidget(currency['name']),
      subtitle: _getSubtitleWidget(
          currency['price_usd'], currency['percent_change_1h']),
      isThreeLine: true,
    );
  }


  Container _getListItemWidget(Map currency, MaterialColor color) {
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Card(
        child: _getListTile(currency, color),
      ),
    );
  }

  Widget _getListViewWidget() {
    return new Flexible(
      child: new ListView.builder(
        itemCount: _currencies.length,
        itemBuilder: (context, index) {
          final Map currency = _currencies[index];
          final MaterialColor color = _colors[index % _colors.length];
          return _getListItemWidget(currency, color);
        },
      ),
    );
  }

  Widget _buildBody() {
    return new Container(
      margin: const EdgeInsets.fromLTRB(8.0,56.0,8.0,0.0),
      child: new Column(
        children: <Widget>[
          _getAppTitleWidget(),
          _getListViewWidget()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      backgroundColor: Colors.blue,
    );
  }
}