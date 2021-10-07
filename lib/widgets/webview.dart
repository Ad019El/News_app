import 'package:new_app/models/news.dart';
import 'package:new_app/widgets/appbar_ListTile.dart';
import 'package:new_app/widgets/cyrcle_buttom.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  final url;
  // bool isLoading = true;
  WebViewPage({required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("this.title"),
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: Column(children: [
            ListTile(
              title: appbar_ListTile(),
              leading: CircleButton(
                icon: Icons.arrow_back_ios,
                onTap: () => {Navigator.pop(context)},
              ),
            ),
          ]),
        ),
      ),
      body: Stack(
        children: [
          WebView(
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
              initialUrl: this.widget.url,
              javascriptMode: JavascriptMode.unrestricted),
          isLoading ? Center(child: CircularProgressIndicator()) : Stack()
        ],
      ),
    );
  }
}

// class WebViewPage extends StatefulWidget {
//   final String url;

//   WebViewPage(this.url);

//   @override
//   WebViewPageState createState() => WebViewPageState(this.url);
// }

// class WebViewPageState extends State<WebViewPage> {
//   final String url;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Enable hybrid composition.
//   //   WebView.platform = SurfaceAndroidWebView();
//   // }

//   WebViewPageState(this.url);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("this.title"),
//       // ),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(20),
//         child: Column(children: [
//           appbar_ListTile(),
//         ]),
//       ),
//       body: Column(children: [
//         Expanded(
//           child: WebView(
//               initialUrl: this.url,
//               javascriptMode: JavascriptMode.unrestricted),
//         ),
//       ]),
//     );
//   }
// }
