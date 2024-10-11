import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class Boxshape extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  const Boxshape({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Provider.of<Themeprovider>(context).isDark
              ? Colors.grey.shade700
              : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 2,
                color: Provider.of<Themeprovider>(context).isDark
                    ? Colors.grey.shade700
                    : Colors.grey.shade500),
            BoxShadow(
                offset: const Offset(-1, -1),
                blurRadius: 2,
                color: Provider.of<Themeprovider>(context).isDark
                    ? Colors.grey.shade700
                    : Colors.grey.shade500),
          ],
        ),
        child: child,
      ),
    );
  }
}
