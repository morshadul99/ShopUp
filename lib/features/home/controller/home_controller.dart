import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_up/features/home/model/all_product_model.dart';
import 'package:shop_up/features/home/model/category_model.dart';
import 'package:shop_up/features/home/model/category_products.dart';
import 'package:shop_up/features/home/model/image_slider_model.dart';
import 'package:shop_up/features/home/model/product_details_model.dart';
import 'package:shop_up/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shop_up/utils/colors.dart';

class HomeController extends GetxController implements GetxService {


  bool _isLoading = false;
  get isLoading  => _isLoading;

  int _activeIndex = 0;
  int get activeIndex =>_activeIndex;

  getActiveIndex(value){

    _activeIndex = value;
    update();

  }


  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;


  //imageSlider

  List<Sliders> _sliderList=[];
  List<Sliders> get sliderList=>_sliderList;


  Future<void> getSliderImages2()async{

    _isLoading=true;
    update();
    var url=Uri.parse("${AppConstants.base_url}${AppConstants.image_slider}");
    var responce=await http.get(url);
    // print("slider responce body is ${responce.body}");

    if(responce.statusCode==200){
      var data=jsonDecode(responce.body);
      for(var i in data['sliders']){
        _sliderList.add(Sliders.fromJson(i));
      }
    }
    // print("slider list length is ${_sliderList.length}");
    _isLoading=false;
    update();
  }
//Imageslider response end now


  // category response start now


List<Category_Model> _categoryList = [];
List<Category_Model> get categoryList => _categoryList;

  Future<void> getCategory()async{

  String url = "${AppConstants.base_url}${AppConstants.category_list}";


  _isLoading = true;
  update();

  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){

    var data  = jsonDecode(response.body);

    //print("CategroyList data is #### : ${response.body}");

    for(var i in data){

      _categoryList.add(Category_Model.fromJson(i));

    }

  }

  print("CateGory length is : ${_categoryList.length}");

  _isLoading = false;
  update();


  }// Category end now

  //allproducts start now

  List<All_Product_Model> _AllProductList = [];
  List<All_Product_Model> get AllProductList => _AllProductList;

  Future<void> getAllProducts()async{

    String  url = "${AppConstants.base_url}${AppConstants.get_all_products}";

    _isLoading = true;
    update();

    var response = await http.get(Uri.parse(url));

    //print("All Product List is %%%%%%%%%%%%%%%%%%%%%%%%% ${response.body}");

    if(response.statusCode == 200){

      var data = jsonDecode(response.body);

      //print("All Product List is %%%%%%%%%%%%%%%%%%%%%%%%% ${response.body}");
      for(var i in data){

        _AllProductList.add(All_Product_Model.fromJson(i));
      }


    }

    print("%%%%%%%%%%%%%%%%%%%% Response body length is : ${_AllProductList.length}");

    _isLoading = false;
    update();

  }// all Product list end now




  // cateGoryProductslist start now

  List<Category_Products_Model> _categoryProductList = [];
  List<Category_Products_Model> get categoryProductList => _categoryProductList;

  Future<void > getCateGoryProducts(String cate_code)async{

    String url = "${AppConstants.base_url}${AppConstants.category_wise_products}${cate_code}";

    categoryProductList.clear();
    _isLoading = true;
    update();

    var response = await http.get(Uri.parse(url));

    var data  = jsonDecode(response.body);

    //print("cateGoryproducts are %%%% : ${response.body}");
    if(response.statusCode == 200 && data["status"] == "success"){

      for(var i in data["products"]){

        _categoryProductList.add(Category_Products_Model.fromJson(i));
      }
    } else{

      Get.snackbar(

        "status",
       "${data["msg"]}",
          backgroundColor: Appcolors.primary_color,
        colorText: Appcolors.white_color,
        snackPosition: SnackPosition.BOTTOM,
      );
    }


    _isLoading = false;
    update();


  }// categoryProductList end now


  // product details clicked item index start now

  PeodutctDetailsModel ?_productDetailsModel;
  PeodutctDetailsModel get productDetailsModel=>_productDetailsModel!;

  Future<void> getProductDetails(String slug)async{
    _isLoading=true;
    update();
    var url=Uri.parse("${AppConstants.base_url}${AppConstants.all_product_details}$slug");
    var responce=await http.get(url);
    print("url is $url");
    print("product details responce body is ${responce.body}");
    if(responce.statusCode==200){
      var data=jsonDecode(responce.body);
      _productDetailsModel=PeodutctDetailsModel.fromJson(data);
    }
    _isLoading=false;
    update();
  }



  // color and size selection

  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;



  void selectedOption(int index){

    _selectedIndex = index;
    update();


  }

  int _selectedSizeIndex = -1;
  int get selectedSizeIndex => _selectedSizeIndex;



  void selectedSizeOption(int index){

    _selectedSizeIndex = index;
    update();


  }







  // clickedItemIndex

  int _clickedItemIndex = 0;
  int get clickedItemIndex => _clickedItemIndex;

  getClickedItemIndex(int currentIndex){

    _clickedItemIndex = currentIndex;

    update();
  }


  //quantity counter

  int _count = 0;
  int get count => _count;

  double _singlePrice = 0;
  double get singlePrice => _singlePrice;

  double _netPrice = 0;
  double get netPrice => _netPrice;




  //counter increement decreement
  counterIncreement(){

    _count++;
    update();

  }
  counterDecreement(){

    _count--;
    update();

  }




  Future<void> loadAllData()async{

    await getSliderImages2();
    await getCategory();
    await getAllProducts();

  }






  // @override
  // void onInit() {
  //
  //
  //
  //
  // getSliderImages2();
  // getCategory();
  // getAllProducts();
  // // TODO: implement onInit
  //   super.onInit();
  // }



}