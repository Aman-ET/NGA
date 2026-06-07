import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  // Required business properties
  final String text;
  final VoidCallback onPressed;

  // State properties
  final bool isLoading;
  final bool isEnabled;
  final bool isHighlighted;

  // Layout properties
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  // Appearance properties
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  final double borderWidth;
  final double borderRadius;
  final double elevation;

  // Icon properties
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? iconColor;
  final double? iconSize;

  // Typography
  final TextStyle? textStyle;

  // Custom widgets
  final Widget? loadingWidget;

  const CustomButton({
    super.key,

    required this.text,
    required this.onPressed,

    required this.backgroundColor,
    required this.textColor,

    required this.borderWidth,
    required this.borderRadius,

    required this.elevation,

    this.width,
    this.height,

    this.borderColor,

    this.prefixIcon,
    this.suffixIcon,

    this.iconColor,
    this.iconSize,

    this.isLoading = false,
    this.isEnabled = true,
    this.isHighlighted = false,

    this.loadingWidget,

    this.padding,
    this.margin,

    this.textStyle,

  });


  @override
  Widget build(BuildContext context){
   final Color effectiveBackgroundColor =
       isHighlighted
        ? backgroundColor.withValues(alpha: 0.8)
           : backgroundColor;

   return Container(
     width:  width,
     margin: margin,

     child:  SizedBox(
       height: height,

       child: ElevatedButton(
           onPressed:
            (isLoading || !isEnabled)
              ? null
              : onPressed,

           style: ElevatedButton.styleFrom(
             backgroundColor: effectiveBackgroundColor,

             foregroundColor: textColor,
             elevation:  elevation,

             padding: padding,

             shape: RoundedRectangleBorder(
               borderRadius:
                 BorderRadius.circular(
                   borderRadius,
                 ),

               side:  BorderSide(
                 color:
                   borderColor ??
                   Colors.transparent,

                 width: borderWidth,
               ),
             ),
           ),
           child: isLoading
            ?(loadingWidget ??
              CircularProgressIndicator(
                color: textColor,
              ))
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(prefixIcon != null)
                    Icon(
                      prefixIcon,
                      color:
                          iconColor ??
                          textColor,
                      size: iconSize,
                    ),
                  if(prefixIcon != null)
                    const SizedBox(width: 8),

                  Text(
                    text,
                    style:
                        textStyle ??
                        TextStyle(
                          color: textColor,
                        ),
                  ),
                  if(suffixIcon !=null)
                    const SizedBox(width: 8),
                  if(suffixIcon != null)
                    Icon(
                      suffixIcon,
                      color:
                          iconColor ??
                          textColor,
                      size: iconSize,
                    ),
                ],
              ),
           ),
       ),
     );

  }
}