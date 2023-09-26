import 'package:luminar_sample_project/Api%20Integration/Api%20Integration%20using%20http/Model/product_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<List<ProductModel>> fetchproducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var data = response.body;
      return productModelFromJson(data);
    } else {
      throw Exception();
    }
  }
}
