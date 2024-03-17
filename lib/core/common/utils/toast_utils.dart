part of '../common.dart';

class ToastUtils {
  ToastUtils._();

  /// Show toast error
  /// [context] is the context of the screen
  /// [message] is the message of the error
  /// [duration] is the duration of the toast
  static void showToastError(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kRed500,
        padding: const EdgeInsets.all(8.0),
        content: Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.xmark,
              color: kLight100,
              size: 14,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: AppTextStyle.body3SemiBold(context)?.copyWith(color: kLight100),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Show toast success
  /// [context] is the context of the screen
  /// [message] is the message of the success
  /// [duration] is the duration of the toast
  /// [onClose] is the function to be executed when the toast is closed
  static void showToastSuccess(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kGreen500,
        padding: const EdgeInsets.all(8.0),
        content: Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.circleInfo,
              color: kLight100,
              size: 14,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: AppTextStyle.body3SemiBold(context)?.copyWith(color: kLight100),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        duration: duration,
      ),
    );
  }

  /// Show toast warning
  /// [context] is the context of the screen
  /// [message] is the message of the warning
  /// [duration] is the duration of the toast
  static void showToastWarning(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kOrange300,
        padding: const EdgeInsets.all(8.0),
        content: Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.circleExclamation,
              color: kLight100,
              size: 14,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: AppTextStyle.body3SemiBold(context)?.copyWith(color: kLight100),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        duration: duration,
      ),
    );
  }

  /// Show toast info
  /// [context] is the context of the screen
  /// [message] is the message of the info
  /// [duration] is the duration of the toast
  static void showToastInfo(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kTeal500,
        padding: const EdgeInsets.all(8.0),
        content: Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.circleInfo,
              color: kLight100,
              size: 14,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: AppTextStyle.body3SemiBold(context)?.copyWith(color: kLight100),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        duration: duration,
      ),
    );
  }
}
