import 'package:apis_training/repository/repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final TextEditingController controller = TextEditingController();

   String ada = '0';
   String usd = '0';

   Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BITCOIN TO USD CONVERTER'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(
                onPressed: () async{
              var result = await repository.getCryptoPrice('bitcoin');
              setState(() {
                ada = controller.text;
                usd = result.toString();
              });
            }, child: Text('Convert')),
            Text('$ada ADA', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text('$usd \$', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
