
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/core/colors.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {super.key,
      this.image,
      this.thumbnail,
      this.title,
      this.description,
      this.bgColor});
  final String? image;
  final String? thumbnail;
  final String? title;
  final String? description;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: kBlueGreyColor,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: bgColor ?? Colors.red[200],
                      image: DecorationImage(
                          image: NetworkImage(
                            image != null
                                ? image!
                                : "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(4)),
                ),
                Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title != null ? title! : "Title",
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            Gap(15),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width * .92,
              decoration: BoxDecoration(
                color: bgColor ?? Colors.amberAccent,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(
                      thumbnail != null
                          ? thumbnail!
                          : "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            Gap(10),
            SizedBox(
              child: Text(description != null ? description! : "Description",
                  style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold, fontSize: 13)),
            )
          ],
        ),
      ),
    );
  }
}

reverseString(String word) {
  return word.split("").reversed.join();
}
