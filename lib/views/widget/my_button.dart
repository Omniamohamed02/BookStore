import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final lable;
  final onTap;
  MyButton({required this.lable,required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
      child:   SizedBox(
        width: 370,
        height: 60,
        child: ElevatedButton(onPressed: onTap,
            child: Text(lable,style: TextStyle(color:Color(0xFFF2D9BB),fontWeight: FontWeight.bold ),),
            style:ElevatedButton.styleFrom(backgroundColor: Color(0xFF17212C)
                ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),))
        ),
      ),
    );
  }
}
