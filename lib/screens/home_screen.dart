import 'package:astro_connect/helpers.dart';
import 'package:astro_connect/pages/pages.dart';
import 'package:astro_connect/widgets/avatar.dart';
import 'package:astro_connect/widgets/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    Home(),
    Blogs(),
    Consultations(),
    Courses(),
    Notifications(),
  ];

  final pagesTitle = const [
    'AstroConnect',
    'Blog',
    'Consultations',
    'Courses',
    'Notifications'
  ];

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('AstroConnect');

  void _onItemSelected(index) {
    pageIndex.value = index;
    title.value = pagesTitle[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Center(
              child: Text(
                value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            );
          },
        ),
        leading: Center(
          child: IconBackground(
            icon: Icons.search,
            onTap: () {
              print('TODO Search');
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Avatar.small(url: Helpers.randomPictureUrl()),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _ButtomNavigationBar(
        onItemSelected: _onItemSelected,
      ),
    );
  }
}

class _ButtomNavigationBar extends StatelessWidget {
  const _ButtomNavigationBar({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavigationBarItem(
              index: 0,
              lable: 'Home',
              icon: CupertinoIcons.home,
              onTap: onItemSelected,
            ),
            _NavigationBarItem(
              index: 1,
              lable: 'Blogs',
              icon: CupertinoIcons.bubble_left_bubble_right_fill,
              onTap: onItemSelected,
            ),
            _NavigationBarItem(
              index: 2,
              lable: 'Consultations',
              icon: CupertinoIcons.square_on_square,
              onTap: onItemSelected,
            ),
            _NavigationBarItem(
              index: 3,
              lable: 'Courses',
              icon: CupertinoIcons.book,
              onTap: onItemSelected,
            ),
            _NavigationBarItem(
              index: 4,
              lable: 'Notifications',
              icon: CupertinoIcons.bell_solid,
              onTap: onItemSelected,
            ),
          ],
        ));
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem(
      {required this.index,
      Key? key,
      required this.lable,
      required this.icon,
      required this.onTap})
      : super(key: key);

  final int index;
  final String lable;
  final IconData icon;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 15,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              lable,
              style: const TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
