import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;

  const MainButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: SizedBox(
          height: 30.w,
          width: 30.w,
          child: const FittedBox(
            fit: BoxFit.scaleDown,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ElevatedButton(
          onPressed: () {
            FocusManager.instance.primaryFocus!.unfocus();
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
            elevation: 0,
            minimumSize: Size(double.infinity, 60.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(text),
          ),
        ),
      );
    }
  }
}
