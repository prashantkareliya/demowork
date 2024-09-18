import 'package:demowork/constants/custom_text_styles.dart';
import 'package:demowork/constants/strings.dart';
import 'package:demowork/screens/dashboard/home_screen.dart';
import 'package:demowork/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/custom_button.dart';
import 'components/custom_textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        title: 'tapp-loyalty.com',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController loginCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                ImageString.imgLogo,
                height: 50.sp,
              ),
            ),
            SizedBox(height: 80.sp),
            Text(LabelString.lblWelcomeBack,
                style: CustomTextStyle.labelTextBold),
            Text(LabelString.lblWelcomeMsg,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 10.sp, color: AppColors.fontColor))),
            SizedBox(height: query.height * 0.04),
            CustomTextField(
              labelText: "Email",
              controller: loginCtrl,
              keyboardType: TextInputType.emailAddress,
              readOnly: false,
              obscureText: false,
              maxLines: 1,
              minLines: 1,
              isRequired: true,
              hint: "Enter email",
              color: AppColors.whiteColor,
            ),
            SizedBox(height: 14.h),
            CustomTextField(
              labelText: "Password",
              controller: passwordCtrl,
              readOnly: false,
              obscureText: !obscure,
              maxLines: 1,
              minLines: 1,
              isRequired: true,
              hint: "Enter Password",
              color: AppColors.whiteColor,
              suffixWidget: Padding(
                padding: EdgeInsets.all(12.sp),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: Icon(obscure
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye)),
              ),
            ),
            SizedBox(height: 0.03.sh),
            SizedBox(
              width: query.width,
              child: CustomButton(
                onClick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                },
                title: LabelString.lblLogin,
                fontColor: AppColors.whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
