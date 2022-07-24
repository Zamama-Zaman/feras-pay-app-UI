// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:em.av.dajgi/page/profile/profilePageIsLoading.dart';
// import 'package:drag_and_drop_gridview/devdrag.dart';
// import 'package:em.av.dajgi/page/profile/widgets/pinedPicturesProfilePage.dart';
// import 'package:em.av.dajgi/state/appState.dart';
// import 'package:flutter/material.dart';
// import 'package:em.av.dajgi/helper/constant.dart';
// import 'package:em.av.dajgi/helper/enum.dart';
// import 'package:em.av.dajgi/helper/theme.dart';
// import 'package:em.av.dajgi/model/feedModel.dart';
// import 'package:em.av.dajgi/model/user.dart';
// import 'package:em.av.dajgi/page/profile/widgets/tabPainter.dart';
// import 'package:em.av.dajgi/state/authState.dart';
// import 'package:em.av.dajgi/state/chats/chatUserState.dart';
// import 'package:em.av.dajgi/state/feedState.dart';
// import 'package:em.av.dajgi/widgets/customWidgets.dart';
// import 'package:em.av.dajgi/widgets/newWidget/customLoader.dart';
// import 'package:em.av.dajgi/widgets/newWidget/emptyList.dart';
// import 'package:em.av.dajgi/widgets/newWidget/rippleButton.dart';
// import 'package:em.av.dajgi/widgets/post/post.dart';
// import 'package:em.av.dajgi/widgets/post/widgets/postBottomSheet.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:em.av.dajgi/page/profile/qrCode/scanner.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:easy_localization/easy_localization.dart';

// import '../feed/feedPostDetail.dart';

// class ProfilePage extends StatefulWidget {
//   ProfilePage({
//     Key key,
//     this.profileId,
//   }) : super(key: key);
//   final String profileId;

//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage>
//     with SingleTickerProviderStateMixin {
//   var feedState;
//   bool isMyProfile = false;
//   int pageIndex = 0;

//   File _banner;
//   bool isLoaded = false;
//   get model => null;

//   get type => null;
//   ScrollController _scrollController = ScrollController();

//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   List<String> pinnedImages = [];
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       var authstate = Provider.of<AuthState>(context, listen: false);
//       authstate.getProfileUser(userProfileId: widget.profileId);
//       feedState = Provider.of<FeedState>(context, listen: false);
//       isMyProfile =
//           widget.profileId == null || widget.profileId == authstate.userId;
//     });

//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         _getMoreData();
//       }
//     });

//     _tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   SliverAppBar getAppbar() {
//     var authstate = Provider.of<AuthState>(context);
//     var user = authstate.profileUserModel;
//     var state = Provider.of<AppState>(
//       context,
//     );
//     return SliverAppBar(
//       primary: true,
//       pinned: true,
//       floating: false,
//       forceElevated: false,
//       expandedHeight:
//           authstate.profileUserModel.bannerImage != null ? 420 : 285,
//       // 350
//       leading: InkWell(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Image.asset(
//           "assets/images/arowLeft.png",
//           scale: 16,
//         ),
//       ),
//       leadingWidth: 57,
//       elevation: 1,
//       stretch: true,
//       iconTheme: IconThemeData(color: Colors.black),
//       backgroundColor: Colors.white,
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(
//             Icons.menu,
//             color: Colors.black,
//           ),
//           onPressed: () => PostBottomSheet().openProfileMenuSheet(
//             context,
//             type,
//           ),
//         ),
//         isMyProfile
//             ? IconButton(
//                 icon: Icon(
//                   Icons.qr_code,
//                   color: Colors.black,
//                 ),
//                 onPressed: () => Navigator.push(
//                     context, ScanScreen.getRoute(authstate.profileUserModel)),

//                 // itemBuilder: (BuildContext context) {
//                 //   return choices.map((Choice choice) {
//                 //     return PopupMenuItem<Choice>(
//                 //       value: choice,
//                 //       child: Text(choice.title),
//                 //     );
//                 //   }).toList();
//                 // },
//               )
//             : SizedBox(),
//       ],
//       flexibleSpace: FlexibleSpaceBar(
//         stretchModes: <StretchMode>[
//           StretchMode.zoomBackground,
//           StretchMode.blurBackground
//         ],
//         background: authstate.isbusy
//             ? ProfilePageIsLoading()
//             : SafeArea(
//                 child: Container(
//                   color: Colors.transparent,
//                   child: Stack(
//                     children: [
//                       //baner image
//                       Container(
//                         margin: EdgeInsets.only(top: 50),
//                         height: 170,
//                         width: fullWidth(context),
//                         child: Container(
//                           child: CachedNetworkImage(
//                             imageUrl: authstate.profileUserModel.bannerImage ??
//                                 'https://htmlcolorcodes.com/assets/images/colors/white-color-solid-background-1920x1080.png',
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),

