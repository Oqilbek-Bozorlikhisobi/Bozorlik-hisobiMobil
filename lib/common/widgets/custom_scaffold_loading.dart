import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomScaffoldLoading extends StatelessWidget {
  const CustomScaffoldLoading({
    super.key,
    required this.child,
    this.isLoading = false,
    this.title,
  });

  final Widget child;
  final bool isLoading;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          if (isLoading)
            GestureDetector(
              onTap: () {}, // Block taps
              child: Container(
                color: CupertinoColors.black.withOpacity(0.25),
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CupertinoActivityIndicator(radius: 16),
                      if (title != null) ...[
                        8.vertical,
                        Text(
                          title!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.activeBlue,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
