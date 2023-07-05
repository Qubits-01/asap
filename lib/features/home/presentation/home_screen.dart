import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Search bar.
              SearchAnchor.bar(
                suggestionsBuilder: (context, controller) {
                  return [
                    ListTile(
                      title: const Text('Search suggestion 1'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Search suggestion 2'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Search suggestion 3'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Search suggestion 4'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Search suggestion 5'),
                      onTap: () {},
                    ),
                  ];
                },
              ),
              const SizedBox(height: 24.0),

              // Basic Navigation label.
              Text(
                'Basic Navigation',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),

              // List of basic navigation destinations.
              Card(
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 250,
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text('Dashboard'),
                        subtitle: const Text('A single place for everything'),
                        enabled: true,
                        onTap: () {},
                        selected: true,
                        contentPadding: const EdgeInsets.fromLTRB(
                          16.9,
                          0.0,
                          8.0,
                          0.0,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.fastfood_outlined),
                        title: const Text('Food Menu'),
                        subtitle: const Text('Order the food you want'),
                        enabled: true,
                        selected: false,
                        contentPadding: const EdgeInsets.fromLTRB(
                          16.9,
                          0.0,
                          8.0,
                          0.0,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.shopping_cart_outlined),
                        title: const Text('Cart'),
                        subtitle: const Text('Your selected food items'),
                        enabled: true,
                        selected: false,
                        contentPadding: const EdgeInsets.fromLTRB(
                          16.9,
                          0.0,
                          8.0,
                          0.0,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text('Wallet'),
                        subtitle: const Text('Manage your account balance'),
                        enabled: true,
                        selected: false,
                        contentPadding: const EdgeInsets.fromLTRB(
                          16.9,
                          0.0,
                          8.0,
                          0.0,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text('Profile'),
                        subtitle:
                            const Text('View and edit your account details'),
                        enabled: true,
                        selected: false,
                        contentPadding: const EdgeInsets.fromLTRB(
                          16.9,
                          0.0,
                          8.0,
                          0.0,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0),

              // Announcements label.
              Text(
                'Announcements',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Dashboard'),
                subtitle: const Text('A single place for everything'),
                enabled: true,
                selected: false,
                contentPadding: const EdgeInsets.fromLTRB(
                  16.9,
                  0.0,
                  8.0,
                  0.0,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Dashboard'),
                subtitle: const Text('A single place for everything'),
                enabled: true,
                selected: false,
                contentPadding: const EdgeInsets.fromLTRB(
                  16.9,
                  0.0,
                  8.0,
                  0.0,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Dashboard'),
                subtitle: const Text('A single place for everything'),
                enabled: true,
                selected: false,
                contentPadding: const EdgeInsets.fromLTRB(
                  16.9,
                  0.0,
                  8.0,
                  0.0,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Dashboard'),
                subtitle: const Text('A single place for everything'),
                enabled: true,
                selected: false,
                contentPadding: const EdgeInsets.fromLTRB(
                  16.9,
                  0.0,
                  8.0,
                  0.0,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Dashboard'),
                subtitle: const Text('A single place for everything'),
                enabled: true,
                selected: false,
                contentPadding: const EdgeInsets.fromLTRB(
                  16.9,
                  0.0,
                  8.0,
                  0.0,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Dashboard'),
                subtitle: const Text('A single place for everything'),
                enabled: true,
                selected: false,
                contentPadding: const EdgeInsets.fromLTRB(
                  16.9,
                  0.0,
                  8.0,
                  0.0,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Dashboard'),
                subtitle: const Text('A single place for everything'),
                enabled: true,
                selected: false,
                contentPadding: const EdgeInsets.fromLTRB(
                  16.9,
                  0.0,
                  8.0,
                  0.0,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Dashboard'),
                subtitle: const Text('A single place for everything'),
                enabled: true,
                selected: false,
                contentPadding: const EdgeInsets.fromLTRB(
                  16.9,
                  0.0,
                  8.0,
                  0.0,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Dashboard'),
                subtitle: const Text('A single place for everything'),
                enabled: true,
                selected: false,
                contentPadding: const EdgeInsets.fromLTRB(
                  16.9,
                  0.0,
                  8.0,
                  0.0,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