//                       SizedBox.expand(
//                         child: Container(
//                           color: Colors.transparent,
//                           // height: 200,
//                           margin: EdgeInsets.only(
//                               top:
//                                   authstate.profileUserModel.bannerImage != null
//                                       ? 170
//                                       : 20),

//                           child: Column(children: [
//                             SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Container(
//                                     color: Colors.transparent,
//                                     width: 120,
//                                     margin: EdgeInsets.only(
//                                       top: 20,
//                                       left: 10,
//                                     ),
//                                     child: FittedBox(
//                                         fit: BoxFit.fill, child: profilePic())),

//                                 SizedBox(
//                                   width: 5,
//                                 ),

//                                 // User userName and following informations

//                                 Container(
//                                   height: 120,
//                                   margin: EdgeInsets.only(top: 50, left: 5),
//                                   color: Colors.white,
//                                   child: UserNameRowWidgetFollowing1(
//                                       user: authstate.profileUserModel,
//                                       isMyProfile: isMyProfile,
//                                       feedState: feedState),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 10),
//                             Container(
//                                 margin: EdgeInsets.only(top: 0),
//                                 alignment: Alignment.bottomCenter,
//                                 width: 400,
//                                 color: Colors.transparent,
//                                 height: 50,
//                                 child: follingEditButon()),

//                             // SizedBox(height:30),
//                           ]),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }

//   //     follingEditButon  & message button

//   Widget follingEditButon() {
//     var authstate = Provider.of<AuthState>(context, listen: false);
//     return Container(
//       color: Colors.transparent,
//       // width:MediaQuery.of(context).size.width /1,
//       // color: Colors.red,

//       // width: 150,
//       margin: EdgeInsets.only(bottom: 0, left: isMyProfile ? 5 : 5),
//       child: Row(
//         mainAxisAlignment:
//             isMyProfile ? MainAxisAlignment.start : MainAxisAlignment.center,
//         children: <Widget>[
//           //follow-unfollow/ edit button

//           Container(
//             child: RippleButton(
//               splashColor: Colors.blue,
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               onPressed: () {
//                 if (isMyProfile) {
//                   Navigator.pushNamed(context, '/EditProfile');
//                 } else {
//                   authstate.followUser(removeFollower: isFollower());
//                 }
//               },
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 47, vertical: 15),
//                 decoration: BoxDecoration(
//                   color: isFollower() ? Colors.black : AppColor.followButton,
//                   border: Border.all(
//                       color: isMyProfile ? Colors.black : Colors.black45,
//                       width: 0),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(
//                   isMyProfile
//                       ? 'Edit Profile'
//                       : isFollower()
//                           ? 'Following'
//                           : '+ Follow',
//                   style: TextStyle(
//                       color: isMyProfile
//                           ? Colors.white
//                           : isFollower()
//                               ? Colors.white
//                               : Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1),
//                 ),
//               ),
//             ),
//           ),

//           SizedBox(width: 10),

//           //message button

//           isMyProfile
//               ? Container(
//                   height: 220,
//                 )
//               : InkWell(
//                   onTap: () {
//                     if (!isMyProfile) {
//                       final chatState =
//                           Provider.of<ChatUserState>(context, listen: false);
//                       chatState.setChatUser = authstate.profileUserModel;
//                       Navigator.pushNamed(context, '/ChatScreenPage');
//                     }
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 47, vertical: 15),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color: isMyProfile ? Colors.black : Colors.black45,
//                           width: 0),
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white,
//                     ),
//                     child: Text(
//                       'Message',
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }

// // Profile picture widget

