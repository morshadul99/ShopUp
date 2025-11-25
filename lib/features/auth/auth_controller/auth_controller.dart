

import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_up/features/auth/screens/login_screen.dart';
import 'package:shop_up/routes/routes_names.dart';
import 'package:shop_up/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shop_up/utils/colors.dart';


class AuthController extends GetxController{

  // email,password and name textediting controller declare here
  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController  => _emailController;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController   => _passwordController;

  TextEditingController _nameController  = TextEditingController();
  TextEditingController get nameController  => _nameController;


  bool _isLoading = false;
  bool get isLoading => _isLoading;


  //getlogin start now
  Future  getLogin()async{

    var url = Uri.parse("${AppConstants.base_url}${AppConstants.custom_login}");
    print(url);

    var response = await http.post(url,body: {
      
      "email": _emailController.text.toString(),
      "password": _passwordController.text.toString(),
      
    });
    print("response body is : ${response.body}");

    var data = jsonDecode(response.body);
    print("all data ${data}");

    Get.snackbar(
        "status",
        "${data['msg']}",
        backgroundColor: Appcolors.primary_color,
        colorText: Appcolors.white_color,
        snackPosition: SnackPosition.BOTTOM
    );


    if(response.statusCode == 200 && data["auth_token"]!=null){

      SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();

      await sharedPreferences.setString("${AppConstants.token}", data["auth_token"]);
      Get.offAllNamed(RoutesName.bottomNavigation);

    }else{
      Get.snackbar(

        snackPosition: SnackPosition.BOTTOM,
        colorText: Appcolors.white_color,
        backgroundColor: Appcolors.primary_color,
        "Status",
        data['msg'],

      );


    }


  }//getlogin end now


  //getRegister now
   Future<void> getRegister()async{

    String url ="${AppConstants.base_url}${AppConstants.custom_register}";

    print(url);
    var request = await http.MultipartRequest('POST', Uri.parse(url));

    request.fields['name'] = _nameController.text.toString();
    request.fields['email']= _emailController.text.toString();
    request.fields ['password'] = _passwordController.text.toString();
    
    if(imagePath!=null){
      
      request.files.add( await http.MultipartFile.fromPath('image', imagePath!.path));

    }

    var responseByte =await request.send();

    var responseString = await responseByte.stream.bytesToString();

    print("response body is : ${responseString}");
    
    var value = jsonDecode(responseString);

    print("STRING body is : ${responseString}");
    
    if(responseByte.statusCode == 200){

      Get.snackbar(

      backgroundColor: Appcolors.primary_color,
          colorText: Appcolors.white_color,
          snackPosition: SnackPosition.BOTTOM,
          "Status",
          value["msg"],
      );

      Get.to(LoginScreen());
      update();
      
    }else{

      Get.snackbar(

        snackPosition: SnackPosition.BOTTOM,
        colorText: Appcolors.white_color,
        backgroundColor: Appcolors.primary_color,
        "Status",
        value['msg'],

      );
    }


   }


  //getLogout start now
  Future<void>getLogout()async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("${AppConstants.token}");
    Get.to(LoginScreen());
    update();
  }// getLogout end now


  // ImagePicker start now

  XFile? imagePath;
  ImagePicker imagePicker = ImagePicker(); //create an instance of ImagePicker

  Future<void> pickImage()async{

    final XFile? picked =await imagePicker.pickImage(source: ImageSource.gallery);

    if(picked !=null){

      imagePath = picked;
      update();
    }else{

      Get.snackbar("sorry", "Image has not selected!");
    }

  }







// password visibility on or off
  bool isPassword = false;
  setVisiblityIcon(){

    isPassword = !isPassword;
    update();
  }

  // onInit fuctions



}