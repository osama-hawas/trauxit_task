import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum InputType { pass, normal }

class MainTextField extends StatefulWidget {
  final String text;
  void Function(String)? onChanged;
  final InputType type;
  final int minLines;
  final VoidCallback? onPress;

  final IconData? prefixIcon;

  final TextEditingController? controller;
  bool isObscure, isVisable = true;

  MainTextField({
    Key? key,
    required this.text,
    this.isObscure = false,
    this.type = InputType.normal,
    this.minLines = 1,
    this.controller,
    this.prefixIcon, this.onPress,
  }) : super(key: key);

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: TextFormField(
          keyboardType: widget.type == InputType.pass
              ? TextInputType.visiblePassword
              : TextInputType.text,
          validator: (data) {
            if (data!.isEmpty) {
              return 'Field is empty';
            } else {
              return null;
            }
          },
          controller: widget.controller,
          minLines: widget.minLines,
          maxLines: widget.isObscure ? 1 : null,
          textInputAction: TextInputAction.next,
          obscureText: widget.isObscure,
          enabled: widget.onPress == null,

          decoration: InputDecoration(
            filled: true,
            suffixIcon: widget.type == InputType.pass
                ? GestureDetector(
                    onTap: () {
                      widget.isVisable = !widget.isVisable;
                      widget.isObscure = !widget.isObscure;
                      setState(() {});
                    },
                    child: widget.isVisable
                        ? const Icon(Icons.visibility_sharp)
                        : const Icon(Icons.visibility_off_sharp))
                : null,
            fillColor: Colors.white,
            labelText: widget.text,
            alignLabelWithHint: true,
            labelStyle: TextStyle(color: Theme.of(context).hintColor),
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                   widget.prefixIcon,
                    size: 20,
                  )
                : null,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          ),
        ),
      ),
    );
  }
}
