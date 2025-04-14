import 'package:flutter/material.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/core/helper/respnsive.dart';

class CoursersTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String text;
  final Color color;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? errorMessage;
  final String? Function(String?)? validator;
  final double pt;
  final double pb;
  final double pl;
  final double pr;
  final double height;
  final int maxL;
  final int minL;

  const CoursersTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.text,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.color = GlobalColor.hintColor,
    this.pt = 0,
    this.pb = 0,
    this.pl = 0,
    this.pr = 0,
    this.height = 80,
    this.minL = 1,
    this.maxL = 1,
    this.errorMessage,
  });

  @override
  CoursersTextFieldState createState() => CoursersTextFieldState();
}

class CoursersTextFieldState extends State<CoursersTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: widget.pt, left: widget.pl, right: widget.pr, bottom: widget.pb),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: GlobalTextStyle.text16Black400,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: widget.height.h,
            width: 329.0.w,
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: _obscureText,
              validator: widget.validator,
              style: GlobalTextStyle.text16Black400,
              minLines: widget.minL,
              maxLines: widget.maxL,
              // keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                errorText: widget.errorMessage,
                errorStyle: GlobalTextStyle.text14blueLight400
                    .copyWith(color: Colors.red),
                helperText: ' ',
                helperStyle: GlobalTextStyle.text14blueLight400
                    .copyWith(color: Colors.red),
                // contentPadding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.5.r),
                  borderSide: BorderSide(color: widget.color),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.5.r),
                  borderSide: BorderSide(color: widget.color),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.5.r),
                  borderSide: BorderSide(color: widget.color),
                ),
                hintText: widget.hintText,
                hintStyle: GlobalTextStyle.text16Gray400,
                prefixIcon: widget.prefixIcon != null
                    ? Icon(widget.prefixIcon, size: 25.0.e)
                    : null,
                prefixIconConstraints:BoxConstraints(
                  minHeight: 40.h,
                  minWidth: 40.w,
                ),
                suffixIconConstraints: BoxConstraints(
                  minHeight: 40.h,
                  minWidth: 40.w,
                ),
                suffixIcon: widget.suffixIcon != null
                    ? InkWell(
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 25.0.e,
                        ),
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
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
                hintStyle: GlobalTextStyle.text16Black400.copyWith(
                  color: GlobalColor.gray2,
                ),
                prefixIcon:
                    (!_isFocused && _isTextEmpty && widget.prefixIcon != null)
                        ? Icon(widget.prefixIcon)
                        : null,
                suffixIcon:
                    widget.suffixIcon != null ? Icon(widget.suffixIcon) : null,
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

class ConfirmationCodeInput extends StatelessWidget {
  final onCompleted;
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  ConfirmationCodeInput({
    super.key,
    required this.onCompleted,
  });

  String getCombinedCode() {
    return _controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: 70.w,
          height: 70.h,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              border: const OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 60.h),
            ),
            onChanged: (value) {
              if (value.length == 1) {
                if (index < 3) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else {
                  // All fields are filled, so we can call onCompleted with the combined code
                  onCompleted(getCombinedCode());
                }
              } else if (index > 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
            },
          ),
        );
      }),
    );
  }
}
