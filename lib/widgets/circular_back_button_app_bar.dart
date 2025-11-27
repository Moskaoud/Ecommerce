import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CircularBackButtonAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final Color backButtonBackgroundColor;
  final IconData backButtonIcon;

  const CircularBackButtonAppBar({
    super.key,
    required this.title,
    this.centerTitle = true, // Optional: center the title
    this.backButtonBackgroundColor = const Color(
      0xFFF4F4F4,
    ), // Default background color
    this.backButtonIcon = Icons.arrow_back_ios_new, // Default icon
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      toolbarHeight: 120, // Increase AppBar height
      leadingWidth:
          85, // Increase leading width to accommodate larger CircleAvatar

      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 25, top: 20),
        child: InkWell(
          onTap: () => {
            if (Navigator.canPop(context)) Navigator.of(context).pop(),
          },
          customBorder: const CircleBorder(),
          child: CircleAvatar(
            radius: 40,
            backgroundColor:
                backButtonBackgroundColor, // Use the prop for background color
            child: Icon(
              backButtonIcon,
              color: Theme.of(
                context,
              ).iconTheme.color, // Use theme color for icon
            ),
          ),
        ),
      ),
      title: Text(title),
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120); // Corresponds to toolbarHeight
}
