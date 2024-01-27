
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/features/newsandhot/screens/widgets/icon_with_title.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(title,
                  style: GoogleFonts.dangrek(
                      fontSize: 35, fontWeight: FontWeight.w300)),
            ),
            const SizedBox(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconWithTitle(
                    title: 'Remind Me',
                    icon: Icons.notifications_none_outlined,
                  ),
                  IconWithTitle(
                    title: 'Info',
                    icon: Icons.info_outline,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
