import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool showSuffix;
  final bool showSuffixdate;
  final VoidCallback? onSuffixTap;
  final Function(String)? onChanged;

  final VoidCallback? onSuffixTapdate;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final Color borderColor, enabledBorder;
  final int? lengthword, maxLength;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final Widget? labelplaceholername;

  const CustomTextField(
      {Key? key,
      this.validator,
      this.obscureText = false,
      this.showSuffix = false,
      this.showSuffixdate = false,
      this.onSuffixTapdate,
      this.onSuffixTap,
      this.onChanged,
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none,
      this.controller,
      this.maxLines = 1,
      this.minLines,
      this.readOnly = false,
      this.maxLength,
      this.lengthword,
      this.borderColor = Colors.white,
      this.focusNode,
      this.onSubmitted,
      this.enabledBorder = Colors.grey,
      this.labelplaceholername})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          controller: controller,
          maxLines: maxLines,
          minLines: minLines,
          readOnly: readOnly,
          maxLength: maxLength,
          focusNode: focusNode,
          decoration: InputDecoration(
            label: labelplaceholername,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: enabledBorder),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.black),
            ),
            fillColor: Colors.white,
            filled: true,
            isDense: true,
          ),
          cursorColor: Colors.black,
          validator: validator,
          obscureText: obscureText,
          obscuringCharacter: '●',
          inputFormatters: [
            LengthLimitingTextInputFormatter(lengthword),
          ],
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
        ),
        Positioned(
          right: 15.0,
          top: 13.0,
          child: Visibility(
            visible: showSuffix,
            child: GestureDetector(
              onTap: onSuffixTap,
              child: Icon(obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
            ),
          ),
        ),
        Positioned(
          right: 15.0,
          top: 13.0,
          child: Visibility(
            visible: showSuffixdate,
            child: GestureDetector(
              onTap: onSuffixTapdate,
              child: Icon(Icons.calendar_month),
            ),
          ),
        )
      ],
    );
  }
}
