part of 'components.dart';

class BasicPullRefresh extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;
  const BasicPullRefresh({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: kPurple500,
      child: child,
    );
  }
}
