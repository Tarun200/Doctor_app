import 'package:flutter/material.dart';
import 'colors.dart';
class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCategoryPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
    );
  }
}
class MyCategoryPage extends StatefulWidget {
  @override
  State<MyCategoryPage> createState() => _MyCategoryPageState();
}

class _MyCategoryPageState extends State<MyCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                painter: MyPainter(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 30,
                    ),
                    actions: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [getStartedColorStart,getStartedColorEnd],
                            stops: [0,1]
                          ),
                      ),
                        child: Center(
                          child: Text(
                              "T",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ) ,
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 14,right: 20,top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Select a Category and Doctor",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 130,
                          margin: EdgeInsets.only(top: 10),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container_Category("pic6.png","Cardiology"),
                              Container_Category("pic3.png","Opthalmology"),
                              Container_Category("pic4.png","Oncology"),
                              Container_Category("pic7.png","Ortho"),
                              Container_Category("pic2.png","MRI Scan"),
                            ],
                          ),
                        ),
                        Text(
                            "Doctors",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 450,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                DocCreate("doc1.png","Ellie Edwards"),
                                DocCreate("doc2.png","Greg Anderson"),
                                DocCreate("doc3.png","Matt Parker"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
  Container Container_Category(String imgName,String title){
    return Container(
      width: 135,
      child: Column(
        children: [
          Image.asset("assets/images/category/$imgName"),
          Text(
            "$title",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
  Container DocCreate(String imgName,String Name){
    return Container(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: docContentBgColor,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/docimg/$imgName"),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *0.5,
                      child: Text(
                          "Dr.$Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(width: MediaQuery.of(context).size.width *0.5,
                      height:50,
                      child: Text(
                        "Description About The Doctor",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.color = path2Color;
    Path path = new Path();
    path.moveTo(0,0);
    path.lineTo(size.width*0.3,0);
    path.quadraticBezierTo(size.width*0.5, size.height*0.03, size.width*0.42, size.height*0.17);
    path.quadraticBezierTo(size.width*0.35, size.height*0.32, 0, size.height*0.29);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
  
}
