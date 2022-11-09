import 'package:get/get.dart';

class BedRoomController extends GetxController {
  List products = [].obs;
  RxString personBedroomController = ''.obs;
  RxString bedroomLength = "".obs;
  RxInt bedroom = 0.obs;
  RxInt bedRoomFloor = 0.obs;
  RxString? bedRoomWidth = "".obs;
  RxString bedRoomArea = "".obs;
  RxString? bedRoomToiletLength = "".obs;
  RxString? bedRoomToiletWidth = "".obs;
  RxString? bedRoomToiletArea = "".obs;
  RxString? bedRoomToiletReqText = "".obs;
  RxString? bedroomDressRequirment = "".obs;
  RxString? bedroomDressLength = "".obs;
  RxString? bedroomDressWidth = "".obs;
  RxString? bedroomDressArea = "".obs;
  RxString? bedroomDressFacility = "".obs;
  RxString? bedroomDressRequirmentText = "".obs;
  RxString? bedroomImg = "".obs;
  RxString? bedroomFacility = "".obs;
  RxString? bedroomFacilityRequirementText = "".obs;
  RxString? selectedFloor = "select Floor".obs;
}
