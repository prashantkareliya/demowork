import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/strings.dart';
import '../../utils/app_colors.dart';
import '../tab1/tabOneScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int pageIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: InkWell(
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),

            /* onPageChanged: (index) {
              setState(() => _selectedIndex = index);
            },*/
            //physics: const NeverScrollableScrollPhysics(),
            children: [
              const TabOne(),
              Container(
                color: Colors.lightBlueAccent,
              ),
              Container(
                color: Colors.black38,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          elevation: 2,
          showSelectedLabels: true,
          showUnselectedLabels: true,

          fixedColor: Colors.transparent,
          selectedLabelStyle: GoogleFonts.poppins(
              textStyle:
                  TextStyle(fontSize: 12.sp, color: AppColors.primaryColor)),
          unselectedLabelStyle: GoogleFonts.poppins(
              textStyle:
                  TextStyle(fontSize: 12.sp, color: AppColors.primaryColor)),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageString.icTab1,
                height: 30.sp,
                color: AppColors.fontColor,
              ),
              label: "Home",
              activeIcon: SvgPicture.asset(ImageString.icTab1,
                  height: 30.sp, color: AppColors.primaryColor),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                height: 30.sp,
                ImageString.icTab2,
                color: AppColors.fontColor,
              ),
              label: "Projects",
              activeIcon: SvgPicture.asset(ImageString.icTab2,
                  height: 30.sp, color: AppColors.primaryColor),
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(50.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                    size: 35,
                  ),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  height: 30.sp,
                  ImageString.icTab3,
                  color: AppColors.fontColor),
              label: "Calender",
              activeIcon: SvgPicture.asset(
                  height: 30.sp,
                  ImageString.icTab3,
                  color: AppColors.primaryColor),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageString.icTab4,
                height: 30.sp,
                color: AppColors.fontColor,
              ),
              label: "Account",
              activeIcon: SvgPicture.asset(
                ImageString.icTab4,
                height: 30.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    pageIndex = index;
    _pageController.jumpToPage(index);
    setState(() {});
  }
}
