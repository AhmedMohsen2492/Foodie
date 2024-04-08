import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodie/data/api/api_manager.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:foodie/ui/screens/chatBot/chat_bot_screen.dart';
import 'package:foodie/ui/screens/foodDetails/food_details_screen.dart';
import 'package:foodie/ui/screens/foodIngrediets/food_ingredients.dart';
import 'package:foodie/ui/screens/home/food_widget.dart';
import 'package:foodie/ui/screens/info/info_screen.dart';
import 'package:foodie/ui/screens/quantitiesOfFood/quantities_of_food.dart';
import 'package:foodie/ui/screens/start/start_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = "home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MenuItem? selectedItem;
  late MainProvider provider ;

  @override
  Widget build(BuildContext context) {

    provider = Provider.of(context);
    return Scaffold(
      backgroundColor: AppColors.prime,
      appBar: AppBar(
        backgroundColor: AppColors.prime,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Hello,${provider.firstName}..",
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
              Navigator.pushNamed(context, FoodIngredients.routeName);
            },
            icon: Icon(Icons.screen_search_desktop_outlined,
            size: 30,
            color: AppColors.white,),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ChatBotScreen.routeName);
            },
            icon: Image.asset(
                AppAssets.robot,
              color: AppColors.white,
              width: 30,
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
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
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
                onPressed: () {
                  showImagePickerOptions(context);
                },
                icon: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: AppColors.olive,
                    borderRadius: BorderRadius.circular(9000),
                    border: Border.all(
                      width: 22,
                      color: AppColors.olive,
                    ),
                  ),
                  child: provider.pickedImage == null ?
                  Image.asset(
                    AppAssets.addButton,
                  fit: BoxFit.fill,):
                  ClipRRect(
                    borderRadius: BorderRadius.circular(600),
                      child: Image.file(provider.pickedImage!,fit: BoxFit.contain,)),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  scanButton();
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 6,
                    ),
                    backgroundColor: const Color(0xff54D851),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                child: Text(
                  "Scan",
                  style: GoogleFonts.abhayaLibre(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Your Food List :",
                  style: GoogleFonts.abhayaLibre(
                    color: AppColors.black,
                    fontSize: 22,
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
              child: Column(
                children: [
                  Row(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height/4,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20)
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: AppColors.prime,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: IconButton(
                    onPressed: (){
                      provider.galleryPicker(context);
                    },
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: MediaQuery.of(context).size.height/12 ,
                          color: AppColors.white,
                        ),
                        const Text(
                          "Gallery",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: AppColors.prime,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: IconButton(
                    onPressed: () async {
                      provider.cameraPicker(context);
                    },
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: MediaQuery.of(context).size.height/12 ,
                          color: AppColors.white,
                        ),
                        const Text(
                          "Camera",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void scanButton() async{
    if(provider.pickedImage != null)
    {
     File? file = await ApiManager.sendImageResponseImage(provider.pickedImage!.path);
     provider.detectedImage = file ;
     List? elements = await ApiManager.sendImageResponseList(provider.detectedImage!.path);
     provider.foodElements = elements ;
     Navigator.pushNamed(context, QuantitiesOfFood.routeName);
    }
  }
}

enum MenuItem { editProfile, logout }
