import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/ui/screens/foodDetails/food_details_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xff99AFA8),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.18,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                  AppAssets.food1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                    "Ko4are",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                    "200",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 10,),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, FoodDetailsScreen.routeName);
              } ,
              child: Text("Show Details")
          )
        ],
      ),
    );
  }
}