//   Widget profilePic() {
//     var authstate = Provider.of<AuthState>(context, listen: false);
//     return Stack(children: [
//       Shimmer(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFFEBEBF4),
//             Color(0xFFF4F4F4),
//             Color(0xFFEBEBF4),
//           ],
//           stops: [
//             0.1,
//             0.3,
//             0.4,
//           ],
//           begin: Alignment(-1.0, -0.3),
//           end: Alignment(1.0, 0.3),
//           tileMode: TileMode.clamp,
//         ),
//         child: Container(
//           width: 120,
//           height: 140,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: AppColor.extraLightGrey),
//           padding: EdgeInsets.only(top: 0),
//           child: Padding(
//             padding: EdgeInsets.only(left: 0),
//             child: AnimatedContainer(
//               alignment: Alignment.centerLeft,
//               duration: Duration(milliseconds: 50),
//               padding: EdgeInsets.only(left: 0),
//               // decoration: BoxDecoration(
//               //     borderRadius: BorderRadius.only(topLeft: Radius.co), shape: BoxShape.rectangle),
//             ),
//           ),
//         ),
//       ),
//       Container(
//         width: 120,
//         padding: EdgeInsets.only(top: 0),
//         child: Padding(
//           padding: EdgeInsets.only(left: 0),
//           child: AnimatedContainer(
//             alignment: Alignment.centerLeft,
//             duration: Duration(milliseconds: 50),
//             padding: EdgeInsets.only(left: 0),
//             // decoration: BoxDecoration(
//             //     borderRadius: BorderRadius.only(topLeft: Radius.co), shape: BoxShape.rectangle),
//             child: RippleButton(
//               child: customImageProfilePage(
//                 context,
//                 authstate.profileUserModel.profilePic,
//               ),
//               // borderRadius: BorderRadius.circular(10),
//               onPressed: () {
//                 // Navigator.pushNamed(context, "/ProfileImageView");
//               },
//             ),
//           ),
//         ),
//       ),
//     ]);
//   }

//   Widget _emptyBox() {
//     return SliverToBoxAdapter(child: SizedBox.shrink());
//   }

//   isFollower() {
//     var authstate = Provider.of<AuthState>(context, listen: false);
//     if (authstate.profileUserModel.followersList != null &&
//         authstate.profileUserModel.followersList.isNotEmpty) {
//       return (authstate.profileUserModel.followersList
//           .any((x) => x == authstate.userModel.userId));
//     } else {
//       return false;
//     }
//   }

//   /// This meathod called when user pressed back button
//   /// When profile page is about to close
//   /// Maintain minimum user's profile in profile page list
//   Future<bool> _onWillPop() async {
//     final state = Provider.of<AuthState>(context, listen: false);

//     /// It will remove last user's profile from profileUserModelList
//     state.removeLastUser();
//     return true;
//   }

//   TabController _tabController;

//   // void shareProfile(BuildContext context) async {
//   //   var authstate = context.read<AuthState>();
//   //   var user = authstate.profileUserModel;
//   //   Utility.createLinkAndShare(
//   //     context,
//   //     "profilePage/${widget.profileId}/",
//   //     socialMetaTagParameters: SocialMetaTagParameters(
//   //       description: !user.bio.contains("Edit profile")
//   //           ? user.bio
//   //           : "Checkout ${user.displayName}'s profile on DAJGI app",
//   //       title: "${user.displayName} is on DAJGI app",
//   //       imageUrl: Uri.parse(user.profilePic),
//   //     ),
//   //   );
//   // }

//   List<FeedModel> imageList;
//   // List<FeedModel> videoList;
//   @override
//   build(BuildContext context) {
//     var authstate = Provider.of<AuthState>(context);
//     var authState = Provider.of<AuthState>(context, listen: false);
//     List<FeedModel> list;
//     String swipeDirection;
//     String id = widget.profileId ?? authstate.userId;
//     // List<FeedModel> imageList;

//     /// Filter user's post among all posts available in home page post list
//     if (feedState.feedlist != null && feedState.feedlist.length > 0) {
//       list = feedState.feedlist.where((x) => x.userId == id).toList();
//       feedState.setMyFeeds(list);
//     }

//     if (!isLoaded) {
//       imageList =
//           list?.where((element) => element.imagesPath.isNotEmpty)?.toList();
//       feedState.myImagesFeeds = imageList;
//       // videoList =
//       //     list?.where((element) => element.videoPath.isNotEmpty)?.toList();
//       isLoaded = true;
//     }

