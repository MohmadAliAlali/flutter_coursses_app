import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';
import 'package:project_stud/core/global_text_style.dart';
import 'package:project_stud/core/respnsive.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String text;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(padding:  EdgeInsets.only(left: 16.w , right: 16.w ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  $text',
          style: GlobalTextStyle.body,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 48.h,
          width: 345.w,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
              GlobalTextStyle.body.copyWith(color: GlobalColor.hintColor),
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0.w),
              ),
            ),
          ),
        )
      ],
    ),
    );
  }
}



class CustomTextFieldSearch extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String text;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextFieldSearch({
    super.key,
    required this.controller,
    required this.text,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  CustomTextFieldSearchState createState() => CustomTextFieldSearchState();
}

class CustomTextFieldSearchState extends State<CustomTextFieldSearch> {
  late FocusNode _focusNode;
  bool _isTextEmpty = true;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _isTextEmpty = widget.controller.text.isEmpty;
    _focusNode.addListener(_onFocusChanged);
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    widget.controller.removeListener(_onTextChanged);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _onTextChanged() {
    setState(() {
      _isTextEmpty = widget.controller.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            width: 345,
            child: TextFormField(
              focusNode: _focusNode,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText,
              validator: widget.validator,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: GlobalTextStyle.body.copyWith(
                  color: GlobalColor.hintColor,
                ),
                prefixIcon: (!_isFocused && _isTextEmpty && widget.prefixIcon != null)
                    ? Icon(widget.prefixIcon)
                    : null,
                suffixIcon: widget.suffixIcon != null
                    ? Icon(widget.suffixIcon)
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFieldConfirm extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextFieldConfirm({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.number,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding:const EdgeInsets.only(right: 6,left: 6),
          child: SizedBox(
            height: 100,
            width: 74,
            child: TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                obscureText: obscureText,
                validator: validator,
                maxLength: 1,
                style: GlobalTextStyle.heading.copyWith(fontSize: 40),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:const EdgeInsets.symmetric(vertical: 12,horizontal: 0),
                  prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                  suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                )
            ),
          ),
    );
  }
}
