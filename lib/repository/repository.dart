import 'package:apis_training/model/model.dart';
import 'package:apis_training/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Repository {

  Future getCryptoPrice (String id) async {
    ApiService apiService = ApiService();
    try{
      var result =  await apiService.getCurrentPrice("https://api.coingecko.com/api/v3/coins/"+id);
      Model model = Model.fromJson(result);
      return model.desiredUsdValue;

    } catch(e){
      print(e.toString());
    }
  }


}