import 'package:age/age.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/age_calculation.dart';
import 'package:flutter/rendering.dart';
import 'dart:core';
class Homepage extends StatefulWidget {
 // const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateTime todayDate=DateTime.now();
  DateTime dob= DateTime(2000,1,1);
  late AgeDuration _ageDuration;
  late AgeDuration _nextBirthdate;
  late int _nextbdayWeekDay;
  List _months= [
    "months",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",


  ];
  List _weeks=["Weeks",
    "SUNDAY",
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY" ,
    "FRIDAY",
    "SATURDAY",
  ];
  Future<Null> _selectTodayDate(BuildContext context) async
  {
    final DateTime? picked= await showDatePicker(
      context: context,
      initialDate: todayDate,
      firstDate:dob ,
      lastDate: DateTime(2101),
    );
    if (picked!= null && picked!= todayDate)
      {
        setState(() {
          todayDate =picked;
          _ageDuration =AgeCalculation().calculateAge(todayDate,dob);
          _nextBirthdate= AgeCalculation().nextBirthday(todayDate,dob);
          _nextbdayWeekDay= AgeCalculation().nextBirthday(todayDate, dob) as int;
        });
      }
  }
  Future<Null> _selectDOBDate(BuildContext context) async
  {
    final DateTime? picked= await showDatePicker(
      context: context,
      initialDate: dob,
      firstDate:DateTime(1900) ,
      lastDate: todayDate,
    );
    if (picked!= null && picked!= todayDate)
    {
      setState(() {
        dob =picked;
        _ageDuration =AgeCalculation().calculateAge(todayDate,dob);
        _nextBirthdate= AgeCalculation().nextBirthday(todayDate,dob);
        _nextbdayWeekDay= AgeCalculation().nextBirthday(todayDate, dob) as int;
      });
    }
  }

  @override
  void initstate()
  {
    super.initState();
    _ageDuration =AgeCalculation().calculateAge(todayDate,dob);
    _nextBirthdate= AgeCalculation().nextBirthday(todayDate,dob);
    _nextbdayWeekDay= AgeCalculation().nextBirthday(todayDate, dob) as int;
  }
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      backgroundColor:Colors.black ,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children:  [
            SizedBox(
              height: 30,
              width: double.maxFinite,
            ),
            Text(
                "AGE CALCULATOR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Today",style:
                  TextStyle(
                      color:Colors.white,
                      fontWeight:FontWeight.w400
                  ),

                  ),
                  Row(
                    children: [
                      Text("${todayDate.day} ${_months[todayDate.month]} ${todayDate.year}",style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,



                      ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (){
                          _selectTodayDate(context);
                        },
                      child:Icon(
                        Icons.calendar_today,
                        color:Colors.white ,
                      ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date of Birth",
                    style:
                  TextStyle(
                      color:Colors.white,
                      fontWeight:FontWeight.w400
                  ),

                  ),
                  Row(
                    children: [
                      Text("${dob.day} ${_months[dob.month]} ${dob.year}",style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,



                      ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
              GestureDetector(
                onTap: (){
                  _selectDOBDate(context);
                },

              child:Icon(
                        Icons.calendar_today,
                        color:Colors.white ,
                      ),
            ),
                    ],
                  ),

                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 40,
              ),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(15),
              ),
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                      height:200,
                      padding: EdgeInsets.symmetric(
                        vertical:20,
                       ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "AGE",
                            style:
                            TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  "${_ageDuration.years}",
                                  style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 76,
                                      fontWeight: FontWeight.w700,


                          ),

                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                 bottom:13,
                                ),
                                child: Text(
                                  "YEARS",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,

                                  ),
                                ),
                              )

                            ],
                          ),
                          Text(
                            "${_ageDuration.months} months | ${_ageDuration.days} days ",
                            style:
                            TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                        ],
              ),
                  ),
                      Container(
                        height: 170,
                        width: 1,
                        color: Colors.blue,

                      ),
                      Container(
                        height:200,
                        padding: EdgeInsets.symmetric(
                          vertical:20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              "NEXT BIRTHDAY",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(Icons.cake,
                                color: Colors.yellowAccent,
                            size:40,
                            ),
                            Text(
                              "${_weeks[_nextbdayWeekDay]}",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "${_nextBirthdate.months} months | ${_nextBirthdate.days}days",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                          ],
                        ) ,

                      ),
                    ],
                  ),
                    Container(
                      height:1,
                      width: double.maxFinite,
                      color: Colors.white12,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                    vertical: 20,
                    ),
                    child: Text(
                      "SUMMARY",
                      style:
                        TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,


                        ),

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                       horizontal: 35,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "YEARS",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                             height:5,
                            ),
                            Text(
                              "${_ageDuration.years}",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 28,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "MONTHS",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:5,
                            ),
                            Text(
                              "${((_ageDuration.years) * 12)+ (_ageDuration.months)}",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 28,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "WEEKS",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:5,
                            ),
                            Text(
                              "${(todayDate.difference(dob).inDays / 7).floor()}",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 28,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 35,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "DAYS",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:5,
                            ),
                            Text(
                              "${todayDate.difference(dob).inDays}",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 28,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "HOURS",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:5,
                            ),
                            Text(
                              "${todayDate.difference(dob).inHours}",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 28,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "MINUTES",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:5,
                            ),
                            Text(
                              "${todayDate.difference(dob).inMinutes}",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 28,
                                fontWeight:FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:20,),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
