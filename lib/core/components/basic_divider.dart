part of 'components.dart';

class BasicDivider extends StatelessWidget {
  final Axis direction;
  final double thickness;
  final Color color;
  final double radius;
  const BasicDivider({
    super.key,
    this.direction = Axis.horizontal,
    this.thickness = 1,
    this.color = kDark100,
    this.radius = 4,
  });

  @override
  Widget build(BuildContext context) {
    switch (direction) {
      case Axis.horizontal:
        return Flexible(
          child: Container(
            height: thickness,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
          ),
        );
      case Axis.vertical:
        return Container(
          width: thickness,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
