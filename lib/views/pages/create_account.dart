import 'package:bookstore/service/auth_service.dart';
import 'package:bookstore/views/pages/login.dart';
import 'package:bookstore/views/widget/my_button.dart';
import 'package:bookstore/views/widget/my_textfield.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPassword=TextEditingController();


  void register(BuildContext context) async{
    showDialog(context: context, builder: (context){
      return Center(child: CircularProgressIndicator(color: Color(0xFF17212C),),);
    });
    final authService= AuthService();
    authService.register(context, emailController.text, passwordController.text, confirmPassword.text);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Your account is created successfully !')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2D9BB),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 100,),
                Image.asset('lib/assets/image/bookstore.png',height: 150,),
                SizedBox(height: 60,),
                MyTextfield(lable: 'Email', message: 'Please enter your email',controller: emailController,obscureText: false,isSignup: false,),
                MyTextfield(lable: 'Password', message: 'please enter your password',controller: passwordController,obscureText: true,isSignup: true,),
                MyTextfield(lable: 'Confirm Password', message: 'Please re-enter password',controller: confirmPassword,obscureText: true,isSignup: true,),
                SizedBox(height: 10,),
                MyButton(lable: 'Create a new account',onTap: ()=>register(context)),
                SizedBox(height: 35,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? ',style: TextStyle(color:Color(0xFF17212C) ),),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Login()));
                      },
                      child: Text('Login',style: TextStyle(color:Color(0xFF17212C),fontSize:16 ,fontWeight: FontWeight.bold ),),)

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
