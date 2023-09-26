import 'package:get/get.dart';
import 'package:luminar_sample_project/Api%20Integration/Api%20Integration%20using%20http/Service/api_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs; //monitor the changes in the variable
  // obx is used for widgets to monitor the changes.
  var productList = [].obs;

//to get the values from the api in the initial state
  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isLoading(true);
      var products = await HttpService.fetchproducts();
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
