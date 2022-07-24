// import 'package:em.av.dajgi/helper/constant.dart';
// import 'package:em.av.dajgi/page/profile/profilePage.dart';
// import 'package:connectivity/connectivity.dart';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:em.av.dajgi/helper/theme.dart';
// import 'package:em.av.dajgi/model/feedModel.dart';
// import 'package:em.av.dajgi/state/authState.dart';
// import 'package:em.av.dajgi/state/feedState.dart';
// import 'package:em.av.dajgi/widgets/customWidgets.dart';
// import 'package:provider/provider.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/services.dart';
// import 'package:em.av.dajgi/helper/enum.dart';
// import 'package:em.av.dajgi/widgets/newWidget/emptyList.dart';
// import 'package:em.av.dajgi/widgets/post/post.dart';
// import 'package:em.av.dajgi/widgets/post/widgets/postBottomSheet.dart';
// import 'package:progress_indicators/progress_indicators.dart';

// import '../common/sidebar.dart';
// import 'composePost/composePost.dart';
// import 'composePost/state/composePostState.dart';


// class FeedPage extends StatelessWidget {
//   final VoidCallback openDrawer;
//   const FeedPage(
//       {Key key,
//       @required this.openDrawer,
//       this.scaffoldKey,
//       this.refreshIndicatorKey,
//       this.isListScrolling})
//       : super(key: key);

//   final GlobalKey<ScaffoldState> scaffoldKey;

//   final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

//   final Function(bool) isListScrolling;

//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//     return Scaffold(
//         body: SafeArea(
//             bottom: true,
//             // child: PlaneIndicator(
//             child: RefreshIndicator(
//               strokeWidth: 1.5,
//               key: refreshIndicatorKey,
//               onRefresh: () async {
//                 HapticFeedback.selectionClick();

//                 /// refresh home page feed
//                 var feedState = Provider.of<FeedState>(context, listen: false);

//                 feedState.getDataFromDatabase();

//                 return Future.value(true);
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: DAJGIColor.white,
//                     borderRadius: BorderRadius.all(Radius.circular(10.0))),
//                 child: _FeedPageBody(
//                   // openDrawer: openDrawer,
//                   refreshIndicatorKey: refreshIndicatorKey,
//                   scaffoldKey: scaffoldKey,
//                   isListScrolling: isListScrolling,
//                 ),
//               ),
//             )));
//   }

//   FeedModel get model => null;

//   PostType get type => null;
//   Widget _getUserAvatar(BuildContext context) {
//     var authState = Provider.of<AuthState>(context);
//     return Padding(
//       padding: EdgeInsets.all(10),
//       child: InkWell(
//         onLongPress: () {
//           HapticFeedback.lightImpact();
//         },
//         child: customInkWell(
//           context: context,
//           onPressed: () {
//             HapticFeedback.lightImpact();

//             /// Open up sidebaar drawer on user avatar tap
//             scaffoldKey.currentState.openDrawer();

//           },
//           child:
//               customImage(context, authState.userModel?.profilePic, height: 30),
//         ),
//       ),
//     );
//   }
// }

// class _FeedPageBody extends StatefulWidget {
//   final GlobalKey<ScaffoldState> scaffoldKey;
//   final VoidCallback openDrawer;

//   final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

//   final Function(bool) isListScrolling;

//   const _FeedPageBody(
//       {Key key, this.openDrawer,
//       this.scaffoldKey,
//       this.refreshIndicatorKey,
//       this.isListScrolling})
//       : super(key: key);

//   @override
//   __FeedPageBodyState createState() => __FeedPageBodyState(this.openDrawer);
// }

// class __FeedPageBodyState extends State<_FeedPageBody> {
//   __FeedPageBodyState(this.openDrawer);

//   FeedModel get model => null;
//   final VoidCallback openDrawer;
//   PostType get type => null;
//   int _selectedIcon = 0;

//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   Widget _getUserAvatar(BuildContext context) {
//     var authState = Provider.of<AuthState>(context);
//     return Padding(
//         padding: EdgeInsets.all(10),
//         child: InkWell(
//             onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProfilePage()),
//                 ),
//             child: Container(
//               child: customImage(context, authState.userModel?.profilePic,
//                   height: 35),
//             )
//             // GestureDetector(
//             //   child:
//             //       customImage(context, authState.userModel?.profilePic, height: 35),
//             //   onTap: (() {
//             //     Navigator.of(context)
//             //         .pushNamed('/ProfilePage/' + authState.userModel?.userId);
//             //   }),
//             ));
//   }

