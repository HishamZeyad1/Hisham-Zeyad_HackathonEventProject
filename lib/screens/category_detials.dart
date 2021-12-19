
import 'package:elancer_api/api/controllers/user_api_controller.dart';
import 'package:elancer_api/models/category_detials.dart';
// import 'package:elancer_api/models/category_detials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryDetials1 extends StatefulWidget {
  late int id;
  late String categoryname;
  late int eventnumber;
  late String image;


  CategoryDetials1(this.id, this.categoryname, this.eventnumber,this.image);

  @override
  _CategoryDetials1State createState() => _CategoryDetials1State();
}

class _CategoryDetials1State extends State<CategoryDetials1> {
  List<CategoryDetials> categories=<CategoryDetials>[];
  late Future<List<CategoryDetials>> _future;
  @override
  void initState() {
    // TODO: implement initState
    _future= UserApiController().getCategoryDetials(widget.id);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                  color: Colors.blue.shade700,
                  height: 150,
            ),
                  Container(
                    // color: Colors.white,
                    height: 50,
                  ),

                ],
              ),
              Positioned(
                bottom: 5,left: 100,
                child: CircleAvatar(
                  backgroundImage:NetworkImage(
                    widget.image,
                    // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                  ) ,radius: 80,
                ),
              )
            ]
          ),
          Column(
            children: [
              SizedBox(height: 5,),
              Text(widget.categoryname,style: TextStyle(color: Colors.green,fontSize: 20)),
              SizedBox(height: 12,),
              Text(widget.eventnumber.toString()+" Events",style: TextStyle(color: Colors.green,fontSize: 20)),
              SizedBox(height: 30,),
              Container(alignment: Alignment.topLeft,margin: EdgeInsets.only(left: 20,bottom: 15),child: Text("Events",style: TextStyle(color: Colors.orange,fontSize: 20),)),

              Container(
                height: 320,
                child: FutureBuilder<List<CategoryDetials>>(
                  future: _future,
                  builder: (context, snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      categories=snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,//physics: NeverScrollableScrollPhysics(),
                        itemBuilder:(context, index) =>  Container(
                          margin: const EdgeInsets.only(right: 30,left: 20,bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: NetworkImage(
                                        categories[index].image,
                                      // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                    ),fit: BoxFit.fill)
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(width: 130,
                                child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(categories[index].time /*"12:00am - 2hours"*/),
                                    SizedBox(height: 10,),
                                    Text(categories[index].name /*"Event Name"*/),
                                    SizedBox(height: 10,),
                                    Text(categories[index].date /*"12/12/2020"*/),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Text( "Activie",style: TextStyle(color: Colors.blue),)
                            ],
                          ),
                        ) ,
                        itemCount: categories.length,
                      );
                    }else{
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
                  },
                ),
              )
            ],
          ),


        ],
      ),
    );
  }
}

