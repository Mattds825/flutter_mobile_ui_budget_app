import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/widgets/bar_chart.dart';
import 'package:flutter_budget_ui/widgets/category_box.dart';

import '../data/data.dart';
import '../data/data.dart';
import '../data/data.dart';
import '../models/category_model.dart';
import '../models/expense_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            floating: true,
            expandedHeight: 100.0,
            leading: IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30.0,
              onPressed: () {},
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('My Budget'),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0)),
                    child: BarChart(weeklySpending),
                  );
                } else {
                  final Category category = categories[index-1];
                  double totalAmountSpent = 0;
                  category.expenses.forEach((Expense expense) { 
                    totalAmountSpent += expense.cost;
                  });
                  return CategoryBox(category: category, totalAmountSpent: totalAmountSpent); 
                }
              },
              childCount: 1 + categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
