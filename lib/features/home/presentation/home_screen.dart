import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var navDrawerIndex = 0;
  var navBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(
        onDestinationSelected: (int index) {
          setState(() {
            navDrawerIndex = index;
            print('navDrawerIndex: $navDrawerIndex');
          });
        },
        selectedIndex: navDrawerIndex,
        children: <Widget>[
          // const DrawerHeader(
          //   child: Text('Drawer Header'),
          // ),

          // Basic navigation destinations.
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Basic',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const NavigationDrawerDestination(
            label: Text('Home'),
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
          ),
          const NavigationDrawerDestination(
            label: Text('Order'),
            icon: Icon(Icons.fastfood_outlined),
            selectedIcon: Icon(Icons.fastfood_rounded),
          ),
          const NavigationDrawerDestination(
            label: Text('Cart'),
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart_rounded),
          ),
          const NavigationDrawerDestination(
            label: Text('Profile'),
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person_rounded),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),

          // Other navigation destinations.
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Others',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const NavigationDrawerDestination(
            label: Text('Settings'),
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings_rounded),
          ),
          const NavigationDrawerDestination(
            label: Text('About'),
            icon: Icon(Icons.info_outlined),
            selectedIcon: Icon(Icons.info_rounded),
          ),
          const NavigationDrawerDestination(
            label: Text('Feedback'),
            icon: Icon(Icons.feedback_outlined),
            selectedIcon: Icon(Icons.feedback_rounded),
          ),
          const NavigationDrawerDestination(
            label: Text('Log out'),
            icon: Icon(Icons.logout_outlined),
            selectedIcon: Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text('Home'),
            floating: true,
            pinned: false,
            snap: true,
            // TODO: Improve SliverAppBar UI.
            // expandedHeight: 160.0,
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text('Home'),
            //   background: FlutterLogo(),
            // ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Home'),
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              color: index.isOdd ? Colors.white : Colors.black12,
              height: 100.0,
              child: Center(
                child: Text('$index', textScaleFactor: 5),
              ),
            );
          })),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            navBarIndex = value;
            print('navBarIndex: $navBarIndex');
          });
        },
        selectedIndex: navBarIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fastfood_outlined),
            selectedIcon: Icon(Icons.fastfood_rounded),
            label: 'Order',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart_rounded),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
