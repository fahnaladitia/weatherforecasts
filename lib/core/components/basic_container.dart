part of 'components.dart';

class BasicContainer extends StatelessWidget {
  final List<Widget> children;
  final bool isUsePading;
  final bool isUseTopMargin;
  final bool isUseBottomMargin;
  final double topMargin;
  final double bottomMargin;
  final Color color;
  final double topPadding;
  final double bottomPadding;
  final double horizontalPadding;

  const BasicContainer({
    super.key,
    this.children = const [],
    this.isUsePading = true,
    this.isUseTopMargin = true,
    this.isUseBottomMargin = false,
    this.color = kLight100,
    this.topPadding = 16,
    this.bottomPadding = 16,
    this.horizontalPadding = 24,
    this.topMargin = 4.0,
    this.bottomMargin = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      margin: EdgeInsets.only(
        top: isUseTopMargin ? topMargin : 0.0,
        bottom: isUseBottomMargin ? bottomMargin : 0.0,
      ),
      padding: isUsePading
          ? EdgeInsets.fromLTRB(
              horizontalPadding,
              topPadding,
              horizontalPadding,
              bottomPadding,
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
