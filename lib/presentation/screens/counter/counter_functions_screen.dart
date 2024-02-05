import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {

  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: const Text('Counter Functions'),
        leading: IconButton(
          icon: const Icon( Icons.refresh_rounded ), onPressed: () { 
            setState(() {
              clickCounter = 0;
            });
         },)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  Center(
            //   child: Text(clickCounter >= 10 ? 'Llegaste a 10 taps' : '', style: const TextStyle( fontSize: 50), textAlign: TextAlign.center,)
            //   ),
            Text(clickCounter.toString(), style: const TextStyle( fontSize: 160, fontWeight: FontWeight.w100 ),),
            Text('Click${ clickCounter <= 1 ? '':'s'}', style: const TextStyle( fontSize: 25),)
          ],
        )
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () { 
      //     clickCounter++;
      //     setState(() {});
      //    },
      //   child: const Icon( Icons.plus_one ),
      // ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
            const SizedBox( height: 10 ),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: () {
                if ( clickCounter == 0) return;
                setState(() {
                  clickCounter--;
                });
              },
            ),
            const SizedBox( height: 10 ),
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              },              
            ),  
          ],
        ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  
  
  const CustomButton({
    required this.icon,
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: const StadiumBorder(),
      child:  Icon(icon),
    );
  }
}