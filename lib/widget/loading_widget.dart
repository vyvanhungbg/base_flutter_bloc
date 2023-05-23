import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    required this.child,
    Key? key,
    this.running = false,
  }) : super(key: key);

  final Widget child;

  final bool running;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          if (running)
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black12,
              child: const Center(child: RefreshProgressIndicator()),
            ),
        ],
      );
}
