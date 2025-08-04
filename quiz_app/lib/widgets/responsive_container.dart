import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get the screen width
        final width = constraints.maxWidth;
        
        // For tablets and larger screens, constrain the width
        if (width > 600) {
          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              padding: padding,
              color: backgroundColor,
              child: child,
            ),
          );
        }
        
        // For phones, use the full width
        return Container(
          padding: padding,
          color: backgroundColor,
          child: child,
        );
      },
    );
  }
}