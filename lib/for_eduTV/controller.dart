import 'package:get/get.dart';
import 'package:restapi_testing/for_eduTV/api.dart';
import 'package:restapi_testing/for_eduTV/model.dart';

class EduTvController extends GetxController {
  var latestData = <EduTvModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPopularCourses();
  }

  Future<void> fetchPopularCourses() async {
    try {
      List<EduTvModel> response = await EduTvAPI.fetchCategoriesData(
          "https://admin.edubd.tv/api/v1/courses/latest?page");
      latestData.assignAll(response);
    } catch (e) {
      print("Error fetching data: $e");
    } finally {}
  }
}
