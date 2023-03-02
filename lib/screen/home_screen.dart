import 'package:apis_training/repository/repository.dart';
import 'package:apis_training/utils/assets.dart';
import 'package:apis_training/utils/list_helper.dart';
import 'package:apis_training/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  String usd = '0';
  String cryptoSelected = '';

  Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('CRYPTO TO USD(\$) - CONVERTER'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.cryptoImage, width: 120, height: 120,),
                  SizedBox(width: 10,),
                  Text('===', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Image.asset(Assets.dollarsImage, width: 120, height: 120,),
                ],
              ),
              SizedBox(height: 50,),
              Text(
                "This application allows us to know the equivalent of bitcoin and cardano cryptocurrencies in dollars, instantly..",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 40,),
              DropdownButtonFormField(
                decoration: textFieldDecor(hintText: 'Choose a crypto type'),
                items: ListHelper.listCryptos
                    .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 13),
                        )))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    cryptoSelected = value!;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      var result =
                          await repository.getCryptoPrice(cryptoSelected);
                      setState(() {
                        usd = result.toString();
                      });
                    },
                    child: Text('Convert', style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
              SizedBox(
                height: 35,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.black,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Result = $usd \$',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
