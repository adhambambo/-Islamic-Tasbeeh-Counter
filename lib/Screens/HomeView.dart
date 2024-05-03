import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Cores/Colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Reset({bool resetGoal = false}){
    setCount( _Counter = 0);
    setTime(_timr = 0);
    setgoal(_goal = 25);
resetGoal ? setgoal(25) : null;
  }
setCount(int value)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('counter', value);
  getCount();
}
setTime(int value)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('time', value);
  getCount();
}
setgoal(int value)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('goal', value);
  getCount();
}
setcolor(int value)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('color', value);
  getCount();
}
getCount() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
        _Counter =  prefs.getInt('counter') ?? 0;
        _timr =  prefs.getInt('time') ?? 0;
        _goal = prefs.getInt('goal') ?? 25;
        ColorHex =prefs.getInt('color') ?? 0xffb1001c;

    });

}
@override
  void initState() {
getCount();
  }
  int _Counter = 0;
  int _timr =0;
  int _goal = 25;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
Color MainColor= Color(ColorHex);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){Reset(resetGoal: true);},child: Icon(Icons.refresh),backgroundColor: MainColor,),
        appBar: AppBar(title:Text('') ,
      backgroundColor: MainColor,
      elevation: 0,
      actions: [
        IconButton(onPressed: (){
          setState(() {
                      isActive=!isActive;

          });
        },
         icon: Icon(isActive? Icons.color_lens_outlined: Icons.color_lens,)),
        
      ],
      
      ),
      body: Column(children: [
        Container(
          height: 150,
          decoration: BoxDecoration(color: MainColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child:
                 Text('الهدف',style: TextStyle(fontSize: 20,color: Colors.white),)
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [IconButton(onPressed: (){setgoal(_goal -1);}, icon: Icon(Icons.remove_circle,color: Colors.white,)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$_goal',style: TextStyle(fontSize: 20,color: Colors.white)),
                  ),
                  IconButton(onPressed: (){setgoal(_goal +1);}, icon: Icon(Icons.add_circle,color: Colors.white,)
                  ),
                  ]
                  
                  
                ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setgoal(_goal =0);
                      },
                      child: Container(child: Text('0'),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25),)
                                      ),
                    ),
                SizedBox(width: 9,),
                 GestureDetector(

                  onTap: (){
                    setgoal(_goal =33);
                  },
                   child: Container(child: Text('33'),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25),)
                                   ),
                 ),
                SizedBox(width: 9,),
                 GestureDetector(
                  onTap: (){
                    setgoal(_goal =100);
                  },
                   child: Container(child: Text('100'),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25),)
                                   ),
                 ),
                SizedBox(width: 9,),
                 GestureDetector(
                  onTap: (){
                    setgoal(_goal +100);
                  },
                   child: Container(child: Text('+100'),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25),)
                                   ),
                 ),
                SizedBox(width: 9,),
                 GestureDetector(
                  onTap: (){
                    setgoal(_goal +1000);
                  },
                   child: Container(child: Text('+1000'),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12),)
                                   ),
                 ),
                SizedBox(width: 9,),
                ]
                ,)
      
                 ]
                 
                 ,),
        ),
        Column(children: [
          Text("الاستغفار",style: TextStyle(fontSize: 20,color:MainColor)),
        SizedBox(height: 8,),
           Text("$_Counter",style: TextStyle(fontSize: 20,color:MainColor)),
        SizedBox(height: 8,),
      
       CircularPercentIndicator(
  radius: 80.0,
  lineWidth: 10.0,
  percent: (_goal > 0) ? (_Counter / _goal).clamp(0.0, 1.0) : 1.0, // التحقق من أن قيمة _goal أكبر من الصفر
  center: GestureDetector(
    onTap: () {
      setState(() {
        if (_Counter >= _goal) {
          setTime(_timr + 1);
          setCount(_Counter - 1);
        } else {
          setCount(_Counter + 1);
        }
      });
    },
    child: Icon(
      Icons.touch_app_rounded,
      size: 50.0,
      color: MainColor,
    ),
  ),
  backgroundColor: MainColor.withOpacity(0.2),
  progressColor: MainColor,
),

         Text("مرات التكرار : $_timr",style: TextStyle(fontSize: 20,color:MainColor)),
        SizedBox(height: 8,),
           Text("${ _Counter }",style: TextStyle(fontSize: 20,color:MainColor)),
        ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Visibility(
            visible: isActive,
            child: Row(
              children: [
              Radio(
                fillColor: MaterialStateColor.resolveWith((states) => Color(0xffb1001c)),
                value: 0xffb1001c, groupValue: ColorHex, onChanged: (val){
                  setState(() {
            setcolor(val!);                  }
                  );
                }
                ),
                Radio(
                              fillColor: MaterialStateColor.resolveWith((states) => Color(0xff14212A)),
                  
                value: 0xff14212A, groupValue: ColorHex, onChanged: (val){  setState(() {
            setcolor(val!);                  }
                  );}
                ),
                Radio(
                                            fillColor: MaterialStateColor.resolveWith((states) => Color(0xfF92249F)),
                  
                value: 0xfF62249fF, groupValue: ColorHex, onChanged: (val){  setState(() {
            setcolor(val!);                  }
                  );}
                ),
                Radio(
                                            fillColor: MaterialStateColor.resolveWith((states) => Color(0xff62249F)),
                  
                value: 0xff62249F, groupValue: ColorHex, onChanged: (val){  setState(() {
            setcolor(val!);                }
                  );}
                )
                ]
                ,),
          ),
        )
      ],
      ),
      
      ),
    );
  }
}