//     return WillPopScope(
//       key: scaffoldKey,
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         body: RefreshIndicator(
//           onRefresh: () async {
//             HapticFeedback.selectionClick();
//             feedState.getDataFromDatabase();
//           },
//           child: NestedScrollView(
//             headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
//               return <Widget>[
//                 getAppbar(),
//                 authstate.isbusy
//                     ? _emptyBox()
//                     : SliverToBoxAdapter(
//                         //  Container for bio (description)
//                         child: Container(
//                           margin: EdgeInsets.only(top: 0),
//                           color: Colors.white,
//                           child: authstate.isbusy
//                               ? SizedBox.shrink()
//                               : UserNameRowWidget(
//                                   user: authstate.profileUserModel,
//                                   isMyProfile: isMyProfile,
//                                 ),
//                         ),
//                       ),
//                 SliverList(
//                   delegate: SliverChildListDelegate(
//                     [
//                       Container(
//                         color: Colors.white,
//                         child: TabBar(
//                           indicator: TabIndicator(),
//                           controller: _tabController,
//                           tabs: <Widget>[
//                             // Icon(Icons.grid_on),
//                             Text(
//                               "Photos ${imageList.length}" ?? "Photos",
//                               style: TextStyle(
//                                   // fontFamily: 'HelveticaNeue',
//                                   fontSize: 19,
//                                   fontStyle: FontStyle.normal),
//                             ),
//                             //todo translate
//                             Text(
//                               // "All Posts ${list.length}" ??
//                               'All Posts',
//                               style: TextStyle(
//                                 // fontFamily: 'HelveticaNeue',
//                                 fontSize: 19,
//                                 // fontStyle: FontStyle.normal
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ];
//             },
//             body: TabBarView(
//               // physics: NeverScrollableScrollPhysics(),
//               controller: _tabController,
//               children: [
//                 /// All posts GRID

//                 authstate.isbusy
//                     ? Container(
//                         height: fullHeight(context) - 180,
//                         child: CustomScreenLoader(
//                           height: double.infinity,
//                           width: fullWidth(context) / 2,
//                           backgroundColor: Colors.white,
//                         ),
//                       )

//                     /// if posts list is empty ojn null then need to show user a message
//                     : list == null || list.length < 1
//                         ? Listener(
//                             onPointerMove: (moveEvent) {
//                               if (moveEvent.delta.dx > 20) {
//                                 print("swipe right");
//                                 Navigator.pop(context);
//                               }
//                             },
//                             child: Container(
//                                 padding: EdgeInsets.only(
//                                     top: 50, left: 30, right: 30),
//                                 child: Center(
//                                     child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "${authstate.profileUserModel.userName.substring(1, authState.profileUserModel.userName.length)} ",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20),
//                                     ),
//                                     Text('hasn\'t post any Post yet')
//                                   ],
//                                 ))))

//                         /// If posts available then post list will displayed grid.
//                         : Listener(
//                             onPointerMove: (moveEvent) {
//                               if (moveEvent.delta.dx > 20) {
//                                 print("swipe right, close profile page");
//                                 Navigator.pop(context);
//                               }
//                             },
//                             child: SingleChildScrollView(
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     pinnedPicClass(),

//                                     // Grid
//                                     DragAndDropGridView(
//                                       // physics: ScrollPhysics(),
//                                       // physics: const NeverScrollableScrollPhysics(),
//                                       // controller: _scrollController,
//                                       padding: EdgeInsets.only(top: 0),
//                                       gridDelegate:
//                                           SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 3,
//                                         childAspectRatio: 3.5 / 5,
//                                       ),
//                                       itemBuilder: (
//                                         context,
//                                         position,
//                                       ) {
//                                         print(imageList.length);
//                                         //print( imageList[position].imagesPath[position]);
//                                         return Material(
//                                           child: InkWell(
//                                             onTap: () {
//                                               var feedstate =
//                                                   Provider.of<FeedState>(
//                                                       context,
//                                                       listen: false);
//                                               feedstate
//                                                   .getpostDetailFromDatabase(
//                                                       null,
//                                                       model:
//                                                           imageList[position]);
//                                               print(imageList[position].key);
//                                               print("its printing key above");

//                                               Navigator.of(context).pushNamed(
//                                                   '/FeedPostDetail/' +
//                                                       imageList[position].key);
//                                             },

//                                             // ovo je kad je "card" onda ima prostor izmedju posotva, kad je container onda su slike spojene kao kod instagram

