import 'package:bloggistic/screens/FAQ.dart';
import 'package:bloggistic/screens/aboutUs.dart';
import 'package:bloggistic/screens/BlogPage/BlogPage.dart';
import 'package:bloggistic/screens/UploadBlog/uploadBlog.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package

import '../../../constants.dart';
import '../../constants.dart';
import '../Home.dart'; // Import your constants file

class WebMenu extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  WebMenu({super.key}); // Add a constructor with `super.key` for null safety.

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      children: List.generate(
        _controller.menuItems.length,
            (index) => WebMenuItem(
          isActive: index == _controller.selectedIndex.value,
          text: _controller.menuItems[index],
          press: () => _controller.setMenuIndex(index), // Update the selected index
        ),
      ),
    ));
  }
}

class MenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  List<String> get menuItems => ["Home", "Blogs", "Upload Blogs", "About Us", "FAQ"];

  void setMenuIndex(int index) {
    selectedIndex.value = index;
    if (menuItems[index] == "Blogs") {
      Get.to(() => BlogPage()); // Navigate to the BlogPage
    }
    if (menuItems[index] == "Home") {
      Get.to(() => Home()); // Navigate to the BlogPage
    }
    if (menuItems[index] == "Upload Blogs") {
      Get.to(() => UploadBlogPage()); // Navigate to the BlogPage
    }
    if (menuItems[index] == "FAQ") {
      Get.to(() => FAQ()); // Navigate to the BlogPage
    }
    if (menuItems[index] == "About Us") {
      Get.to(() => AboutUsPage()); // Navigate to the BlogPage
    }
  }
}

class WebMenuItem extends StatefulWidget {
  const WebMenuItem({
    Key? key,
    required this.isActive,
    required this.text,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  final String text;
  final VoidCallback press;

  @override
  State<WebMenuItem> createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover=false;
  Color _borderColor() {
    if (widget.isActive) {
      return kPrimaryColor;
    }
    else if (!widget.isActive & _isHover) {
      return kPrimaryColor.withOpacity(0.4);
    }
    return Colors.transparent;




  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value){
        setState(() {
          _isHover=value;
        });
      },
      child: AnimatedContainer(

        duration: kDefaultDuration,
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(

          border: Border(
            bottom: BorderSide(
              color: _borderColor(),
              width: 3,
            ),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 19,
            color: widget.isActive ?kPrimaryColor:Colors.white,
            fontWeight: widget.isActive ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
