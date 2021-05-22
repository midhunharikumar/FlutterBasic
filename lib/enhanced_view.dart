/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';

import 'main.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CustomListItem;
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: FittedBox(fit: BoxFit.fill, child: args.thumbnail),
          ),
          Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 +
                  400.0,
            ),
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey,
            alignment: Alignment.center,
            child: ListingDescription(info: args),
          )
        ]));
  }
}

class ListingDescription extends StatelessWidget {
  ListingDescription({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CustomListItem info;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Text(info.title,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black)),
        Text(info.location,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black))
      ]),
      Row(children: [
        Text(info.user,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.grey, fontSize: 20))
      ])
    ]);
  }
}
