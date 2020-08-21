import 'package:Your_personal/Main/Home.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Createacc extends StatefulWidget {
  Createacc({Key key}) : super(key: key);

  @override
  _CreateaccState createState() => _CreateaccState();
}
TextEditingController _controller = new TextEditingController();
TextEditingController _controller1 = new TextEditingController();
LinearGradient backgroundcolor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.blue,
  );

class _CreateaccState extends State<Createacc> {
  bool animated = false;
  double opacity= 0;

  double _heigth = 20;
  double _heigth1 = 0;
  double _heigth2 = 0;
  double _width=20;
  double _width1=0;
  double _width2=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds :400),(){
        setState(() {
        _width = 150;
        _heigth = 150;
          opacity= 1;
        _controller.text='';
        animated = true;
      });
      Future.delayed(Duration(milliseconds: 500),(){
        setState(() {
        _width2 = 300;
        _heigth2 = 60;
      });
      Future.delayed(Duration(milliseconds: 200),(){
        setState(() {
        _width1 = 250;
        _heigth1 = 50;
        _controller.text='';
      });
    });
    });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundcolor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Opacity(opacity: opacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: _width,
                height: _heigth,
                child: FlareActor('assets/icon.flr',alignment: Alignment.center,color: Colors.white,animation: 'Untitled',),
              ),
              ),
               Opacity(opacity: opacity,
            child: Container(
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: animated? TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.bold) : TextStyle(color: Colors.white,fontSize: 0,fontWeight:FontWeight.bold),
              child: Text("What is your name",textAlign: TextAlign.center,),
            ),
            ),
            ),
                ],
              ),
              Opacity(opacity: opacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
                child: Container(
                              height: _heigth2,
                              width: _width2,
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.white30
                                  )
                                ]
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(top: 5,left: 10,right: 10),
                                child: TextFormField(
                                  controller: _controller,
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "Username...",
                                    disabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hoverColor: Colors.red
                                  ),
                              ),
                              )
                            ),
              ),
              ),

              Opacity(opacity: opacity,
            child:AnimatedContainer(
              duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
           child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Password()));},
             child: Container(
              margin: const EdgeInsets.only(top: 150),
              width: _width1,
              height: _heigth1,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,color: Colors.white,),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text("Next",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              )
            ),
           )
            ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

class Password extends StatefulWidget {
  Password({Key key}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
   bool animated = false;
  double opacity= 0;

  double _heigth = 20;
  double _heigth1 = 0;
  double _heigth2 = 0;
  double _width=20;
  double _width1=0;
  double _width2=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds :400),(){
        setState(() {
        _width = 150;
        _heigth = 150;
          opacity= 1;
        _controller.text='';
        animated = true;
      });
      Future.delayed(Duration(milliseconds: 500),(){
        setState(() {
        _width2 = 300;
        _heigth2 = 60;
      });
      Future.delayed(Duration(milliseconds: 200),(){
        setState(() {
        _width1 = 250;
        _heigth1 = 50;
        _controller1.text='';
      });
    });
    });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundcolor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Opacity(opacity: opacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: _width,
                height: _heigth,
                child: FlareActor('assets/icon.flr',alignment: Alignment.center,color: Colors.white,animation: 'Untitled',),
              ),
              ),
               Opacity(opacity: opacity,
            child: Container(
              margin: const EdgeInsets.only(left:20,right: 20),
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: animated? TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.bold) : TextStyle(color: Colors.white,fontSize: 0,fontWeight:FontWeight.bold),
              child: Text("What will be your Password",textAlign: TextAlign.center,),
            ),
            ),
            ),
                ],
              ),
              Opacity(opacity: opacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
                child: Container(
                              height: _heigth2,
                              width: _width2,
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.white30
                                  )
                                ]
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(top: 5,left: 10,right: 10),
                                child: TextFormField(
                                  controller: _controller1,
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password...",
                                    disabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hoverColor: Colors.red
                                  ),
                              ),
                              )
                            ),
              ),
              ),

              Opacity(opacity: opacity,
            child:AnimatedContainer(
              duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
           child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Selectback()));},
             child: Container(
              margin: const EdgeInsets.only(top: 150),
              width: _width1,
              height: _heigth1,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,color: Colors.white,),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text("Next",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              )
            ),
           )
            ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}


class Selectback extends StatefulWidget {
  Selectback({Key key}) : super(key: key);

  @override
  _SelectbackState createState() => _SelectbackState();
}
final List<LinearGradient> title = <LinearGradient>[
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.blue,
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.orange,
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.green,
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.violet,
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.mango,
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: GradientColors.cherry,
  ),
  ];

class _SelectbackState extends State<Selectback> {

  double _width = 10;
  double _height = 10;
  double opacity = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 200),(){
      setState(() {
        _width = 150;
        _height = 150;
        opacity = 1;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundcolor,
        ),
        child: Center(
          child: Column(
            children: [
              Container(margin: const EdgeInsets.only(top: 30)),
              Opacity(
                opacity: opacity,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: _height,
                  width: _width,
                  child: FlareActor('assets/icon.flr',alignment: Alignment.center,color: Colors.white,animation: 'Untitled',),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10,right: 10),
                child: Text("Select Your Fav Color for Background",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
              ),
              Container(
                height: 300,
                width: 300,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation( 0 / 360),
                  child:new Swiper(
                  itemHeight: 50,
                  itemWidth: 50,
                  curve: Curves.easeIn,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context,int index){
                    return new InkWell(
                      onTap: (){
                        setState(() {
                          backgroundcolor = title[index];
                        });
                      },
                      child: Container(
                      margin: const EdgeInsets.all(50),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.white
                            )
                          ],
                          borderRadius: BorderRadius.circular(50),
                        gradient: title[index]
                      )
                      )
                    ),
                    );
                  },
                  itemCount: title.length,
                  layout: SwiperLayout.DEFAULT,
                  //pagination: new SwiperPagination(),
                ),
              )
              ),
              Opacity(opacity: opacity,
            child:AnimatedContainer(
              duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
                child: InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));},
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1,color: Colors.white,),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("Continue",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      )
                    ),
                )
              ),
            ),
            ],
          ),
        )
      ),
    );
  }
}