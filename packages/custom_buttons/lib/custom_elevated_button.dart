part of 'package:custom_buttons/custom_buttons.dart';
// part 'custom_buttons';

@immutable
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.text,
      required this.callback,
      this.bgColor,
      this.fgColor,
      this.borderRadius = 5.0,
      this.icon,
      this.loading = false})
      : super(key: key);
  final String text;
  final VoidCallback callback;
  final Color? bgColor;
  final Color? fgColor;
  final IconData? icon;
  final bool loading;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: loading
          ? const CircularProgressIndicator()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) Icon(icon),
                if (icon != null) const SizedBox(width: 5),
                Text(text),
              ],
            ),
      style: ElevatedButton.styleFrom(
        primary: bgColor ?? Theme.of(context).primaryColor,
        onPrimary: fgColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