//                                             // child: Card(
//                                             child: Container(
//                                               child: Container(
//                                                 height: 160,
//                                                 width: 150,
//                                                 child:
//                                                     imageList[position]
//                                                                 .imagesPath
//                                                                 .length ==
//                                                             1
//                                                         ? CachedNetworkImage(
//                                                             placeholder: (context, url) => Container(
//                                                                 margin:
//                                                                     EdgeInsets
//                                                                         .all(3),
//                                                                 height: 70,
//                                                                 width: 70,
//                                                                 color: AppColor
//                                                                     .extraLightGrey
//                                                                     .withOpacity(
//                                                                         0.3)),
//                                                             imageUrl: imageList[
//                                                                     position]
//                                                                 .imagesPath[0],
//                                                             fit: BoxFit.cover,
//                                                           )
//                                                         : Center(
//                                                             child: Container(
//                                                               height:
//                                                                   fullHeight(
//                                                                       context),
//                                                               width: fullWidth(
//                                                                   context),
//                                                               // margin:
//                                                               //     EdgeInsets.all(1),
//                                                               color:
//                                                                   Colors.white,
//                                                               child: Column(
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .center,
//                                                                 children: [
//                                                                   // pic 1

//                                                                   Container(
//                                                                       padding: EdgeInsets.only(
//                                                                           top:
//                                                                               0),
//                                                                       child:
//                                                                           CachedNetworkImage(
//                                                                         placeholder: (context, url) => Container(
//                                                                             // margin: EdgeInsets.all(3),
//                                                                             height: 100,
//                                                                             width: fullWidth(context),
//                                                                             color: AppColor.extraLightGrey.withOpacity(0.3)),
//                                                                         imageUrl:
//                                                                             imageList[position].imagesPath[0],
//                                                                         fit: BoxFit
//                                                                             .cover,
//                                                                       ),
//                                                                       height:
//                                                                           106,
//                                                                       width: fullWidth(
//                                                                           context)
//                                                                       // color: Colors.red,
//                                                                       ),

//                                                                   Row(
//                                                                       children: [
//                                                                         // pic 3

//                                                                         imageList[position].imagesPath.length >
//                                                                                 2
//                                                                             ? Container(
//                                                                                 child: CachedNetworkImage(
//                                                                                   placeholder: (context, url) => Container(margin: EdgeInsets.all(3), height: 70, width: 70, color: AppColor.extraLightGrey.withOpacity(0.3)),
//                                                                                   imageUrl: imageList[position].imagesPath[2],
//                                                                                   fit: BoxFit.cover,
//                                                                                 ),
//                                                                                 height: fullHeight(context) / 9.9,
//                                                                                 width: fullWidth(context) / 6,
//                                                                               )
//                                                                             : SizedBox(),

//                                                                         // pic 2
//                                                                         imageList[position].imagesPath.length >
//                                                                                 1
//                                                                             ? Positioned(
//                                                                                 right: 0,
//                                                                                 top: 0,
//                                                                                 child: Container(
//                                                                                   child: CachedNetworkImage(
//                                                                                     placeholder: (context, url) => Container(
//                                                                                         // margin: EdgeInsets.all(3),
//                                                                                         height: 70,
//                                                                                         width: 70,
//                                                                                         color: AppColor.extraLightGrey.withOpacity(0.3)),
//                                                                                     imageUrl: imageList[position].imagesPath[1],
//                                                                                     fit: BoxFit.cover,
//                                                                                   ),
//                                                                                   height: fullHeight(context) / 9.9,
//                                                                                   width: imageList[position].imagesPath.length  > 2  ? fullWidth(context) / 6 : fullWidth(context) / 3,
//                                                                                 ),
//                                                                               )
//                                                                             : SizedBox(),
//                                                                       ]),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                       itemCount: imageList.length,
//                                       onWillAccept: (oldIndex, newIndex) {
//                                         // Implement you own logic

//                                         // Example reject the reorder if the moving item's value is something specific
//                                         // if (imageList[newIndex] == "raspored") {
//                                         //   return false;
//                                         // }
//                                         return true; // If you want to accept the child return true or else return false
//                                       },
//                                       onReorder: (oldIndex, newIndex) {
//                                         print(oldIndex);
//                                         print(newIndex);
//                                         final temp = imageList[oldIndex];
//                                         imageList[oldIndex] =
//                                             imageList[newIndex];
//                                         imageList[newIndex] = temp;

