
import 'package:shared_preferences/shared_preferences.dart';

class OrderDataVM {
    int Id;
    String OrderDate_Txt;
    String OrderServices;
    double Price;

    OrderDataVM({this.Id,this.OrderDate_Txt, this.OrderServices,this.Price});

    factory OrderDataVM.fromJson(Map<String, dynamic> json) {
        return OrderDataVM(
            Id: int.parse("${json['Id']}"), 
            OrderDate_Txt: json['OrderDate_Txt'], 
            OrderServices: json['OrderServices'], 
            Price: double.parse("${json['Price']}"),
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['Id'] = this.Id;
        data['OrderDate_Txt'] = this.OrderDate_Txt;
        data['OrderServices'] = this.OrderServices;
        data['Price'] = this.Price;
        
        return data;
    }
}
Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear() ;

    return true ;
}

