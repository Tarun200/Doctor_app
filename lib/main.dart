import 'package:flutter/material.dart';
import 'package:doctor_app/colors.dart';
import 'package:doctor_app/category_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      routes: {
        '/category_page':(context)=>CategoryPage(),
      },

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: MyPainter(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.only(top:50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Book your Appointment in just few minutes",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                        "Find your Specialist \nin DocBook",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height*0.4,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/images/homepage_pic.png"),
                  ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  child: Container(
                    height: 80,
                    width: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: [0,1],
                        colors: [getStartedColorStart,getStartedColorEnd],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Dive In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  onTap: openCategoryPage,
                ),
              ),
            ],
          )
        ],
      ),



    );
  }
  void openCategoryPage(){
    Navigator.pushNamed(context, '/category_page');
  }
}
class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    paint.color = path1Color;
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height*0.4);
    path.quadraticBezierTo(size.width*0.35,size.height*0.40,size.width*0.58,size.height*0.6);
    path.quadraticBezierTo(size.width*0.72,size.height*0.8,size.width*0.92,size.height*0.8);
    path.quadraticBezierTo(size.width*0.98, size.height*0.8, size.width, size.height*0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
