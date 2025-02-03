import 'package:flutter/material.dart';

// FoodBlog Model
class FoodBlog {
  final String? Fooddate, Foodtitle, Fooddescription, Foodimage;

  FoodBlog({this.Fooddate, this.Foodtitle, this.Fooddescription, this.Foodimage});
}

// Sample FoodBlog List (You will have this updated with actual data from the UploadBlogPage)
List<FoodBlog> FoodblogPosts = [
  FoodBlog(
    Fooddate: "23 September 2020",
    Foodimage: "assets/images/2.png",
    Foodtitle: "The Principles of Dark UI Design",
    Fooddescription:
    "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.",
  ),
];

class FoodBlogPage extends StatelessWidget {
  const FoodBlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Blogs"),
      ),
      body: ListView.builder(
        itemCount: FoodblogPosts.length,
        itemBuilder: (context, index) {
          final post = FoodblogPosts[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.Foodtitle ?? "Untitled",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    post.Fooddescription ?? "No description available.",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  post.Foodimage != null
                      ? Image.asset(post.Foodimage ?? "")
                      : const SizedBox.shrink(),
                  const SizedBox(height: 10),
                  Text(
                    "Published on: ${post.Fooddate}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
