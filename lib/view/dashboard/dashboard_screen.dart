import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:my_grocery/controller/dashboard_controller.dart';
import 'package:my_grocery/view/account/account_screen.dart';
import 'package:my_grocery/view/category/category_screen.dart';
import 'package:my_grocery/view/home/home_screen.dart';
import 'package:my_grocery/view/product/product_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomeScreen(),
              ProductScreen(),
              CategoryScreen(),
              AccountScreen(),
            ],
          ),

        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 0.7
                  )
              )
          ),
          child: SnakeNavigationBar.color(
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.circle,
            padding: const EdgeInsets.symmetric(vertical: 5),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            snakeViewColor: Colors.green,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showUnselectedLabels: true,
            currentIndex: controller.tabIndex,
            onTap: (val){
              controller.updateIndex(val);

            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang Chủ'),
              BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits), label: 'Sản Phẩm'),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Danh Mục'),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Tài Khoản')
            ],
          ),
        ),
      ),
    );
  }
}
