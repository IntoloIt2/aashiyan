// // Copyright 2019 The Flutter team. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// import 'package:flutter/material.dart';

// class _TabsScrollableDemo extends StatefulWidget {
//   @override
//   __TabsScrollableDemoState createState() => __TabsScrollableDemoState();
// }

// class __TabsScrollableDemoState extends State<_TabsScrollableDemo>
//     with SingleTickerProviderStateMixin, RestorationMixin {
//   TabController? _tabController;

//   final RestorableInt tabIndex = RestorableInt(0);

//   @override
//   String get restorationId => 'tab_scrollable_demo';

//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     registerForRestoration(tabIndex, 'tab_index');
//     _tabController!.index = tabIndex.value;
//   }

//   @override
//   void initState() {
//     _tabController = TabController(
//       initialIndex: 0,
//       length: 12,
//       vsync: this,
//     );
//     _tabController!.addListener(() {
//       // When the tab controller's value is updated, make sure to update the
//       // tab index value, which is state restorable.
//       setState(() {
//         tabIndex.value = _tabController!.index;
//       });
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController!.dispose();
//     tabIndex.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final localizations = GalleryLocalizations.of(context)!;
//     final tabs = [
//       localizations.colorsRed,
//       localizations.colorsOrange,
//       localizations.colorsGreen,
//       localizations.colorsBlue,
//       localizations.colorsIndigo,
//       localizations.colorsPurple,
//       localizations.colorsRed,
//       localizations.colorsOrange,
//       localizations.colorsGreen,
//       localizations.colorsBlue,
//       localizations.colorsIndigo,
//       localizations.colorsPurple,
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(localizations.demoTabsScrollingTitle),
//         bottom: TabBar(
//           controller: _tabController,
//           isScrollable: true,
//           tabs: [
//             for (final tab in tabs) Tab(text: tab),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           for (final tab in tabs)
//             Center(
//               child: Text(tab),
//             ),
//         ],
//       ),
//     );
//   }
// }