//   Color _color = Colors.black.withOpacity(0.4);
//   Color _color1 = Colors.black.withOpacity(0.4);
//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     var authstate = Provider.of<AuthState>(context, listen: false);
//     return Consumer<FeedState>(
//       builder: (context, state, child) {
//         final List<FeedModel> list = state.getPostList(authstate.userModel);
//         return NotificationListener(
//           onNotification: (ScrollNotification scrollInfo) {
//             if (scrollInfo is ScrollStartNotification) {
//               widget.isListScrolling(true);
//             } else if (scrollInfo is ScrollUpdateNotification) {
//             } else if (scrollInfo is ScrollEndNotification) {
//               widget.isListScrolling(false);
//             }
//           },
//           child: GestureDetector(
//             //
//             // onPanUpdate: (details){
//             //   if(details.delta.dx < 20) {
//             //     print("swipe left");
//             //     Navigator.of(context)
//             //         .pushNamed('/CreateFeedPageFeed/Post');
//             //     // Navigator.pop(context);
//             //   }
//             // },
//             child:  CustomScrollView(
//               slivers: <Widget>[
//                 SliverAppBar(
//                   // start je odavde//

//                   floating: true,
//                   pinned: false,
//                   elevation: 0,
//                   leadingWidth: 89,
//                   leading: Row(children: [
//                     //  Open sidebar menu
//                     //
//                     GestureDetector(
//                       onTap: () {
//                         HapticFeedback.lightImpact();

//                         /// Open up sidebaar drawer on user avatar tap
//                         // widget.scaffoldKey.currentState.openDrawer();

//                         print('show bottom menu bar');

//                         showModalBottomSheet(context:context,backgroundColor:Colors.transparent,builder:(context) => SidebarMenu(), isScrollControlled: true, );

//                       },
//                       child: Container(
//                         padding: EdgeInsets.only(left: 8),
//                         height: 50,
//                         width: 30,
//                         child: Icon(
//                           Icons.menu,
//                         ),
//                         color: Colors.transparent,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 2,
//                     ),
//                     _getUserAvatar(context),
//                   ]),

//                   title: Image.asset(
//                     "assets/images/dajgi2.png",
//                     height: 20,
//                   ),

//                   centerTitle: true,
//                   actions: <Widget>[
//                     InkWell(
//                       onTap: () {
//                         HapticFeedback.selectionClick();





//                         showBottomSheet(
//                             // useRootNavigator:true,





//                             backgroundColor: Colors.orange,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(20),
//                                 topRight: Radius.circular(20),

//                               ),
//                             ),
//                             context: context,
//                             builder: (context) => Container(
//                               decoration: BoxDecoration(
//                                   boxShadow: <BoxShadow>[
//                                     BoxShadow(
//                                         color: Colors.grey,
//                                         blurRadius: 500.0,
//                                         offset: Offset(0.0, 0.75)
//                                     )
//                                   ],
//                                   color: Colors.green
//                               ),
//                               // color:Colors.red,
//                               height: 650,

//                               child: new ChangeNotifierProvider<ComposePostState>(
//                                 create: (_) => ComposePostState(),
//                                 child: ComposePostPage(isRePost: false, isPost: true),
//                               ),
//                             ));

//                           // showModalBottomSheet(context:context,backgroundColor:Colors.transparent,builder:(context) =>   ChangeNotifierProvider<ComposePostState>(
//                           //   create: (_) => ComposePostState(),
//                           //   child: ComposePostPage(isRePost: false, isPost: true),
//                           // ),
//                           // isScrollControlled: true,
//                           // );


//                         // Navigator.of(context)
//                         //     .pushNamed('/CreateFeedPageFeed/Post');
//                       },
//                       child: SizedBox(
//                         height: 10,
//                         child: Image.asset(
//                           "assets/images/dajgi_add.png",
//                         ),
//                       ),
//                     ),
//                   ],

//                   backgroundColor: DAJGIColor.white,

// // Bottom following and for you widget

