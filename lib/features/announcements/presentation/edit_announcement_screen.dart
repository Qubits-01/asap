import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class EditAnnouncementScreen extends StatefulWidget {
  const EditAnnouncementScreen({super.key});

  static const routeName = '/edit-announcement';

  @override
  State<EditAnnouncementScreen> createState() => _EditAnnouncementScreenState();
}

class _EditAnnouncementScreenState extends State<EditAnnouncementScreen> {
  late int _navDrawerIndex;
  late final TextEditingController _titleTextController;
  late final quill.QuillController _bodyTextController;

  @override
  void initState() {
    super.initState();

    _navDrawerIndex = 0;
    _titleTextController = TextEditingController();
    _bodyTextController = quill.QuillController.basic();

    // Set the initial value of the title text field.
    _titleTextController.text = 'Food Menu for 2023-JUNE-07';
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _bodyTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Announcement')),
      drawer: NavigationDrawer(
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
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // Announcement title editing field.
                TextField(
                  controller: _titleTextController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    isDense: true,

                    border: OutlineInputBorder(),
                    // TODO: Implement character counter logic.
                    counterText: '150 characters left',
                  ),
                ),
                const SizedBox(height: 24.0),

                // Text toolbar.
                quill.QuillToolbar.basic(
                  controller: _bodyTextController,
                ),

                // Text editing field.
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 500.0,
                    child: quill.QuillEditor(
                      controller: _bodyTextController,
                      readOnly: false,
                      focusNode: FocusNode(),
                      scrollController: ScrollController(),
                      scrollable: true,
                      padding: const EdgeInsets.all(16.0),
                      autoFocus: false,
                      expands: false,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                // Button/s.
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () {
                          String json = jsonEncode(
                            _bodyTextController.document.toDelta().toJson(),
                          );

                          print(json);
                        },
                        icon: const Icon(Icons.save_outlined),
                        label: const Text('Save'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
