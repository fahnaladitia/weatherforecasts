part of 'components.dart';

class BasicTextAreaField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final int maxLines;
  final int maxLength;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool isRequired;
  const BasicTextAreaField({
    super.key,
    this.hintText,
    this.labelText,
    this.maxLines = 4,
    this.maxLength = 150,
    this.controller,
    this.onChanged,
    this.validator,
    this.isRequired = false,
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
                        style: AppTextStyle.body1SemiBold(context),
                      ),
                      isRequired
                          ? Text(
                              ' *',
                              style: AppTextStyle.body1SemiBold(context)?.copyWith(color: kRed500),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              )
            : const SizedBox.shrink(),
        TextFormField(
          maxLines: maxLines,
          maxLength: maxLength,
          validator: validator,
          controller: controller,
          onChanged: onChanged,
          buildCounter: (
            context, {
            required currentLength,
            required isFocused,
            maxLength,
          }) {
            return Text(
              '$currentLength/$maxLength',
              style: AppTextStyle.body3SemiBold(context)?.copyWith(color: kDark200),
            );
          },
          style: AppTextStyle.body2(context),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: kDark100),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: kDark100),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: kDark100),
            ),
            filled: true,
            fillColor: kLight200,
            hintText: hintText,
            hintStyle: AppTextStyle.body2(context)?.copyWith(color: kDark200),
          ),
        ),
      ],
    );
  }
}