//                   //ver 1
//                   // bottom: PreferredSize(
//                   //   child: HeaderHomePage(),
//                   //   preferredSize: Size.fromHeight(28),
//                   // ),

//                   //ver 2        // bottom: PreferredSize(
//                   //   child: Column(children: <Widget>[
//                   //     SizedBox(
//                   //       height: 46,
//                   //       child: Row(
//                   //         mainAxisAlignment: MainAxisAlignment.center,
//                   //         children: [
//                   //           InkWell(
//                   //             onTap: () {
//                   //               setState(() async {
//                   //                 final result =
//                   //                     await Connectivity().checkConnectivity();
//                   //                 showConnectivitySnackBar(result);
//                   //                 print('feed taped');
//                   //                 _color = Colors.black;
//                   //                 _color1 = Colors.black.withOpacity(0.4);
//                   //               });
//                   //               HapticFeedback.lightImpact();
//                   //             },
//                   //             child: Text(' FEED',
//                   //                 style: TextStyle(
//                   //                     fontSize: 16,
//                   //                     color: _color,
//                   //                     fontWeight: FontWeight.bold)),
//                   //           ),
//                   //           SizedBox(width: 15),
//                   //           Text('|'),
//                   //           SizedBox(width: 15),
//                   //           InkWell(
//                   //             onTap: () {
//                   //               setState(() {
//                   //                 state.setpageIndex = 1;
//                   //                 _selectedIcon = 1;

//                   //                 print('dajgs taped');
//                   //                 _color1 = Colors.black;
//                   //                 _color = Colors.black.withOpacity(0.4);
//                   //               });
//                   //               HapticFeedback.lightImpact();
//                   //             },
//                   //             child: Text(
//                   //               'DAJGS',
//                   //               style: TextStyle(
//                   //                   fontSize: 18,
//                   //                   color: _color1,
//                   //                   fontWeight: FontWeight.bold),
//                   //             ),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //       //  DefaultTabController(
//                   //       //   length: 2,
//                   //       //   child: Container(
//                   //       //     child: TabBar(
//                   //       //       tabs: [
//                   //       //         Tab(icon: Text("FEED")),
//                   //       //         RawMaterialButton(
//                   //       //           onPressed: () {
//                   //       //             Navigator.push(
//                   //       //               context,
//                   //       //               MaterialPageRoute(
//                   //       //                   builder: (context) => ForYou()),
//                   //       //             );
//                   //       //           },
//                   //       //           child: Text(
//                   //       //             "DAJGS",
//                   //       //           ),
//                   //       //         )
//                   //       //         // Tab(icon: Text("DAJGS")),
//                   //       //       ],
//                   //       //     ),
//                   //       //   ),
//                   //       // ),
//                   //     ),
//                   //   ]),
//                   //   preferredSize: Size.fromHeight(46),
//                   // ),

//                   flexibleSpace: FlexibleSpaceBar(),
//                 ),

//                 // DAJGI STORIES place

//                 SliverPadding(
//                     padding: EdgeInsets.only(top: 0, bottom: 5),
//                     sliver: SliverList(delegate: SliverChildListDelegate([]))),

//                 state.isBusy && list == null
//                     ? SliverToBoxAdapter(
//                         child: Container(
//                           height: fullHeight(context) - 135,
//                           child: JumpingDotsProgressIndicator(
//                             fontSize: 40.0,
//                             color: Colors.red,
//                           ),
//                         ),
//                       )
//                     : !state.isBusy && list == null
//                         ? SliverToBoxAdapter(
//                             child: EmptyList(
//                               'no_post_available_yet'.tr(),
//                               subTitle:
//                                   'when_new_post_added_they_will_show_up_here'.tr(),
//                             ),
//                           )
//                         : SliverList(

//                             delegate: SliverChildListDelegate(
//                               list.map(
//                                 (model) {
//                                   return
//                                     // authstate.isbusy? Container(height:200, color:Colors.orange):
//                                   Post(
//                                     model: model,
//                                     trailing: PostBottomSheet().postOptionIcon(
//                                         context,
//                                         model: model,
//                                         type: PostType.Post,
//                                         scaffoldKey: scaffoldKey),
//                                   );
//                                 },
//                               ).toList(),
//                             ),
//                           ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _navigateTo(String path) {
//     Navigator.pop(context);
//     Navigator.of(context).pushNamed('/$path');
//   }

// }
