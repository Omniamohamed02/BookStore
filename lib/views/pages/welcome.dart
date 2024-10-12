import 'package:bookstore/views/pages/create_account.dart';
import 'package:bookstore/views/pages/login.dart';
import 'package:bookstore/views/widget/my_button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFF2D9BB),
      body: SafeArea(
        child: Center(
          child: Column(

              children: [
                SizedBox(height: 150,),
                Image.asset('lib/assets/image/bookstore.png',height:300 ),
                SizedBox(height: 25,),
                Text('Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 38,color: Color(0xFF17212C)
                ),),

                SizedBox(height: 30,),
                MyButton(lable: 'Create new account',onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>CreateAccount()));
                },),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                  child: SizedBox(
                    width: 370,
                    height: 60,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Login()));
                    },
                        child: Text('Log in as a guest',style: TextStyle(color:Color(0xFF17212C)
                            ,fontWeight: FontWeight.bold ),),
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF2D9BB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Color(0xFF17212C)
                                , // Set your desired border color
                                width: 2, // Set the border width
                              ),))
                    ),
                  ),
                )]
          ),
        ),
      ),
    );
  }
}
