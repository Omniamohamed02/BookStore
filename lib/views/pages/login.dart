import 'package:bookstore/service/auth_service.dart';
import 'package:bookstore/views/pages/create_account.dart';
import 'package:bookstore/views/widget/my_button.dart';
import 'package:bookstore/views/widget/my_textfield.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  var emailController =TextEditingController();
  var passwordController=TextEditingController();


  void login(BuildContext context) async{
    showDialog(context: context, builder: (context){
      return Center(child: CircularProgressIndicator(color: Color(0xFF17212C)),);
    });
    final authService =AuthService();
    authService.login(context, emailController.text, passwordController.text);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'login successfully !')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2D9BB),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Image.asset('lib/assets/image/bookstore.png',height: 150,),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: [
                        MyTextfield(lable: 'Email', message: 'Please enter your email',controller: emailController,obscureText: false,isSignup: false,),
                        MyTextfield(lable: 'Password', message: 'please enter your password',controller: passwordController,obscureText: true,isSignup: false,),
                        SizedBox(height: 10,),
                        MyButton(lable: 'Login',onTap: ()=>login(context)),
                        SizedBox(height: 35,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont have an account yet?',style: TextStyle(color:Color(0xFF17212C) ),),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>CreateAccount()));
                              },
                              child: Text('Sign up here',style: TextStyle(color:Color(0xFF17212C),fontSize:16 ,fontWeight: FontWeight.bold ),),)
                          ],
                        )
                      ]
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
