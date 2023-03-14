import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  const CommonAppBar({Key? key, required this.appBarTitle}) : super(key: key);

  @override
  // TODO: implement preferredSize これなに？
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTitle),
    );
  }

}
