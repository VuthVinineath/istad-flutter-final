import 'package:ecommerce_clothes/constants/colors.dart';
import 'package:ecommerce_clothes/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(MySize.marginA),
          padding: EdgeInsets.symmetric(horizontal: MySize.py),
          child: Column(
            children: [
              Styles.hMargin,
              Center(
                child: SizedBox(
                  height: 180,
                  width: 180,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      Container(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profile.jpg"),
                          backgroundColor: Colors.white,
                        ),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: MyColors.primary, shape: BoxShape.circle),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -25,
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: Color(0xFFF5F6F9),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.blue,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Styles.hMargin,
              Center(
                child: Text(
                  "Vuth Vinineath",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary),
                ),
              ),
              Center(
                child: Text(
                  "vinineathvini@gmail.com",
                  style: TextStyle(fontSize: 16, color: MyColors.primary),
                ),
              ),
              Styles.hMargin,
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primary,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      foregroundColor: MyColors.primary),
                ),
              ),
              Styles.hMargin,
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text("Settings",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.primary)),
                          trailing: Icon(
                            FontAwesomeIcons.greaterThan,
                            size: 18,
                          ),
                        ),
                        Padding(
                          child: Divider(
                            color: MyColors.secondary,
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
