import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodie/ui/screens/foodDetails/food_details_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.all(10),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
                onPressed: (_){},
                icon: Icons.delete,
              label: "Delete",
              backgroundColor: AppColors.black,
              foregroundColor: AppColors.red,
              borderRadius: BorderRadius.circular(30),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: AppColors.olive,
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
              const SizedBox(width: 10,),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                        "Salad",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                        "200",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, FoodDetailsScreen.routeName);
                  } ,
                  child: const Text(
                      "Show Details",
                    style: TextStyle(
                      color: AppColors.lightGreen,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
