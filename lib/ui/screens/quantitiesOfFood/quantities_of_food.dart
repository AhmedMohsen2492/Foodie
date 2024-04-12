import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/data/api/api_manager.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:foodie/ui/screens/foodDetails/food_details_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuantitiesOfFood extends StatelessWidget {
  static String routeName = "quantities" ;
  late MainProvider provider ;
  final formKey = GlobalKey<FormState>();
  bool data = true;
  @override
  Widget build(BuildContext context) {
   provider = Provider.of(context);
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: AppColors.prime,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Nutrition",
              style: GoogleFonts.abhayaLibre(
                textStyle: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(colors: <Color>[
                        AppColors.white,
                        AppColors.white.withOpacity(0.5),
                      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                          .createShader(
                          const Rect.fromLTWH(80.0, 80.0, 100.0, 30.0))),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: provider.detectedImage == null ? Image.asset(AppAssets.addButton)
                      : Image.file(provider.detectedImage!,fit: BoxFit.cover,),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Enter the weights :",
                  style: GoogleFonts.abhayaLibre(
                    color: AppColors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  )),
              Expanded(
                child: FutureBuilder(
                  future: ApiManager.sendImageResponseList(provider.detectedImage!.path),
                  builder: (context, snapshot) {
                      if(snapshot.hasData)
                      {
                        if (snapshot.data!.length == 0){
                          data = false ;
                          return Center(child: Text("No detection !!",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),));
                        }else
                          {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) => buildWeightsItem(index,snapshot.data),
                            );
                          }
                      }else if (snapshot.hasError){
                        return Center(child: Text("Sorry No Data !!",style: TextStyle(
                          color: Colors.red[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),));
                      }else {
                        return Center(child: CircularProgressIndicator());
                      }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      calculateButton(context);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        backgroundColor: const Color(0xff54D851),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        )),
                    child: Text(
                      "Calculate",
                      style: GoogleFonts.abhayaLibre(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildWeightsItem(int index,List<String>? snapshot) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 30),
      decoration: BoxDecoration(
        color: AppColors.olive,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            "${snapshot?[index]}",
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.abhayaLibre(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          TextFormField(
            onChanged: (value) {
              provider.classNames.add(snapshot?[index]);
              provider.values.insert(index, value);
              provider.details["${snapshot![index]}"] = value ;
            },
            validator: (q) {
              if (!isNumeric(q)) {
                return 'Please enter Quantity';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.lightGreen,
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.lightGreen,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isNumeric(String? string) {
    if (string == null || string.isEmpty) {
      return false;
    }
    final number = num.tryParse(string);
    if (number == null) {
      return false;
    }
    return true;
  }

  calculateButton(BuildContext context) {
    if (formKey.currentState!.validate() && data) {
      //ApiManager.sendQuantities(provider.bmr,provider.details);
      Navigator.popAndPushNamed(context, FoodDetailsScreen.routeName);
    }
  }
}
