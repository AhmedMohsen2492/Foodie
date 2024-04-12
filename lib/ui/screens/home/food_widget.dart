import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodie/data/dataModel/food_history.dart';
import 'package:foodie/data/providers/main_provider.dart';
import 'package:foodie/ui/screens/foodDetails/food_details_screen.dart';
import 'package:foodie/ui/screens/history/history_screen.dart';
import 'package:foodie/ui/utils/app_assets.dart';
import 'package:foodie/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class FoodWidget extends StatelessWidget {
  FoodHistory history;
  FoodWidget(this.history);
  late MainProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          color: AppColors.black, borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.all(6),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                provider.deleteFromHistoryList(history);
              },
              icon: Icons.delete,
              label: "Delete",
              backgroundColor: AppColors.black,
              foregroundColor: AppColors.red,
              borderRadius: BorderRadius.circular(30),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.olive, borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.18,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.file(
                    history.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      history.name,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${history.calories.round()} kcal",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context,
                        HistoryScreen.routeName,
                      arguments: history
                    );
                  },
                  child: const Text(
                    "Show Details",
                    style: TextStyle(
                      color: AppColors.lightGreen,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
