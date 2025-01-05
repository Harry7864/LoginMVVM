import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  String progressMsg = 'One Moment';
  double? width;
  double? height;
  final Widget child;
  final bool loading;

  ProgressView(
      {Key? key,
      required this.progressMsg,
      this.width,
      this.height,
      required this.child,
        required this.loading })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loadingView(context);
  }

  Widget loadingView(BuildContext context) {
    return loading
        ? Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(progressMsg),
                ),
              ],
            ),
          )
        : child;
  }
}
