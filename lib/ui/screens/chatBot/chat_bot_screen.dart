import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  static const String routeName = "chat";

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  TextEditingController controller = TextEditingController();
  String message = "";
  bool send = false;
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
                        itemCount: chat.length,
                        itemBuilder: (context, index) => chatBotWidget(index))
                    : Center(
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
                style: TextStyle(color: AppColors.white, fontSize: 18),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: notEmpty(message) ? sendMessage : () {},
                    icon: Container(
                        padding: EdgeInsets.all(10),
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
                  hintStyle: TextStyle(
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
                    borderSide: BorderSide(
                      color: AppColors.prime,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(
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
    if (m.isNotEmpty)
      return true;
    else
      return false;
  }

  void sendMessage() {
    chat.add(message);
    controller.text = "";
    chat.add('Hi i am Hamasa how can i help you ?');
    FocusScope.of(context).unfocus();
    setState(() {});
  }

  Widget chatBotWidget(int index) {
    return Align(
      alignment: index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
            top: 10,
            left: index % 2 == 0 ? MediaQuery.sizeOf(context).width / 3 : 10,
            bottom: 10,
            right: index % 2 == 0 ? 10 : MediaQuery.sizeOf(context).width / 3),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: index % 2 == 0 ? AppColors.prime : Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
              bottomLeft: index % 2 == 0 ?  Radius.circular(35) :Radius.circular(0),
              bottomRight:index % 2 == 0 ?  Radius.circular(0) :Radius.circular(35),
            )),
        child: Text(
          "${chat[index]}",
          textAlign: index % 2 == 0 ? TextAlign.right : TextAlign.left,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
