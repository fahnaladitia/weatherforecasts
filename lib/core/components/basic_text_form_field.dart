part of 'components.dart';

class BasicTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final void Function()? onTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isRequired;
  final bool readOnly;
  final bool obscureText;
  final String? errorText;
  final Color? labelColor;
  final Color? fillColor;
  final Color? borderFocusedColor;
  final double? borderRadius;
  final TextInputType? keyboardType;
  const BasicTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.controller,
    this.onChanged,
    this.validator,
    this.isRequired = false,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.obscureText = false,
    this.errorText,
    this.labelColor,
    this.fillColor,
    this.borderFocusedColor,
    this.borderRadius,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null
            ? Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        labelText!,
                        style: labelStyle ?? AppTextStyle.body1SemiBold(context)?.copyWith(color: labelColor),
                      ),
                      isRequired
                          ? Text(
                              ' *',
                              style: labelStyle ?? AppTextStyle.body1SemiBold(context)?.copyWith(color: kRed500),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              )
            : const SizedBox.shrink(),
        TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          validator: validator,
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: AppTextStyle.body1(context),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
              borderSide: const BorderSide(color: kDark100),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
              borderSide: const BorderSide(color: kDark100),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
              borderSide: BorderSide(color: borderFocusedColor ?? kDark100, width: 2),
            ),
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: suffixIcon,
                  )
                : null,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: prefixIcon,
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(minHeight: 16, minWidth: 16),
            prefixIconConstraints: const BoxConstraints(minHeight: 16, minWidth: 16),
            filled: true,
            fillColor: fillColor ?? kLight200,
            hintText: hintText,
            hintStyle: hintStyle ?? AppTextStyle.body2(context)?.copyWith(color: kDark200),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: Text(
              errorText!,
              style: AppTextStyle.body3SemiBold(context)?.copyWith(color: kRed500),
            ),
          ),
      ],
    );
  }
}
