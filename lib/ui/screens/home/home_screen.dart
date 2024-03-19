import 'package:flutter/material.dart';
import 'package:foodie/ui/screens/chatBot/chat_bot_screen.dart';
import 'package:foodie/ui/screens/info/info_screen.dart';
import 'package:foodie/ui/screens/start/start_screen.dart';
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
        title: Text(
          "Hello,Ahmed..",
          style: GoogleFonts.abhayaLibre(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.prime,
          ),
        ),
        centerTitle: true,
        leading: PopupMenuButton(
          initialValue: selectedItem,
          onSelected: (value) {
            setState(() {
              selectedItem = value;
              if (selectedItem == menuItem.editProfile) {
                Navigator.pushNamed(context, InfoScreen.routeName);
              } else if (selectedItem == menuItem.logout) {
                Navigator.pushReplacementNamed(context, StartScreen.routeName);
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ChatBotScreen.routeName);
            },
            icon: Icon(
              Icons.chat,
              color: Colors.white,
            ),
          )
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Hamasa"),
          ],
        ),
      ),
    );
  }
}
