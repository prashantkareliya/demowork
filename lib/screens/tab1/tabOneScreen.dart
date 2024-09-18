import 'package:demowork/screens/tab1/tabBarOne.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/custom_text_styles.dart';
import '../../constants/strings.dart';
import '../../utils/app_colors.dart';

class TabOne extends StatefulWidget {
  const TabOne({super.key});

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {
  List<String> tabTitles = ['Tab 1', 'Tab 2', 'Tab 3'];

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Good Morning, Kyle!",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF575757)))),
                    Text("Let’s Start your task",
                        style: CustomTextStyle.labelTextBold),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.grey.shade200),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.notifications_none),
                    ))
              ],
            ),
          ),
          body: Column(
            children: [
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                indicatorWeight: 0.5,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: CustomTextStyle.labelText,
                tabs: const [
                  Tab(
                    text: LabelString.lblToday,
                  ),
                  Tab(text: LabelString.lblHistory),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    TabBarOne(),
                    Center(child: Text("History Tab Content")),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
