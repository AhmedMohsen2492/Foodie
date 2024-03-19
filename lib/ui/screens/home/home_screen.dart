import 'package:flutter/material.dart';
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

enum MenuItem { editProfile, logout }

class _HomeScreenState extends State<HomeScreen> {
  MenuItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.prime,
      appBar: AppBar(
        backgroundColor: AppColors.prime,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Hello,Ahmed..",
            style: GoogleFonts.abhayaLibre(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ChatBotScreen.routeName);
            },
            icon: const Icon(
              Icons.chat,
              color: Colors.white,
            ),
          ),
          PopupMenuButton(
            initialValue: selectedItem,
            onSelected: (value) {
              setState(() {
                selectedItem = value;
                if (selectedItem == MenuItem.editProfile) {
                  Navigator.pushNamed(context, InfoScreen.routeName);
                } else if (selectedItem == MenuItem.logout) {
                  Navigator.pushReplacementNamed(
                      context, StartScreen.routeName);
                }
              });
            },
            iconColor: AppColors.white,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: MenuItem.editProfile,
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
                      style: TextStyle(color: AppColors.black),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: MenuItem.logout,
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
                      style: TextStyle(color: AppColors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            IconButton(
                onPressed: () {},
                icon: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: AppColors.olive,
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(
                      width: 25,
                      color: AppColors.olive,
                    ),
                  ),
                  child: Image.asset(
                    AppAssets.addButton,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Your Food List :",
                  style: GoogleFonts.abhayaLibre(
                    color: AppColors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => const FoodWidget(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: AppColors.prime,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Text("Total",
                      style: GoogleFonts.abhayaLibre(
                          color: AppColors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text("1000",
                      style: GoogleFonts.abhayaLibre(
                          color: AppColors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Kcal",
                      style: GoogleFonts.abhayaLibre(
                          color: AppColors.white,
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
