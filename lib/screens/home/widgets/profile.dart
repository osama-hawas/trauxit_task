import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> profileItems = {
    "icon": [
      'assets/icons/png/user.png',
      'assets/icons/png/wallet.png',
      'assets/icons/png/location.png',
      'assets/icons/png/wallet.png',
      'assets/icons/png/question.png',
      'assets/icons/png/question.png',
      'assets/icons/png/check.png',
      'assets/icons/png/contact.png',
      'assets/icons/png/edit.png',
      'assets/icons/png/share.png',
      'assets/icons/png/about_app.png',
      'assets/icons/png/lang.png',
      'assets/icons/png/note.png',
      'assets/icons/png/star.png',
    ],
    "title": [
      'Personal data',
      'Portfolio',
      'addresses',
      'paying off',
      'FAQs',
      'VIP account',
      'privacy',
      'Connect with us',
      'suggestions',
      'Share the app',
      'about app',
      'Change language',
      'Terms and Conditions',
      'rate app',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            profileItems["icon"].length,
            (index) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        profileItems['icon'][index],
                        color: Theme.of(context).primaryColor.withOpacity(.5),
                        fit: BoxFit.scaleDown,
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Text(
                        profileItems['title'][index],
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).primaryColor.withOpacity(.3),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
