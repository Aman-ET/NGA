import 'package:flutter/material.dart';
import 'package:nga/view/theme/appcolors.dart';
import 'package:nga/view/widgets/custombutton.dart';
import 'package:nga/view/widgets/customtextfield.dart';



class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
  extends State<LoginScreen>{

  //State variables

  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>();

  final TextEditingController mobileController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool isLoading = false;

  @override
  void dispose(){
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async{
    if(!formKey.currentState!.validate()){
      return;
    }

    setState(() {
      isLoading = true;
    });

    try{
      // API call

    } catch(e){
      // Handle API
      debugPrint('Login Error: $e',);
    }finally{
      setState(() {
        isLoading =false;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child:  Column(
                children: [
                  const SizedBox(height: 30),
                  //Logo

                  const Text(
                    'NGA',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40,),

                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12,),

                  const Text(
                    'Login to Continue',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 40,),

                  //mobile Number

                  CustomTextField(
                    controller: mobileController,
                    hintText: 'Mobile Number',
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,

                    validator:
                    (value){

                      if(value == null || value.isEmpty){
                        return 'Enter mobile number';
                      }

                      if(value.length !=10){
                        return 'Enter valid mobile number';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20,),

                  //Password

                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    prefixIcon: Icons.lock,

                    validator:(value){
                      if(value == null || value.isEmpty){
                        return 'Enter password';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10,),

                  Align(
                    alignment: Alignment.centerRight,

                    child: TextButton(
                        onPressed: () {},
                        child: const Text('Forget PassWord?',
                        ),
                    ),
                  ),

                  const SizedBox(height: 20,),

                  CustomButton(
                      text: 'Login',
                      onPressed: login,
                      backgroundColor: AppColors.primary,
                      textColor: AppColors.white,
                      borderWidth: 1,
                      borderRadius: 12,
                      elevation: 2,
                      isLoading: isLoading,

                  ),

                  const SizedBox(height: 40,),

                  Row(
                    children: [
                      const Expanded(
                          child: Divider(),
                      ),

                      Padding(
                        padding:
                            const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                        child: const Text(
                          'OR',
                        ),
                      ),
                      const Expanded(
                        child: Divider(),
                      )
                    ],
                  ),

                  const SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New User?',),
                      TextButton(onPressed: (){},
                          child: const Text(
                            'Create Account',
                          ),
                      ),
                    ],
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}