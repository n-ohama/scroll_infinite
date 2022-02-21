import 'package:flutter/material.dart';
import 'package:scroll_infinite/components/character_list_view.dart';
import 'package:scroll_infinite/components/grid_components/character_sliver_grid.dart';
import 'package:scroll_infinite/screens/child_screens/character_sliver_list.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  int _selectedBottomNavigationIndex = 0;

  final List<_BottomNavigationItem> _bottomNavigationItems = [
    _BottomNavigationItem(
      label: 'Pull to Refresh',
      iconData: Icons.refresh,
      widgetBuilder: (context) => const CharacterListView(),
    ),
    _BottomNavigationItem(
      label: 'Search/Snackbar',
      iconData: Icons.search,
      widgetBuilder: (context) => CharacterSliverList(),
    ),
    _BottomNavigationItem(
      label: 'BLoC/Grid/Search',
      iconData: Icons.grid_on,
      widgetBuilder: (context) => CharacterSliverGrid(),
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Characters'),
    ),
    resizeToAvoidBottomInset: false,
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedBottomNavigationIndex,
      items: _bottomNavigationItems
          .map(
            (item) => BottomNavigationBarItem(
          icon: Icon(item.iconData),
          label: item.label,
        ),
      )
          .toList(),
      onTap: (newIndex) => setState(
            () => _selectedBottomNavigationIndex = newIndex,
      ),
    ),
    body: IndexedStack(
      index: _selectedBottomNavigationIndex,
      children: _bottomNavigationItems
          .map(
            (item) => item.widgetBuilder(context),
      )
          .toList(),
    ),
  );
}

class _BottomNavigationItem {
  const _BottomNavigationItem({
    required this.label,
    required this.iconData,
    required this.widgetBuilder,
  });

  final String label;
  final IconData iconData;
  final WidgetBuilder widgetBuilder;
}