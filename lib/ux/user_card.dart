import 'package:flutter/material.dart';
import 'package:ink_kink/backend/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ink_kink/ux/widgets/like_needle.dart';
import 'package:ink_kink/ux/widgets/detailed_profile.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key key, this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.95,
      height: size.height * 0.85,
      child: Card(
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                user.imagePath,
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: size.width,
                  height: size.height * 0.15,
                  child: GestureDetector(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return GestureDetector(
                            onTap: () {},
                            child: DetailedProfile(
                              user: user,
                            ),
                            behavior: HitTestBehavior.opaque,
                          );
                        }),
                    child: Card(
                      child: ListView(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        children: <Widget>[
                          Text(
                              "${user.name}, " +
                                  user.calculateAge().toString(),
                              style: GoogleFonts.nunito(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            "${user.description}",
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: size.height * 0.1,
              left: size.width * 0.70,
              child: LikeNeedle(),
            ),
          ],
        ),
        elevation: 5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}


