import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),

      width: double.infinity,


      decoration: BoxDecoration(


          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding/2))

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Search",style: TextStyle(color: kDarkBlackColor,fontWeight: FontWeight.w600),),
          const SizedBox(height: kDefaultPadding/4,),
          TextField(
            decoration: InputDecoration(
              hintText: "Type Here",
              suffixIcon: Padding(padding:const EdgeInsets.all(kDefaultPadding/2),
                child: SvgPicture.asset("assets/icons/feather_search.svg"),
              )
              ,

              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding/2),),),
            ),
          )
        ],
      ),
    );
  }
}
