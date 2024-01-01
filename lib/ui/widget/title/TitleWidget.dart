import 'package:flutter/material.dart';

/// 필수: [텍스트] , 옵션: [패딩 값],[폰트 사이즈],[폰트 컬러]
class TitleWidget extends StatelessWidget {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? fontSize;
  final Color? color;
  final String text;

  const TitleWidget({
    Key? key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.fontSize,
    this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding = EdgeInsets.only(
      left: left ?? 12,
      top: top ?? 0,
      right: right ?? 0,
      bottom: bottom ?? 0,
    );

    return Padding(
      padding: padding,
      child:
      SizedBox(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 14.0,
            color: color ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
