import 'package:flutter/material.dart';
import 'package:google_flutter/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class SearchResultComponent extends StatefulWidget {

  final String link;
  final String text;
  final String linkToGo;
  final String desc;
  const SearchResultComponent(
      {super.key,
      required this.link,
      required this.text,
      required this.linkToGo,
      required this.desc});



  @override
  State<SearchResultComponent> createState() => _SearchResultComponentState();
}

class _SearchResultComponentState extends State<SearchResultComponent> {
  bool _showUnderline = false;

  @override
  Widget build(BuildContext context) {

    final UrlLauncherPlatform launcher = UrlLauncherPlatform.instance;
    Future<void> _launchInWebViewWithJavaScript(String url) async {
      if (!await launcher.launch(
        url,
        useSafariVC: true,
        useWebView: true,
        enableJavaScript: true,
        enableDomStorage: false,
        universalLinksOnly: false,
        headers: <String, String>{},
      )) {
        throw Exception('Could not launch $url');
      }
    }



    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.link),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: ()=>setState(() {
              _launchInWebViewWithJavaScript(widget.linkToGo);
            }),
            // onTap: () async {
            //   if (await canLaunch(widget.linkToGo)) {
            //     await launch(
            //       widget.linkToGo,
            //       forceWebView: true,
            //         forceSafariVC: false,
            //
            //         enableJavaScript: true,
            //         enableDomStorage: true,
            //         universalLinksOnly: true
            //     );
            //   }
            // },
            onHover: (hovering) {
              setState(() {
                _showUnderline = hovering;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.link,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF202124),
                  ),
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: blueColor,
                    decoration: _showUnderline
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          widget.desc,
          style: TextStyle(fontSize: 14, color: primaryColor),
        ),

        SizedBox(height: 10,),
      ],
    );
  }
}
