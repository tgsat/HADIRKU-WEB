import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String status;
  final String value;
  final bool isActive;
  final Function() onTap;

  const InfoCard(
      {super.key,
      required this.title,
      required this.value,
      this.isActive = false,
      required this.onTap,
      required this.status});

  @override
  Widget build(BuildContext context) {
    late Color color;
    switch (status) {
      case Dictionary.inProgress:
        color = Colors.orange;
        break;
      case Dictionary.delivered:
        color = Colors.lightGreen;
        break;
      case Dictionary.cancel:
        color = Colors.redAccent;
        break;
      case Dictionary.schedule:
        color = AppColor.active;
        break;
    }
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: ClipPath(
          clipper: const ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
          child: Container(
            height: 136,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: color, width: 5)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 6),
                  color: AppColor.lightGrey.withOpacity(.1),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(child: Container()),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: "$value\n",
                        style: GoogleFonts.poppins(
                            fontSize: 40,
                            color: isActive ? AppColor.active : AppColor.dark),
                      ),
                      TextSpan(
                        text: title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: isActive
                                ? AppColor.active
                                : AppColor.lightGrey),
                      ),
                    ])),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
