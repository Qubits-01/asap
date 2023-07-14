import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:go_router/go_router.dart';

import '../../announcements/presentation/edit_announcement_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final quill.QuillController _announcementTextController;

  @override
  void initState() {
    super.initState();

    _announcementTextController = quill.QuillController.basic();
  }

  @override
  void dispose() {
    _announcementTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: const AppNavigationDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // TODO: Implement search feature. Search for oders by date, food name, etc.
                // Search bar.
                const HomeSearchAnchor(),
                const SizedBox(height: 24.0),

                // Quick Access label.
                Text(
                  'Quick Access',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8.0),

                // List of quick access navigation destinations.
                const QuickAccessDestinationsList(),
                const SizedBox(height: 24.0),

                // Announcements label.
                Text(
                  'Announcements',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8.0),

                // List of announcements.
                Card(
                  child: Container(
                    height: 350.0,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: <Widget>[
                        quill.QuillEditor(
                          controller: _announcementTextController,
                          readOnly: false,
                          autoFocus: false,
                          focusNode: FocusNode(),
                          scrollController: ScrollController(),
                          scrollable: true,
                          padding: const EdgeInsets.all(8.0),
                          expands: false,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(EditAnnouncementScreen.routeName);
                              },
                              icon: const Icon(Icons.thumb_up_outlined),
                            ),
                            IconButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(EditAnnouncementScreen.routeName);
                              },
                              icon: const Icon(Icons.thumb_down_outlined),
                            ),
                            IconButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(EditAnnouncementScreen.routeName);
                              },
                              icon: const Icon(Icons.edit_outlined),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuickAccessDestinationsList extends StatelessWidget {
  const QuickAccessDestinationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 250.0,
        child: ListView(
          children: <Widget>[
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
              leading: const Icon(Icons.wallet_outlined),
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
              leading: const Icon(Icons.person_outline_outlined),
              title: const Text('Profile'),
              subtitle: const Text('View and edit your account details'),
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
    );
  }
}

class HomeSearchAnchor extends StatelessWidget {
  const HomeSearchAnchor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      barHintText: 'Search for past orders, food, etc.',
      isFullScreen: false,
      barTrailing: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.keyboard_voice_outlined),
        )
      ],
      suggestionsBuilder: (context, controller) {
        return [
          ListTile(
            title: const Text('[ Search feature under development ]'),
            onTap: () {},
          ),
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
    );
  }
}

class AppNavigationDrawer extends StatefulWidget {
  const AppNavigationDrawer({
    super.key,
  });

  @override
  State<AppNavigationDrawer> createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
  late int _navDrawerIndex;

  @override
  void initState() {
    super.initState();

    _navDrawerIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (int index) {
        setState(() {
          _navDrawerIndex = index;
          print('navDrawerIndex: $_navDrawerIndex');
        });
      },
      selectedIndex: _navDrawerIndex,
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
    );
  }
}
