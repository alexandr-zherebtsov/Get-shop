part of widgets;

Widget headline(String title, TextStyle? textStyle) {
  return Text(
    title,
    style: textStyle,
    softWrap: false,
    overflow: TextOverflow.fade,
  );
}