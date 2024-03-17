part of '../common.dart';

class DialogUtils {
  DialogUtils._();

  /// Show basic dialog
  /// [context] is required
  /// [content] is requiredr
  static Future<T?> showBasicDialog<T>(
    BuildContext context, {
    required Widget content,
  }) {
    return showDialog<T>(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: content,
        );
      },
    );
  }
}
