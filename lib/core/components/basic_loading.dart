part of 'components.dart';

class BasicLoading extends StatelessWidget {
  const BasicLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final minSize = min(constraints.maxWidth, constraints.maxHeight);
        return Center(
            child: SizedBox(
          width: minSize * 0.2,
          height: minSize * 0.2,
          child: CircularProgressIndicator(
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            strokeWidth: minSize * 0.1,
          ),
        ));
      },
    );
  }
}
