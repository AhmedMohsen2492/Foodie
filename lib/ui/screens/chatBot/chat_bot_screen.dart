import 'package:flutter/material.dart';
import 'package:foodie/data/api/api_manager.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  static const String routeName = "chat";

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  String message = "";
  bool loading = false, send = true;
  List chat = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.prime,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Chat Bot",
              style: GoogleFonts.abhayaLibre(
                textStyle: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(
                              colors: <Color>[
                            AppColors.white,
                            AppColors.white.withOpacity(0.5),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          .createShader(
                              const Rect.fromLTWH(80.0, 80.0, 100.0, 30.0))),
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: chat.isNotEmpty
                    ? ListView.builder(
                        controller: scrollController,
                        itemCount: chat.length,
                        itemBuilder: (context, index) => chatBotWidget(index))
                    : const Center(
                        child: Text(
                          "Start a new chat",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.green,
                          ),
                        ),
                      ),
              ),
              TextFormField(
                controller: controller,
                onChanged: (s) {
                  message = s;
                  setState(() {});
                },
                style: const TextStyle(color: AppColors.white, fontSize: 18),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: notEmpty(message) && send ? sendMessage : () {},
                    icon: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_sharp,
                          color: AppColors.prime,
                          size: 30,
                        )),
                  ),
                  filled: true,
                  fillColor: AppColors.prime,
                  hintText: " Type your message...",
                  hintStyle: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90),
                    borderSide: const BorderSide(
                        color: AppColors.simpleGreen, width: 5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(
                      color: AppColors.prime,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(
                      color: AppColors.prime,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  bool notEmpty(String m) {
    if (m.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void sendMessage() async {
    controller.clear();
    chat.add(message);
    chat.add("");
    setState(() {
      loading = true;
      send = false;
      Future.delayed(const Duration(milliseconds: 50), () {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 800), curve: Curves.easeOut);
      });
    });
    FocusScope.of(context).unfocus();
    GenerateContentResponse response =
        await ApiManager.chatBotResponse(message);
    setState(() {
      loading = false;
    });
    chat.removeAt(chat.length - 1);
    chat.add(response.text?.trim());
    message = "";
    setState(() {
      send = true;
      Future.delayed(const Duration(milliseconds: 300), () {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 800), curve: Curves.easeOut);
      });
    });
  }

  Widget chatBotWidget(int index) {
    return Align(
      alignment: index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
            top: 10,
            left: index % 2 == 0 ? MediaQuery.sizeOf(context).width / 4 : 10,
            bottom: 10,
            right: index % 2 == 0 ? 10 : MediaQuery.sizeOf(context).width / 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: index % 2 == 0 ? AppColors.prime : Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(35),
              topRight: const Radius.circular(35),
              bottomLeft: index % 2 == 0
                  ? const Radius.circular(35)
                  : const Radius.circular(0),
              bottomRight: index % 2 == 0
                  ? const Radius.circular(0)
                  : const Radius.circular(35),
            )),
        child: loading && index == chat.length - 1
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : Text(
                "${chat[index]}",
                textAlign: index % 2 == 0 ? TextAlign.right : TextAlign.left,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
      ),
    );
  }
}
