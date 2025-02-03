import 'package:get/state_manager.dart';

class MenuController extends GetxController {
  // Observable variable to track the selected index
  final RxInt _selectedIndex = 0.obs;

  // Getter for selected index
  int get selectedIndex => _selectedIndex.value;

  // Menu items
  List<String> get menuItems => ["Home", "Blogs", "Upload Blogs", "About", "FAQ"];

  // Method to set the menu index
  void setMenuIndex(int index) {
    _selectedIndex.value = index;
  }
}
