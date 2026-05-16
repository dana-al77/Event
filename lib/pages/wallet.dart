import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/components/servel.dart';

import '../widget/grident_appBar.dart';


class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final TextEditingController _valueController = TextEditingController();
  double balance = 0.0;
  bool _isLoadingBalance = true;
  bool _isLoadingDeposit = false;
  bool _isLoadingWithdraw = false;
  String message = '';

  @override
  void initState() {
    super.initState();
    _fetchBalance();
  }

  Future<void> _fetchBalance() async {
    setState(() {
      _isLoadingBalance = true;
    });

    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');

    final response = await http.get(
      Uri.parse('${SERVERURL.serverURL}api/wallet/showBalance'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        balance = data['balance'].toDouble();
        _isLoadingBalance = false;
      });
    } else {
      setState(() {
        _isLoadingBalance = false;
      });
      throw Exception('Failed to load balance');
    }
  }

  Future<void> _deposit() async {
    final String value = _valueController.text;

    if (value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a value',
        style: TextStyle(fontFamily: 'Angkor',fontSize: 18),),backgroundColor: Colors.purpleAccent[100]),
      );
      return;
    }

    setState(() {
      _isLoadingDeposit = true;
    });

    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      String? token = sharedPref.getString('token');
      final response = await http.post(
        Uri.parse('${SERVERURL.serverURL}api/wallet/deposit'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'value': value,
        }),
      );

      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'],
            style: TextStyle(fontFamily: 'Angkor',fontSize: 18),),backgroundColor: Colors.purpleAccent[100]),
        );
        _fetchBalance();  // تحديث الرصيد بعد الشحن
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'],
            style: TextStyle(fontFamily: 'Angkor',fontSize: 18),),backgroundColor: Colors.purpleAccent[100]),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e',
        style: TextStyle(fontFamily: 'Angkor',fontSize: 18),),backgroundColor: Colors.purpleAccent[100]),
      );
    } finally {
      setState(() {
        _isLoadingDeposit = false;
      });
    }
  }

  Future<void> _withdraw() async {
    final String value = _valueController.text;

    if (value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a value',
          style: TextStyle(fontFamily: 'Angkor',fontSize: 18),),backgroundColor: Colors.purpleAccent[100]),
      );
      return;
    }

    setState(() {
      _isLoadingWithdraw = true;
    });

    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      String? token = sharedPref.getString('token');
      final response = await http.post(
        Uri.parse('${SERVERURL.serverURL}api/wallet/withdraw'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'value': value,
        }),
      );

      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'],
          style: TextStyle(fontFamily: 'Angkor',fontSize: 18),),backgroundColor: Colors.purpleAccent[100]),
        );
        _fetchBalance();  // تحديث الرصيد بعد السحب
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'],
          style: TextStyle(fontFamily: 'Angkor',fontSize: 18),),backgroundColor: Colors.purpleAccent[100]),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e',
        style: TextStyle(fontFamily: 'Angkor',fontSize: 18),),backgroundColor: Colors.purpleAccent[100]),
      );
    } finally {
      setState(() {
        _isLoadingWithdraw = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: 'Wallet'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _isLoadingBalance
                ? CircularProgressIndicator()
                : Card(
              shape: RoundedRectangleBorder(
                //side: BorderSide(color: Colors.purpleAccent),
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 20,
              shadowColor: Colors.purpleAccent,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$${balance.toString()}',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(
                labelText: 'Value',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                  color: Colors.pink, // اللون الزهري للحدود
                  width: 2.0,
                ),),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _isLoadingDeposit
                    ? CircularProgressIndicator()
                    : TextButton(
                  onPressed: _deposit,
                  child: Container(
                    constraints: BoxConstraints.expand(width: 100, height: 50), // تحديد الحجم بشكل صريح
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent[100],
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    clipBehavior: Clip.none, // هذا يمنع العناصر داخل الحاوية من التجاوز خارج حدودها
                    child: Center(
                      child: Text(
                        "Deposit",
                        style: TextStyle(color: Colors.white, fontFamily: 'Angkor', fontSize: 13),
                      ),
                    ),
                  ),
                ),
                _isLoadingWithdraw
                    ? CircularProgressIndicator()
                    : TextButton(
                  onPressed: _withdraw,
                  child: Container(
                    constraints: BoxConstraints.expand(width: 100, height: 50), // تحديد الحجم بشكل صريح
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent[100],
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    clipBehavior: Clip.none, // هذا يمنع العناصر داخل الحاوية من التجاوز خارج حدودها
                    child: Center(
                      child: Text(
                        "WidthDraw",
                        style: TextStyle(color: Colors.white, fontFamily: 'Angkor', fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(message),
          ],
        ),
      ),
    );
  }
}
