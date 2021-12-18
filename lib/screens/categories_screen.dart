import 'dart:ui';

import 'package:elancer_api/api/controllers/auth_api_controller.dart';
import 'package:elancer_api/api/controllers/user_api_controller.dart';
import 'package:elancer_api/models/category.dart';
import 'package:elancer_api/screens/category_detials.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<Category>> _future;
  List<Category> _categories = <Category>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = UserApiController().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Categories',
            style: GoogleFonts.cairo(
              textStyle: TextStyle(
                  fontSize: 17,
                  color: Color(0Xff1B2D49),
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: ()=> Navigator.pushNamed(context, '/tableBasicsExample'),//print("object"),//await logout(context),
              icon: const Icon(
                Icons.add,
                color: Color(0xff1B2D49),
              ),
            ),
            // IconButton(
            //   onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     return CategoryDetials(_categories[index]);
            //   },)),//Navigator.pop(context),
            //   icon: Icon(Icons.view_agenda,
            //     color: Color(0xff1B2D49),
            //   ),
            // ),
            IconButton(
              onPressed: ()async=>  await logout(context),//Navigator.pop(context),
              icon: Icon(Icons.logout,
                color: Color(0xff1B2D49),
              ),
            ),
          ],
        ),
        body:FutureBuilder<List<Category>>(
          future:_future,
          builder: (context, snapshot) {
            print(snapshot.data);
    if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
    else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
      _categories=snapshot.data!;
      return  GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          itemCount: _categories.length, //_categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 164/184,

          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Stack(children: [
                              Container(
                                width: double.infinity,
                                height: 300,
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.white, width: 4),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          _categories[index].image
                                        // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                        // "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                                        // type==1?categories[index].imageUrl:products[index].imageUrl,
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Container(
                                  decoration: BoxDecoration(color: Colors.grey,
                                    // border: Border.all(color: Colors.white, width: 4),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star),
                                      Text(_categories[index].eventsCount.toString()+'Events'),
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                        // SizedBox(
                        //   height: 2,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                          child: Text("Information Technology",style: TextStyle(fontSize: 12),),
                        ),

                      ])),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => CategoryDetials1(_categories[index].id),
            )));
            // return Card(
            //   elevation: 4,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       CircleAvatar(
            //         radius: 40,
            //         backgroundImage: NetworkImage(_categories[index].image),
            //       ),
            //       const SizedBox(height: 15),
            //       Text(
            //         _categories[index].title,
            //         style: const TextStyle(
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       )
            //     ],
            //   ),
            // );
          });
    }
    else {
          return Center(
            child: Column(
              children: const [
                Icon(Icons.warning, size: 80),
                Text(
                  'NO DATA',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          );
        }
        },),
        // body: FutureBuilder<List<Category>>(
        //   future: _future,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        //       _categories = snapshot.data ?? [];
        //       return GridView.builder(
        //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //         itemCount: _categories.length,
        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //           mainAxisSpacing: 10,
        //           crossAxisSpacing: 10,
        //         ),
        //         itemBuilder: (context, index) {
        //           return Card(
        //             elevation: 4,
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(10),
        //             ),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 CircleAvatar(
        //                   radius: 40,
        //                   backgroundImage: NetworkImage(_categories[index].image),
        //                 ),
        //                 const SizedBox(height: 15),
        //                 Text(
        //                   _categories[index].title,
        //                   style: const TextStyle(
        //                     color: Colors.black,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 )
        //               ],
        //             ),
        //           );
        //         },
        //       );
        //     } else {
        //       return Center(
        //         child: Column(
        //           children: const [
        //             Icon(Icons.warning, size: 80),
        //             Text(
        //               'NO DATA',
        //               style: TextStyle(
        //                 color: Colors.grey,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 24,
        //               ),
        //             )
        //           ],
        //         ),
        //       );
        //     }
        //   },
        // ),
        );
  }

  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut) Navigator.pushReplacementNamed(context, '/login_screen');
  }
}
