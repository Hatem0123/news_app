import 'package:flutter/material.dart';

import 'package:neww_pr_final/views/web_view_screen.dart';

///home screen custom bar
AppBar Custom_app_bar(title_text, List<Widget>? actions) =>
    AppBar(title: title_text, actions: actions);
///home screen custom nav_bar
Widget Custome_bottom_nav_bar({index, items, void Function(int)? ontap}) =>
    BottomNavigationBar(
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      items: items,
      onTap: ontap,
    );
/// screens custom article builder
Widget Build_article_item(article, context) {
  return InkWell(
    onTap: () {
      Navigationito(context, WebViewScreen(url: article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child:
                article['urlToImage'] != null &&
                        article['urlToImage'].toString().isNotEmpty
                    ? Image.network(
                      article['urlToImage'].toString(),
                      fit: BoxFit.cover,
                    )
                    : Image.asset('assets/image/img.jpg', fit: BoxFit.cover),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 125,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${article['title']}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${article['publishedAt']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
///custome texFormField
Widget Default_textformfield({
  required TextEditingController? controller,
  required TextInputType? type,
  required String? hint_text,
  required String? Function(String?)? validate,
  bool obscure_text = false,
  IconData? prefix,
  IconData? suffeixito,
  VoidCallback? suffix_pressed,
  Function(String)? onsubmit,
  void Function()? ontap,
  bool isclicable = true,
  Function(String)? on_change,
}) => TextFormField(
  enabled: isclicable,
  controller: controller,
  onTap: ontap,
  keyboardType: type,
  obscureText: obscure_text,
  onFieldSubmitted: onsubmit,
  validator: validate,
  onChanged: on_change,
  decoration: InputDecoration(
    prefixIcon: Icon(prefix),
    suffixIcon:
        suffeixito != null
            ? IconButton(onPressed: suffix_pressed, icon: Icon(suffeixito))
            : null,
    hintText: hint_text,

    hintStyle: TextStyle(letterSpacing: 4.0, fontWeight: FontWeight.bold),
    border: OutlineInputBorder(),
  ),
);


void Navigationito(context, Widget widget) =>Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
