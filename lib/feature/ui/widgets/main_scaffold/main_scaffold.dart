import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_flutter/constants.dart';
import 'package:test_app_flutter/feature/data/models/address_model.dart';
import 'package:test_app_flutter/feature/ui/pages/cart_page/cart_page.dart';
import 'package:test_app_flutter/feature/ui/pages/main_page/main_page.dart';

class MainScaffold extends StatefulWidget {
  final String date;
  final AddressModel city;
   const MainScaffold({super.key, required this.city, required this.date});

  @override
  State<StatefulWidget> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {

  int _currentIndex = 0;
  String _currentPage = 'CategoryPage';
  List<String> pageKeys = ['CategoryPage', 'MenuPage', 'CartPage'];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "CategoryPage": GlobalKey<NavigatorState>(),
    "MenuPage": GlobalKey<NavigatorState>(),
    "CartPage": GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    if(tabItem == _currentPage ){
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _currentIndex = index;
      });
    }
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem, date: widget.date, city: widget.city,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRoutInCurrentTab = !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRoutInCurrentTab) {
          if (_currentPage != 'CategoryPage') {
            _selectTab('MenuPage', 1);
            return false;
          }
        }
        return isFirstRoutInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator('CategoryPage'),
            _buildOffstageNavigator('MenuPage'),
            _buildOffstageNavigator('CartPage'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            unselectedItemColor: TAB_ICON_COLOR_OFF,
            selectedItemColor: TAB_ICON_COLOR_ON,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              _selectTab(pageKeys[index], index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/home.png"),
                    size: 48,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/search.png"),
                    size: 48,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/basket.png"),
                    size: 48,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/account.png"),
                    size: 48,
                  ),
                  label: ''),
            ]),
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  final String date;
  final AddressModel city;
  const TabNavigator({Key? key, required this.navigatorKey, required this.tabItem, required this.date, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child =  MainPage(date: date, city: city,);

    if (tabItem == 'CategoryPage') {
      child =  MainPage(date: date, city: city);
      // There should be SearchPage so MenuPage is for example
    } else if (tabItem == 'MenuPage') {
      child = MainPage(date: date, city: city);
    } else if (tabItem == 'CartPage') {
      child = CartPage(date: date, city: city);
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}

