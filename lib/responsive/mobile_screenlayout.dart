import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_flutter/colors.dart';
import 'package:google_flutter/mobile/mobile_footer.dart';
import 'package:google_flutter/screens/menu_mobile.dart';
import 'package:google_flutter/web/search_button.dart';
import 'package:google_flutter/web/web_footer.dart';
import 'package:google_flutter/widgets/search.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return MenuItems();
                }));
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.grey,
              ),
            ),
            title: SizedBox(
              width: size.height * 034,
              child: const DefaultTabController(
                length: 2,
                child: TabBar(
                  labelColor: blueColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: blueColor,
                  tabs: [
                    Tab(
                      text: 'ALL',
                    ),
                    Tab(
                      text: 'IMAGES',
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: backgroundColor,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/more-apps.svg',
                    color: primaryColor,
                  )),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0).copyWith(
                  right: 10,
                ),
                child: MaterialButton(
                  onPressed: () {},
                  color: const Color(0xff1A73EB),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                // SizedBox(
                //   height: size.height * 0.25,
                // ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Search(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    const MobileFooter(),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
