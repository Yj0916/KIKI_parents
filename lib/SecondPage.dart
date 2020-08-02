import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:testingflutterapp/ChildCard.dart';
import 'package:testingflutterapp/ThirdPage.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController controller = new TextEditingController();
  List<String> ChildList = ["첫째 딸","둘째 딸","막내 아들"];
  int selectIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xfffcefa3),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('KIKEE',style: TextStyle(fontFamily: 'BMJUA',fontSize: 70,color: Colors.orange) ,),
                Image.asset('image/KIKI.png',height: 57,),
              ],
            ),
            Container(
              height: 270 ,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ChildList.length, //슬라이드 카드 정보 리스트
                itemBuilder: (BuildContext context, int index) => GestureDetector(
                  child: childCard(ChildList[index]),
                  onTap: (){
                    selectIdx = index;
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(15),
                        child: Text('추가',style: TextStyle(color: Colors.white,fontFamily: 'BMJUA',fontSize: 20),textAlign: TextAlign.center,),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            color: Colors.grey,
                            ),
                      ),
                      onTap: ()
                      {
                        Alert(
                            context: context,
                            title: "자녀 추가",
                            style: AlertStyle(
                              titleStyle: TextStyle(fontFamily: 'BMJUA',fontSize: 30,color: Colors.orange),
                              alertBorder:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                        ),
                            content: Column(
                              children: <Widget>[
                                SizedBox(height: 30,),
                                CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Color(0xfffff3e3),
                                  child: Icon(Icons.person,color: Color(0xffffcf91),size: 120,),
                                ),
                                SizedBox(height: 20,),
                                Material(
                                  elevation: 5.0,
                                  color: Colors.white,
                                  shadowColor: Color(0xffe0e0e0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: TextField(
                                      controller: controller, //입력받는 controller
                                      style: TextStyle(color: Color(0xfff0ae75), fontSize: 18,fontFamily: 'BMJUA',),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: " 자녀의 이름을 입력해 주세요",
                                          hintStyle: TextStyle(color: Color(0xfff0ae75), fontSize: 18,fontFamily: 'BMJUA',)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                color: Colors.orange,
                                radius: BorderRadius.circular(10),
                                onPressed: ()
                                {
                                  ChildList.add(controller.text);
                                  setState(() {

                                  });
                                  Navigator.pop(context);
                                }, //todo:확인 누를 시에 db에 아이 이름 추가 내용 넣기 , 현재: 임시로 리스트에만 들어가도록.
                                child: Text(
                                  "확인",
                                  style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'BMJUA',),
                                ),
                              )
                            ]).show();
                      },

                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(15),
                        child: Text('선택',style: TextStyle(color: Colors.white,fontFamily: 'BMJUA',fontSize: 20),textAlign: TextAlign.center,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.orange,
                        ),
                      ),
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

