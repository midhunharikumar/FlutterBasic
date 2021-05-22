/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';

import 'enhanced_view.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: '/', routes: {
      '/': (context) => MyStatefulWidget(),
      '/second': (context) => SecondRoute()
    });
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ListViewHome(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink[500],
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  CustomListItem({
    Key? key,
    required this.thumbnail_url,
    required this.title,
    required this.user,
    required this.location,
  }) : super(key: key);

  late Widget thumbnail;
  final String thumbnail_url;
  final String title;
  final String user;
  final String location;

  @override
  Widget build(BuildContext context) {
    thumbnail = Image(
      image: AssetImage(thumbnail_url),
    );
    return InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: thumbnail,
              ),
              Expanded(
                flex: 3,
                child: _ProviderDescription(
                  title: title,
                  user: user,
                  location: location,
                ),
              ),
              const Icon(
                Icons.more_vert,
                size: 16.0,
              ),
            ],
          ),
        ),
        onTap: () {
          print('clicked');
          Navigator.pushNamed(context, '/second', arguments: this);
        });
  }
}

class _ProviderDescription extends StatelessWidget {
  const _ProviderDescription({
    Key? key,
    required this.title,
    required this.user,
    required this.location,
  }) : super(key: key);

  final String title;
  final String user;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 40.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            user,
            style: const TextStyle(fontSize: 30.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            location,
            style: const TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}

class ListViewHome extends StatelessWidget {
  const ListViewHome({Key? key}) : super(key: key);
  CustomListItem _get_single_entry(name, image) {
    // return Card(
    //     margin: EdgeInsets.all(10.0),
    //     child:InkWell(
    //     onTap: (){print('card tapped');},
    //     splashColor : Colors.blue.withAlpha(30),

    //     child:SizedBox(height:200,child:ListTile(title: Text(name) ,
    //                 leading: Image(height:200,image: AssetImage(image)),
    //                 selected : false)),

    //   )
    //   );
    return CustomListItem(
        thumbnail_url: image,
        title: name,
        user: 'test',
        location: 'SantaClara');
  }

  List<CustomListItem> _get_opening_list() {
    final children = <CustomListItem>[];
    for (var i = 0; i < 10; i++) {
      children.add(_get_single_entry("List : $i", '../images/house_1.jpg'));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    var listView = ListView(
        padding: const EdgeInsets.all(8), children: _get_opening_list());
    return listView;
  }
}