//                                         setState(() {
//                                           // isLoaded = true;
//                                         });
//                                       },
//                                     ),
//                                     Container(
//                                         height: 50, color: Colors.transparent)
//                                   ]),
//                             ),
//                           ),
//                 // Container(color: Colors.red),
//                 // GridView.builder(
//                 //     gridDelegate:
//                 //         const SliverGridDelegateWithFixedCrossAxisCount(
//                 //       crossAxisCount: 3,
//                 //     ),
//                 //     itemCount: model.videoPath,
//                 //     itemBuilder: (BuildContext context, int index) {
//                 //       return Card(
//                 //         color: Colors.amber,
//                 //         child: Center(child: model.videoPath[0]),
//                 //       );
//                 //     }),

//                 /// All independent postss list
//                 _PostList(context, authstate, list, false, false),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _PostList(BuildContext context, AuthState authstate,
//       List<FeedModel> PostsList, bool isreply, bool isMedia) {
//     List<FeedModel> list;

//     /// If user hasn't posted yet
//     if (PostsList == null) {
//       // cprint('No Post avalible');
//     } else if (isMedia) {
//       /// Filter reply or comment post list

//       list = PostsList.where((x) => x.imagesPath != null).toList();
//     } else if (!isreply) {
//       /// Filter reply or comment post list

//       list = PostsList.where(
//           (x) => x.parentkey == null || x.childRetwetkey != null).toList();
//     } else {
//       /// List independent post
//       list = PostsList.where(
//           (x) => x.parentkey != null && x.childRetwetkey == null).toList();
//     }

//     /// if [authState.isbusy] is true then an loading indicator will be displayed on screen.
//     return authstate.isbusy
//         ? Container(
//             height: fullHeight(context) - 180,
//             child: CustomScreenLoader(
//               height: double.infinity,
//               width: fullWidth(context),
//               backgroundColor: Colors.white,
//             ),
//           )

//         /// if posts list is empty on null then need to show user a message
//         : list == null || list.length < 1
//             ? Container(
//                 padding: EdgeInsets.only(top: 50, left: 30, right: 30),
//                 child: NotifyText(
//                   title: isMyProfile
//                       ? 'You haven\'t ${isreply ? 'reply to any Post' : 'post any Post yet'}'
//                       : '${authstate.profileUserModel.userName.substring(1, authstate.profileUserModel.userName.length)} ' +
//                           '  ' +
//                           'hasn\'t ${isreply ? 'reply to any Post' : 'post any Post yet'}',
//                   subTitle: isMyProfile
//                       ? ''
//                       : 'Once he\'ll do, they will be shown up here',
//                 ),
//               )
//             //todo fix scrolling with pshyic

//             /// If posts available then post list will displayed
//             : ListView.builder(
//                 // physics: const NeverScrollableScrollPhysics(),
//                 physics: const ScrollPhysics(),
// // controller: _scrollController,
//                 padding: EdgeInsets.symmetric(vertical: 0),
//                 itemCount: list.length,
//                 itemBuilder: (context, index) => Container(
//                   decoration: new BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: new BorderRadius.only(
//                       bottomLeft: const Radius.circular(25.0),
//                       bottomRight: const Radius.circular(25.0),
//                       topLeft: const Radius.circular(25.0),
//                       topRight: const Radius.circular(25.0),
//                     ),
//                   ),
//                   //  color: DAJGIColor.white,
//                   child: Post(
//                     model: list[index],
//                     isDisplayOnProfile: true,
//                     trailing: PostBottomSheet().postOptionIcon(
//                       context,
//                       model: list[index],
//                       type: PostType.Post,
//                       scaffoldKey: scaffoldKey,
//                     ),
//                   ),
//                 ),
//               );
//   }

//   $(BuildContext context, AuthState authstate, List<FeedModel> list, bool bool,
//       bool bool2) {}

//   //ig bio
//   String getBio2(String bio2) {
//     if (isMyProfile) {
//       return bio2;
//     } else if (bio2 == null) {
//       return "";
//     } else {
//       return bio2;
//     }
//   }

//   //fb bio
//   String getBiofb(String biofb) {
//     if (isMyProfile) {
//       return biofb;
//     } else if (biofb == null) {
//       return "";
//     } else {
//       return biofb;
//     }
//   }

//   //bio tik tok
//   String getBiotiktok(String biotiktok) {
//     if (isMyProfile) {
//       return biotiktok;
//     } else if (biotiktok == null) {
//       return "";
//     } else {
//       return biotiktok;
//     }
//   }
// }

