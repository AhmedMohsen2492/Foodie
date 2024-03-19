import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/ui/screens/chatBot/chat_bot_screen.dart';
import 'package:foodie/ui/screens/home/food_widget.dart';
import 'package:foodie/ui/screens/info/info_screen.dart';
import 'package:foodie/ui/screens/start/start_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum menuItem { editProfile, logout }

class _HomeScreenState extends State<HomeScreen> {
  menuItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff29AC81),
      appBar: AppBar(
        backgroundColor: Color(0xff29AC81),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Hello,Ahmed..",
            style: GoogleFonts.abhayaLibre(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.prime,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ChatBotScreen.routeName);
            },
            icon: Icon(
              Icons.chat,
              color: Colors.white,
            ),
          ),
          PopupMenuButton(
            initialValue: selectedItem,
            onSelected: (value) {
              setState(() {
                selectedItem = value;
                if (selectedItem == menuItem.editProfile) {
                  Navigator.pushNamed(context, InfoScreen.routeName);
                } else if (selectedItem == menuItem.logout) {
                  Navigator.pushReplacementNamed(
                      context, StartScreen.routeName);
                }
              });
            },
            iconColor: Colors.white,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: menuItem.editProfile,
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Edit profile",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: menuItem.logout,
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Log out",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.prime,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Your Food List :",
                  style: GoogleFonts.abhayaLibre(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => FoodWidget(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(0xff29AC81),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Text("Total",
                      style: GoogleFonts.abhayaLibre(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("1000",
                      style: GoogleFonts.abhayaLibre(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Kcal",
                      style: GoogleFonts.abhayaLibre(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
