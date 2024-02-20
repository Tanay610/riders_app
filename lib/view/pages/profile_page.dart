import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riders_app/constants/colors.dart';
import 'package:riders_app/constants/text_styles.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDefault,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 0,
                  offset: Offset(0, 16),
                  color: Color(0xff000000).withOpacity(0.05))
            ]
          ),
          child: AppBar(
            leading: Icon(Icons.arrow_back),
            title: Text(
              "Profile",
              style: FontStyles.medium14P(color: AppColors.justBlack),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    Text(
                      "Edit Details",
                      style: FontStyles.med400P12(color: AppColors.green1000),
                    ),
                    SizedBox(width: 5.33,),
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Image.asset("assets/images/Vector.png"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 56,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white, boxShadow: [
              BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 0,
                  offset: Offset(0, 8),
                  color: Color(0xff000000).withOpacity(0.05))
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                  "Duty Status :",
                  style: FontStyles.medium300P14(color: AppColors.green1000),
                ),
                Text(
                  "Ongoing",
                  style: FontStyles.medium14P(color: AppColors.green1000),
                ),
                  ],
                ),
                Switch(value: isOn, onChanged: (ca){
                },
                activeColor:Colors.white,
                activeTrackColor: AppColors.green1000,
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white, boxShadow: [
              BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 0,
                  offset: Offset(0, 8),
                  color: Color(0xff000000).withOpacity(0.05))
            ]),
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.green1000,
                      ),
                    ),
                    Text(
                      "James Bond",
                      style: FontStyles.medium14P(color: AppColors.grey800),
                    ),
                  ],
                ),
                SizedBox(height: 12,),
                NavigateWidget(
                  heading: "Home Address",
                ),
                SizedBox(height: 8,),
                Text(
                  "#12, Heritage City, MG Rd. Metro Station, Sector 25, Gurugram, Haryana",
                  style: FontStyles.med400P12(color: AppColors.grey500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Divider(height: 20,
                  color: AppColors.grey100,),
                ),
                NavigateWidget(heading: "Warehouse Address"),
                
                SizedBox(height: 12,),
                Text(
                  "#12, Heritage City, MG Rd. Metro Station,",
                  
                  style: FontStyles.med400P12(color: AppColors.grey500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavigateWidget extends StatelessWidget {
  const NavigateWidget({
    super.key,
    required this.heading,
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: FontStyles.mediumP12(color: AppColors.grey800),
        ),
        SizedBox(
          child: Row(
            children: [
              Text(
                "Navigate",
                style: FontStyles.mediumP12(color: AppColors.green1000),
              ),
              SizedBox(
                width: 4,
              ),
              SizedBox(
                  height: 16,
                  width: 16,
                  child: SvgPicture.asset("assets/images/navigate.svg"))
            ],
          ),
        )
      ],
    );
  }
}