// _getMoreData() {
//   print('get more data');
// }

// class UserNameRowWidgetFollowing1 extends StatefulWidget {
//   const UserNameRowWidgetFollowing1({
//     Key key,
//     @required this.user,
//     @required this.isMyProfile,
//     this.feedState,
//   }) : super(key: key);

//   final bool isMyProfile;
//   final UserModel user;
//   final FeedState feedState;

//   @override
//   _UserNameRowWidgetFollowing1State createState() =>
//       _UserNameRowWidgetFollowing1State();
// }

// class _UserNameRowWidgetFollowing1State
//     extends State<UserNameRowWidgetFollowing1> {
//   Widget _tappbleText(
//       BuildContext context, String count, String text, String navigateTo) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, '/$navigateTo');
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           customText(
//             '$count ',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
//           ),
//           customText(
//             '$text',
//             style: TextStyle(color: Colors.black45, fontSize: 13),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _tappbleTextPostCount(
//       BuildContext context, String count, String text, String navigateTo) {
//     return InkWell(
//       onTap: () {
//         // Navigator.pushNamed(context, '/$navigateTo');
//         print('postTaped');
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           customText(
//             '$count ',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
//           ),
//           customText(
//             '$text',
//             style: TextStyle(color: Colors.black45, fontSize: 13),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<FeedModel> imageList;
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             color: Colors.transparent,
//             width: 200,
//             margin: EdgeInsets.only(top: 0),
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 10,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Center(
//                     child: Container(
//                       padding: EdgeInsets.all(2),
//                       child: Text(
//                           // UrlText(
//                           // text:
//                           '${widget.user.userName.substring(1, widget.user.userName.length)}',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w800),
//                           overflow: TextOverflow.ellipsis),
//                     ),
//                   ),
//                   widget.user.isVerified
//                       ? customIcon(context,
//                           icon: AppIcon.blueTick,
//                           isDAJGIIcon: true,
//                           iconColor: AppColor.primary,
//                           size: 13,
//                           paddingIcon: 3)
//                       : SizedBox(width: 0),
//                 ],
//               ),
//             ),
//           ),
//           Center(
//             // margin: EdgeInsets.only(left: 15),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//               child: customText(
//                 '${widget.user.displayName}',
//                 style: subtitleStyle.copyWith(fontSize: 14),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Container(
//             alignment: Alignment.center,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 //Todo translate
//                 // Text('${user.userId.length}',
//                 // style: TextStyle(fontSize: 14, color: Colors.black)),
//                 _tappbleText(context, '${widget.user.getFollower()}',
//                     ' Followers', 'FollowerListPage'),
//                 SizedBox(width: 5),

//                 _tappbleTextPostCount(
//                     context,
//                     '${widget.feedState.myFeeds.length}' ?? '-',
//                     ' All Posts',
//                     ''),

//                 SizedBox(width: 5),
//                 _tappbleText(context, '${widget.user.getFollowing()}',
//                     ' Following', 'FollowingListPage'),
//               ],
//             ),
//           ),
//           SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }

// class UserNameRowWidget extends StatefulWidget {
//   const UserNameRowWidget({
//     Key key,
//     @required this.user,
//     @required this.isMyProfile,
//   }) : super(key: key);

//   final bool isMyProfile;
//   final UserModel user;

//   @override
//   _UserNameRowWidgetState createState() => _UserNameRowWidgetState();
// }

// class _UserNameRowWidgetState extends State<UserNameRowWidget> {
//   _launchURLFB(String biofb) async {
//     String url = 'https://facebook.com/' + '$biofb';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   _launchURLIG(String bio2) async {
//     String url = 'https://instagram.com/' + '$bio2';
//     if (await canLaunch(url)) {
//       await launch(url);
//       print('Link Ig loaded');
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   _launchURLTIKTOK(String biotiktok) async {
//     String url = 'https://tiktok.com/' + '$biotiktok';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   String getBio(String bio) {
//     if (widget.isMyProfile) {
//       return bio;
//     } else if (bio == "") {
//       return "";
//     } else {
//       return bio;
//     }
//   }

//   String getBio2(String bio2) {
//     if (widget.isMyProfile) {
//       return bio2;
//     } else if (bio2 == null) {
//       return "";
//     } else {
//       return bio2;
//     }
//   }

//   String getBiofb(String biofb) {
//     if (widget.isMyProfile) {
//       return biofb;
//     } else if (biofb == null) {
//       return "";
//     } else {
//       return biofb;
//     }
//   }

//   String getBiotiktok(String biotiktok) {
//     if (widget.isMyProfile) {
//       return biotiktok;
//     } else if (biotiktok == null) {
//       return "";
//     } else {
//       return biotiktok;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//               top: 0,
//               left: 15,
//               right: 10,
//             ),
//             child: customText(
//               getBio(widget.user.bio),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               //ig
//               getBio2(widget.user.bio2) == ""
//                   ? Container()
//                   : InkWell(
//                       onTap: () {
//                         print('INSTAGRAM BUTTON TAPED');
//                         // print(_launchURLIG);

//                         print(widget.user.bio2);

//                         _launchURLIG(widget.user.bio2);
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               10,
//                             ),
//                             border: Border.all(
//                                 color: Colors.pinkAccent.withOpacity(
//                                   0.3,
//                                 ),
//                                 width: 1)),
//                         padding: const EdgeInsets.all(10.0),
//                         child: FaIcon(FontAwesomeIcons.instagram,
//                             color: Colors.black),
//                       )),
//               SizedBox(width: 20),

//               //fb
//               // getBiofb(widget.user.biofb) == ""
//               //     ? Container()
//               //     : InkWell(onTap:(){
//               //   print('FACEBOOK BUTTON TAPED');
//               //
//               //        print(widget.user.biofb);
//               //
//               //       _launchURLTIKTOK(widget.user.biofb);
//               //
//               //       },
//               //
//               //       child: Container(
//               //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10, ), border: Border.all(color: Colors.blue.withOpacity(0.3,),width: 1)),
//               //           padding: const EdgeInsets.all(10.0),
//               //           child: FaIcon(FontAwesomeIcons.facebookSquare,
//               //               color: Colors.blue)),
//               //     ),

//               SizedBox(width: 20),
//               //tik tok
//               getBiotiktok(widget.user.biotiktok) == ""
//                   ? Container()
//                   : InkWell(
//                       onTap: () {
//                         print('TikTok BUTTON TAPED');
//                         _launchURLTIKTOK(widget.user.biotiktok);
//                       },
//                       child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(
//                                 10,
//                               ),
//                               border:
//                                   Border.all(color: Colors.black, width: 1)),
//                           padding: const EdgeInsets.all(10.0),
//                           child: FaIcon(FontAwesomeIcons.tiktok,
//                               color: Colors.black)),
//                     ),
//               SizedBox(width: 20),
//             ],
//           ),

//           // Padding(
//           //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     children: <Widget>[
//           //       customIcon(context,
//           //           icon: AppIcon.locationPin,
//           //           size: 14,
//           //           isDAJGIIcon: true,
//           //           paddingIcon: 5,
//           //           iconColor: AppColor.darkGrey),
//           //       SizedBox(width: 10),
//           //       Expanded(
//           //         child: customText(
//           //           user.location,
//           //           style: TextStyle(color: AppColor.darkGrey),
//           //         ),
//           //       )
//           //     ],
//           //   ),
//           // ),

// // kalendar ikonica

//           // Padding(
//           //  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           // child: Row( mainAxisAlignment: MainAxisAlignment.center,
//           //     children: <Widget>[
//           //       customIcon(context,
//           //           icon: AppIcon.calender,
//           //           size: 14,
//           //           isDAJGIIcon: true,
//           //  paddingIcon: 5,
//           //           iconColor: AppColor.darkGrey),
//           //      SizedBox(width: 10),
//           //       customText(
//           //         getJoiningDate(user.createdAt),
//           //        style: TextStyle(color: AppColor.darkGrey),
//           //       ),
//           //    ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// class Choice {
//   const Choice({this.title, this.icon});

//   final IconData icon;
//   final String title;
// }

// class ChoiceCard extends StatelessWidget {
//   const ChoiceCard({Key key, this.choice}) : super(key: key);

//   final Choice choice;

//   @override
//   Widget build(BuildContext context) {
//     final TextStyle textStyle = Theme.of(context).textTheme.headline4;
//     return Card(
//       color: Colors.white,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Icon(choice.icon, size: 128.0, color: textStyle.color),
//             Text(choice.title, style: textStyle),
//           ],
//         ),
//       ),
//     );
//   }
// }
