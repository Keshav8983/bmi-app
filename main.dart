import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'BMI APP')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue,
      body: Center(
        child: Text(
          'Welcome to BMI App',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  var wtContorller = TextEditingController();
  var ftContorller = TextEditingController();
  var inContorller = TextEditingController();
  var result ="";
  Color bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //     Color(0xfffa709a),Color(0xfffee140),Color(0xffffecd2)
        //     ],
        //     begin: FractionalOffset(0.0,0.5),
        //       end: FractionalOffset(1.0,0.5),
        //     stops: [0.0,0.4,1.0]
        //   )
        // ),
        color: bgColor,
      child:Center(
        child:Container(
    width: 300,


      child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('BMI',
            style: TextStyle(fontSize: 35,
              fontWeight: FontWeight.bold
            ),),
          SizedBox(width: 15,
          height: 12,),
          TextField(
            controller: wtContorller,
            decoration: InputDecoration(
              label: Text('enter the weight(kg)'),
              prefixIcon: Icon(Icons.line_weight),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(width: 11,),
          TextField(
            controller: ftContorller,
            decoration: InputDecoration(
              label: Text('enter the height(fit)'),
              prefixIcon: Icon(Icons.height),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(width: 11,),
          TextField(
            controller: inContorller,
            decoration: InputDecoration(
              label: Text('enter the height(inch)'),
              prefixIcon: Icon(Icons.height_sharp),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 12,),
          ElevatedButton(onPressed: (){
            var wt = wtContorller.text.toString();
            var ft = ftContorller.text.toString();
            var inch = inContorller.text.toString();

            if(wt!="" && ft!= "" && inch!=""){
               var iWt =int.parse(wt);
               var iFt =int.parse(ft);
               var iInch =int.parse(inch);

               var tInch = (iFt*12)+ iInch;

               var tCm =tInch*2.54;

               var tM=tCm/100;

               var bmi =iWt/(tM*tM);

               var msg ="";

               Color newcolor;
               if(bmi>25){
                msg = 'your weight is overrated';
                newcolor = Colors.orange.shade100;
               }else if(bmi<18){
                msg = 'your weight is underrated';
                newcolor = Colors.blue.shade100;
               }else{
                 msg= 'you are healthy';
                 newcolor = Colors.grey.shade300;
               }

               setState(() {
                 result=" $msg \n your bmi is: ${bmi.toStringAsFixed(4)}";
                 bgColor = newcolor;
               });

            }else{
              setState(() {
              result="please fill the blanks";
              });
            }

          },
              child: Text('calculator')),
          
          Text(result,style: TextStyle(fontSize: 20),),

        ],
      ),
        ),
      ),
      )
    );
  }
}
