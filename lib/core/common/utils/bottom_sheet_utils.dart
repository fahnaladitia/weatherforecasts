part of '../common.dart';

class BottomSheetUtils {
  BottomSheetUtils._();

  /// Show basic modal bottom sheet
  /// [context] is required (BuildContext)
  /// [content] is required (Widget)
  /// [vsync] is required (TickerProvider)
  /// [height] is optional (default is 90% of screen height)
  /// [shape] is optional (default is RoundedRectangleBorder)
  /// [isScrollControlled] is optional (default is true)
  /// [isDismissible] is optional (default is true)
  /// [enableDrag] is optional (default is true)
  static Future<T?> showBasicModalBottomSheet<T>(
    BuildContext context, {
    required Widget content,
    AnimationController? transitionAnimationController,
    double? minHeight,
    double? maxHeight,
    ShapeBorder? shape,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
    bool showDragHandle = true,
    Color? backgroundColor,
    bool useSafeArea = true,
    RouteSettings? routeSettings,
    bool useRootNavigator = false,
    double? elevation,
    Clip clipBehavior = Clip.antiAliasWithSaveLayer,
    Color? barrierColor,
    String? barrierLabel,
    Offset? anchorPoint,
  }) async {
    return showModalBottomSheet<T?>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      backgroundColor: backgroundColor,
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      elevation: elevation,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.9,
        minHeight: minHeight ?? 0,
      ),
      transitionAnimationController: transitionAnimationController,
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
      builder: (_) => content,
    );
  }
}
