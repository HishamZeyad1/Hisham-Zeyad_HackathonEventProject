// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/widgets/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> with Helpers {
  // late int formType;
  // CalendarFormat _calendarFormat = CalendarFormat.week;
  // DateTime _focusedDay =
  // DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  // DateTime? _selectedDay;
  // int? _selectedValue;
  //
  late TextEditingController _incomeTextController;
  // late TextEditingController _amountTextController;
  // late TextEditingController _categoryTextController;

  @override
  void initState() {
    // TODO: implement initState
    _incomeTextController = TextEditingController();
    // _amountTextController = TextEditingController();
    // _categoryTextController = TextEditingController();
    // formType =
    //     Provider.of<SelectedCardProvider>(context, listen: false).CardSelected;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _incomeTextController.dispose();
    // _amountTextController.dispose();
    // _categoryTextController.dispose();
    super.dispose();
  }
  // late List<Category> _ExpenseCategories;
  // late List<Category> _IncomeCategories;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,   //new line

      appBar: AppBar(
        leadingWidth: 80,
        titleSpacing: 30,
        // toolbarHeight: 55,
        // toolbarOpacity: 1,
        // toolbarHeight: 56,
        elevation: 0,
        // backgroundColor: Colors.grey.shade700,
        backgroundColor: Colors.transparent,

        shadowColor: Colors.white,

        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('dddd',
          // formType == 1
          //     ? AppLocalizations.of(context)!.addincome
          //     : AppLocalizations.of(context)!.addexpense,
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        //"Add Income" : "Add Expense",
        actions: [
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 10) ,
        children: [
          Container(
            //color: Colors.blue,
            margin: EdgeInsets.only(right: 30, left: 30, top: 20),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   padding: EdgeInsets.zero,
                //   color: Colors.white,
      //           //   child: TableCalendar(
      //           //     firstDay: kFirstDay,
      //           //     lastDay: kLastDay,
      //           //     focusedDay: _focusedDay,
      //           //     calendarFormat: _calendarFormat,
      //           //     selectedDayPredicate: (day) {
      //           //       print(
      //           //           "================selectedDayPredicate=====================");
      //           //       print('${_calendarFormat} ');
      //           //       print('${_focusedDay} ');
      //           //       print('${_selectedDay} ');
      //           //       return isSameDay(_selectedDay, day);
      //           //     },
      //           //     onDaySelected: (selectedDay, focusedDay) {
      //           //       if (!isSameDay(_selectedDay, selectedDay)) {
      //           //         // Call `setState()` when updating the selected day
      //           //         setState(() {
      //           //           _selectedDay = selectedDay;
      //           //           _focusedDay = focusedDay;
      //           //         });
      //           //       }
      //           //       print(
      //           //           "================onDaySelected=====================");
      //           //       print('${_calendarFormat} ');
      //           //       print('${_focusedDay} ');
      //           //       print('${_selectedDay} ');
      //           //     },
      //           //     onFormatChanged: (format) {
      //           //       if (_calendarFormat != format) {
      //           //         // Call `setState()` when updating calendar format
      //           //         setState(() {
      //           //           _calendarFormat = format;
      //           //         });
      //           //       }
      //           //       print(
      //           //           "================onFormatChanged=====================");
      //           //       print('${_calendarFormat} ');
      //           //       print('${_focusedDay} ');
      //           //       print('${_selectedDay} ');
      //           //     },
      //           //     onPageChanged: (focusedDay) {
      //           //       // No need to call `setState()` here
      //           //       _focusedDay = focusedDay;
      //           //       print(
      //           //           "================onPageChanged=====================");
      //           //       print('${_calendarFormat} ');
      //           //       print('${_focusedDay} ');
      //           //       print('${_selectedDay} ');
      //           //     },
      //           //   ),
      //           // ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.zero,
                  // color: Colors.blue,
                  child: Text("Name",
                    // formType == 1
                    //     ? AppLocalizations.of(context)!.incometitle
                    //     : AppLocalizations.of(context)!.expensetitle,
                    // "Income Title" : "Expense Title",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                AppTextField(
                  controller: _incomeTextController,
                  hint: 'Enter event name',
                ),
                SizedBox(
                  height: 11,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    Container(width: 140,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.zero,
                          // color: Colors.blue,
                          child: Text("Date",
                            // formType == 1
                            //     ? AppLocalizations.of(context)!.incometitle
                            //     : AppLocalizations.of(context)!.expensetitle,
                            // "Income Title" : "Expense Title",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        AppTextField(
                          controller: _incomeTextController,
                          hint: '21 Dec 2021',
                        ),
                      ],
                    ),
                  ),
                    Spacer(),
                    Container(width: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.zero,
                          // color: Colors.blue,
                          child: Text("Time",
                            // formType == 1
                            //     ? AppLocalizations.of(context)!.incometitle
                            //     : AppLocalizations.of(context)!.expensetitle,
                            // "Income Title" : "Expense Title",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        AppTextField(
                          controller: _incomeTextController,
                          hint: '12:00 PM',
                        ),
                      ],
                    ),
                  ),
                  ]
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.zero,
                  // color: Colors.blue,
                  child: Text("Hour",
                    // formType == 1
                    //     ? AppLocalizations.of(context)!.incometitle
                    //     : AppLocalizations.of(context)!.expensetitle,
                    // "Income Title" : "Expense Title",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                AppTextField(
                  controller: _incomeTextController,
                  hint: 'Enter Number of Hour',
                ),
                SizedBox(
                  height: 11,
                ),

                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.zero,
                  // color: Colors.blue,
                  child: Text("Category",
                    // formType == 1
                    //     ? AppLocalizations.of(context)!.incometitle
                    //     : AppLocalizations.of(context)!.expensetitle,
                    // "Income Title" : "Expense Title",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                AppTextField(
                  controller: _incomeTextController,
                  hint: 'Enter Category',
                ),
                SizedBox(
                  height: 11,
                ),

                Container(
                  padding: EdgeInsets.zero,
                  // color: Colors.blue,
                  child: Text("Location",
                    // formType == 1
                    //     ? AppLocalizations.of(context)!.incometitle
                    //     : AppLocalizations.of(context)!.expensetitle,
                    // "Income Title" : "Expense Title",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                AppTextField(
                  controller: _incomeTextController,
                  hint: 'Enter Location',maxline: 1,
                ),
                SizedBox(
                  height: 11,
                ),

                SizedBox(
                  height: 5,
                ),

                Container(
                  padding: EdgeInsets.zero,
                  // color: Colors.blue,
                  child: Text("Location",
                    // formType == 1
                    //     ? AppLocalizations.of(context)!.incometitle
                    //     : AppLocalizations.of(context)!.expensetitle,
                    // "Income Title" : "Expense Title",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                AppTextField(
                  controller: _incomeTextController,
                  hint: 'Enter Location',maxline: 3,
                ),
                SizedBox(
                  height: 11,
                ),

                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.zero,
                  // color: Colors.blue,
                  child: Text("Capture",
                    // formType == 1
                    //     ? AppLocalizations.of(context)!.incometitle
                    //     : AppLocalizations.of(context)!.expensetitle,
                    // "Income Title" : "Expense Title",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),

                SizedBox(height: 20,),


                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async =>Navigator.pushReplacementNamed(context, '/categories_screen'),//await performLogin(),
                    child: const Text('LOGIN'),

                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff253975),
                      padding: EdgeInsets.symmetric(horizontal: 9),
                      minimumSize: const Size(0, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> performCreate() async {
  //   if (checkData()) {
  //     await create();
  //   }
  // }

  // bool checkData() {
  //   print("checkData");
  //   print(_selectedDay);
  //   print(_incomeTextController.text);
  //   print(_amountTextController.text);
  //   print(_selectedValue);
  //
  //   if (_selectedDay != null &&
  //       _incomeTextController.text.isNotEmpty &&
  //       _amountTextController.text.isNotEmpty &&
  //       _selectedValue != null) {
  //     return true;
  //   }
  //   //SNACKBAR
  //   showSnackBar(
  //       context: context, message: 'Enter required data!', error: true);
  //   return false;
  // }

  // Future<void> create() async {
  //   bool created =
  //   await Provider.of<EntryProvider>(context, listen: false).create(entry);
  //   if (created) clear();
  //   String message = created ? 'Created successfully' : 'Create failed';
  //   showSnackBar(context: context, message: message, error: !created);
  // }

  // Entry get entry {
  //   Entry c = Entry();
  //   c.date =
  //   "${_focusedDay.day} ${months[_focusedDay.month - 1]} ${_focusedDay.year}";
  //   print("date: ${c.date}");
  //   c.title = _incomeTextController.text;
  //   c.amount = double.parse(_amountTextController.text);
  //   print("_selectedValue:$_selectedValue");
  //   if (_selectedValue != null)
  //     // c.category = formType == 1
  //     //     ? _IncomeShared[_selectedValue! - 1].name
  //     //     : _ExpenseShared[_selectedValue! - 1].name;
  //   print('');
  //   c.typeId = formType;
  //   print("c.typeId:${c.typeId}");
  //   return c;
  // }

  void clear() {
    // _selectedDay='';
    // _incomeTextController.text = '';
    // _amountTextController.text = '';
    // _categoryTextController.text = '';
  }
}
