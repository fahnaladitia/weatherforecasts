part of 'components.dart';

class BasicScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Color backgroundColor;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final bool isSingleChildScrollView;
  final bool extendBodyBehindAppBar;
  final Future<void> Function()? onRefresh;
  final Function()? onTap;
  final Widget? floatingActionButton;
  final ScrollController? scrollController;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final bool isUseSafeArea;
  const BasicScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.backgroundColor = kLight200,
    this.resizeToAvoidBottomInset,
    this.isSingleChildScrollView = true,
    this.extendBodyBehindAppBar = false,
    this.onRefresh,
    this.onTap,
    this.floatingActionButton,
    this.scrollController,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.isUseSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
      child: Scaffold(
        key: key,
        extendBodyBehindAppBar: true,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar,
        body: SafeArea(
          top: isUseSafeArea,
          bottom: false,
          child: isSingleChildScrollView
              ? onRefresh != null
                  ? BasicPullRefresh(
                      onRefresh: onRefresh!,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        keyboardDismissBehavior: keyboardDismissBehavior,
                        child: body,
                      ),
                    )
                  : SingleChildScrollView(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      keyboardDismissBehavior: keyboardDismissBehavior,
                      child: body,
                    )
              : body,
        ),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
