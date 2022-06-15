import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.hint,
    this.onTap,
    this.label,
    this.value,
    this.bottom,
    this.obscure,
    this.onSaved,
    this.onChanged,
    this.readonly = false,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
    this.floatLabel = false,
    this.textEditingController,
    this.isBold = false,
    this.fillColor,
    this.topPadding,
    this.contentPadding,
    this.suffixIcon,
    this.boxConstraints,
  }) : super(key: key);

  final EdgeInsets? contentPadding;
  final bool? isBold;
  final Color? fillColor;
  final bool? obscure;
  final String? hint;
  final String? label;
  final String? value;
  final bool readonly;
  final bool floatLabel;
  final double? bottom;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final FormFieldSetter<String?>? onSaved;
  final FormFieldSetter<String?>? onChanged;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;
  final double? topPadding;
  final BoxConstraints? boxConstraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 7, bottom: bottom ?? 20),
      child: TextFormField(
        onTap: onTap,
        onSaved: onSaved,
        onChanged: onChanged,
        keyboardType: keyboardType,
        readOnly: readonly,
        initialValue: value,
        validator: validator,
        obscureText: obscure ?? false,
        controller: textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        scrollPadding: const EdgeInsets.all(100),
        style: TextStyle(
          color: AppColors.grey,
          fontSize: 12,
          letterSpacing: 1,
        ),
        decoration: InputDecoration(
          contentPadding: contentPadding ??
              const EdgeInsets.only(left: 20, top: 11, bottom: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFEAEBEC), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFEAEBEC), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFEAEBEC), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 12,
            letterSpacing: 1,
            color: AppColors.grey,
          ),
          floatingLabelBehavior: floatLabel
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.auto,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: fillColor ?? Colors.white,
          constraints: boxConstraints,
        ),
      ),
    );
  }
}

class AppPasswordField extends StatefulWidget {
  final IconData? icon;
  final String? hint;

//  final bool iconBool;
  final String? label;

//  final Widget? prefixIcon;

  final BuildContext? context;

  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;

  const AppPasswordField(
      {Key? key,
      this.icon,
      this.label,
      this.validator,
      this.hint,
      this.context,
      //  required this.iconBool,
      this.textEditingController // this.validator,
      })
      : super(key: key);

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _show = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: TextFormField(
          validator: widget.validator,
          obscureText: _show,
          controller: widget.textEditingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          //keyboardType: widget.keyboardType,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (v) {
            FocusScope.of(context).nextFocus();
          },
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            letterSpacing: 1,
          ),

          scrollPadding: const EdgeInsets.all(180),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(fontSize: 12),
            // labelText: label,
            prefixIcon: Icon(
              Icons.lock,
              color: AppColors.blue,
            ),
            suffixIcon: GestureDetector(
              child: Icon(
                _show ? Icons.visibility_off : Icons.visibility,
                color: AppColors.blue,
              ),
              onTap: () => setState(() => _show = !_show),
            ),
            labelText: widget.label,
          ),
        ));
  }
}

class AppTextFieldWithMaxLines extends StatefulWidget {
  final VoidCallback? onTap;
  final FormFieldSetter<String?>? onSaved;
  final FormFieldSetter<String?>? onChanged;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;

  const AppTextFieldWithMaxLines({
    Key? key,
    this.onTap,
    this.validator,
    this.onChanged,
    this.textEditingController,
    this.onSaved,
  }) : super(key: key);

  @override
  State<AppTextFieldWithMaxLines> createState() =>
      _AppTextFieldWithMaxLinesState();
}

class _AppTextFieldWithMaxLinesState extends State<AppTextFieldWithMaxLines> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      maxLines: 8,
      decoration: InputDecoration(
          hintText: 'Start Typing..',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColors.blue, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColors.blue, width: 2),
          )),
    );
  }
}
