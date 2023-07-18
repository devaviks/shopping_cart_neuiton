import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neuimart_project/view/screens/wishlist/wishlist.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../cart/cart_ui/cart.dart';
import '../profile/Utils_Profile/colors.dart';

class Seller extends StatefulWidget {
  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _productsSold = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Start the timer to automatically increase the product sold count
    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      setState(() {
        _productsSold++;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel(); // Cancel the timer when the widget is disposed of
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBGColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.heading6),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
        ),
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: Text(
          "SELLER DASHBOARD",
          style: TextStyle(
            fontSize: 14.5,
            letterSpacing: 0.15,
            color: AppColor.heading6,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: AppColor.heading6,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Wishlist()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: AppColor.heading6,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Monthly Income',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(
                    numberFormat: NumberFormat.compact(),
                    labelFormat: '\$',
                  ),
                  series: <LineSeries<ChartData, String>>[
                    LineSeries<ChartData, String>(
                      dataSource: <ChartData>[
                        ChartData('Jan', 5000),
                        ChartData('Feb', 7000),
                        ChartData('Mar', 4000),
                        ChartData('Apr', 6000),
                        ChartData('May', 9000),
                        ChartData('June', 8000),
                        // Add more monthly data points here
                      ],
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.value,
                      markerSettings: MarkerSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Yearly Profit',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SfCircularChart(
                  series: <CircularSeries<ChartData, String>>[
                    DoughnutSeries<ChartData, String>(
                      dataSource: <ChartData>[
                        ChartData('Profit', 65),
                        ChartData('Remaining', 35),
                      ],
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.value,
                      pointColorMapper: (ChartData data, _) =>
                      data.month == 'Profit' ? Colors.green : Colors.grey,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.outside,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Products Sold',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, Widget? child) {
                      return Text(
                        '$_productsSold',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Recent Orders Section
              Text(
                'Recent Orders',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.pinkAccent,
                        backgroundImage: AssetImage('assets/icons/user.png'),
                      ),
                      title: Text(
                        'John Doe',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Order ID: 123456',
                        style: TextStyle(fontSize: 11),
                      ),
                      trailing: Text(
                        '\$150',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/icons/user.png'),
                      ),
                      title: Text(
                        'Jane Smith',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Order ID: 654321',
                        style: TextStyle(fontSize: 11),
                      ),
                      trailing: Text(
                        '\$250',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              // Sales Overview Section
              Text(
                'Sales Overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Total Sales',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text('\$20,000'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Best Selling Product',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text('Product X'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String month;
  final double value;

  ChartData(this.month, this.value);
}