import 'package:blinkit_clone/theme/app_colors.dart';
import 'package:blinkit_clone/views/categories/ui/all_products.dart';
import 'package:blinkit_clone/views/categories/ui/electronics.dart';
import 'package:blinkit_clone/views/categories/ui/fashion.dart';
import 'package:blinkit_clone/views/categories/ui/giftcard.dart';
import 'package:blinkit_clone/views/categories/ui/kids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  elevation: 0,
                  floating: false,
                  pinned: false,
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.backgroundYellow,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Blinkit",
                      style: TextStyle(
                        fontFamily: 'Celias Bold',
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.account_circle_sharp,
                          size: 40.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MyHeaderDelegate(
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25.r,
                        ),
                        suffixIcon: Icon(
                          Icons.mic,
                          size: 25.r,
                        ),
                        hintText: '''Search "cookies"''',
                        hintStyle: TextStyle(
                            fontFamily: "Celias Regular", fontSize: 14.sp),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.black,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      tabs: const [
                        Tab(
                          text: "All",
                          icon: Icon(Icons.shopping_bag),
                        ),
                        Tab(
                          text: "Electronics",
                          icon: Icon(Icons.headphones_outlined),
                        ),
                        Tab(
                          text: "Fashion",
                          icon: Icon(Icons.face_2),
                        ),
                        Tab(
                          text: "Kids",
                          icon: Icon(Icons.toys),
                        ),
                        Tab(
                          text: "Gifts",
                          icon: Icon(Icons.card_giftcard),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                AllProducts(),
                Electronics(),
                Fashion(),
                Kids(),
                Giftcard(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: AppColors.bottomNavGrey,
            showUnselectedLabels: true,
            selectedIconTheme: IconThemeData(color: AppColors.backgroundYellow),
            unselectedIconTheme: IconThemeData(color: AppColors.bottomNavGrey),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: "Bag",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: "Category",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.print),
                label: "Print",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TextField _textField;
  final TabBar _tabBar;

  const MyHeaderDelegate(
    this._textField,
    this._tabBar,
  );

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;

    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: progress,
            child: ColoredBox(
              color: AppColors.headerGrey,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: 1 - progress,
            child: ColoredBox(
              color: AppColors.backgroundYellow,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                SizedBox(height: 24.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 22.0.r),
                  height: 55.h,
                  child: _textField,
                ),
                SizedBox(height: 24.h),
                _tabBar,
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height + 103.h;

  @override
  double get minExtent => _tabBar.preferredSize.height + 103.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
