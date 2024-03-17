part of 'components.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Function()? onPressed;
  final ButtonType type;
  final ShapeBorder? shape;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final double? elevation;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool? isLoading;
  final Color? backgroundColor;
  const BasicButton({
    super.key,
    this.text = '',
    this.onPressed,
    this.type = ButtonType.primary,
    this.textStyle,
    this.suffixWidget,
    this.prefixWidget,
    this.shape,
    this.elevation,
    this.width,
    this.height,
    this.padding,
    this.isLoading,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor ?? type.color,
      elevation: elevation,
      highlightElevation: 0,
      hoverElevation: 0,
      minWidth: width,
      height: height,
      splashColor: Colors.transparent,
      focusColor: kLight500.withOpacity(0.5),
      highlightColor: kDark500.withOpacity(0.5),
      hoverColor: kLight500.withOpacity(0.5),
      shape: shape ?? _getShapeButton,
      disabledColor: backgroundColor?.withOpacity(0.5) ?? type.color.withOpacity(0.5),
      disabledTextColor: type.textColor.withOpacity(0.5),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: isLoading == true ? _getLoadingIndicator : _getContent(context),
    );
  }

  ShapeBorder get _getShapeButton {
    switch (type) {
      case ButtonType.primary:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        );
      case ButtonType.secondary:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: type.borderColor),
        );
      case ButtonType.tertiary:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        );
      default:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        );
    }
  }

  Widget _getContent(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefixWidget != null)
          Row(
            children: [
              prefixWidget!,
              SizedBox(width: text.isEmpty ? 0 : 8),
            ],
          ),
        text.isEmpty
            ? const SizedBox.shrink()
            : Text(
                text,
                style: textStyle ?? AppTextStyle.buttonLarge(context)?.copyWith(color: type.textColor),
                textAlign: TextAlign.center,
              ),
        if (suffixWidget != null)
          Row(
            children: [
              SizedBox(width: text.isEmpty ? 0 : 8),
              suffixWidget!,
            ],
          ),
      ],
    );
  }

  Widget get _getLoadingIndicator {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(type.textColor),
      ),
    );
  }
}

enum ButtonType {
  primary(
    color: kTeal500,
    textColor: kLight100,
  ),
  secondary(
    color: kLight100,
    textColor: kDark500,
    borderColor: kTeal500,
  ),
  tertiary(
    color: Colors.transparent,
    textColor: kDark500,
  );

  final Color color;
  final Color textColor;
  final Color borderColor;
  const ButtonType({
    required this.color,
    required this.textColor,
    this.borderColor = kLight500,
  });
}
