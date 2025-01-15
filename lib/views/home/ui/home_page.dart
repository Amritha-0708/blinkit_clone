import 'package:blinkit_clone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 10,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: false,
                backgroundColor: AppColors.backgroundYellow,
                title: Text(
                  "Blinkit",
                  style: TextStyle(
                    fontFamily: 'Celias Bold',
                    fontSize: 20.sp,
                    color: Colors.black,
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
                  )
                ],
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverTabBarDelegate(
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
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.black,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      Tab(text: "Tab 1"),
                      Tab(text: "Tab 2"),
                      Tab(text: "Tab 3"),
                      Tab(text: "Tab 4"),
                      Tab(text: "Tab 5"),
                      Tab(text: "Tab 1"),
                      Tab(text: "Tab 2"),
                      Tab(text: "Tab 3"),
                      Tab(text: "Tab 4"),
                      Tab(text: "Tab 5"),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text("Item #$index"),
                    );
                  },
                  childCount: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TextField _textField;
  final TabBar _tabBar;

  _SliverTabBarDelegate(
    this._textField,
    this._tabBar,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.backgroundYellow,
      child: Column(
        children: [
          SizedBox(
            height: 12.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              color: Colors.white,
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0.r),
            height: 60.h,
            child: _textField,
          ),
          SizedBox(
            height: 12.h,
          ),
          _tabBar,
        ],
      ),
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height + 84.h;

  @override
  double get minExtent => _tabBar.preferredSize.height + 84.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
