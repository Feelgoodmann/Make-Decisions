import 'package:flutter/cupertino.dart';

import '../screens/randomFood.dart';

class FoodResInfo extends StatefulWidget{

  const FoodResInfo({Key? key}):super (key: key);
  
  @override
  State<FoodResInfo> createState() => FoodResInfoState();
}

class FoodResInfoState extends State<FoodResInfo>{
  var foodImg = [
    "assets/images/food1.png", "assets/images/food2.png", "assets/images/food3.png",
    "assets/images/food4.png", "assets/images/food5.png", "assets/images/food6.png",
    "assets/images/food7.png", "assets/images/food8.png", "assets/images/food9.png",
    "assets/images/food10.png", "assets/images/food11.png", "assets/images/food12.png",
    ];

  var typeOfFood = [
    "อาหารตามสั่ง", "อาหารเส้น", "ฟาสฟู้ต", "หมูกระทะ",
    "อาหารริมทาง", "อาหารเพื่อสุขภาพ", "ชาบู", "อาหารอิสาน",
    "อาหารจีน", "อาหารเกาหลี", "อาหารญี่ปุ่น", "อาหารอินเดีย",
  ];

  var foodResInfo = {
    0: {
      "typeFood": "อาหารตามสั่ง",
      "imageUrl": "assets/images/food1.png",
      "food": ["ข้าวผัด", "ผัดกะเพรา", "ผัดพริกแกง"],
    },

    1: {
      "typeFood": "อาหารเส้น",
      "imageUrl": "assets/images/food2.png",
      "food": ["ก๋วยเตี๋ยว", "ราเมน", "ขนมจีน"],
    },

    2: {
      "typeFood": "ฟาสฟู้ต",
      "imageUrl": "assets/images/food3.png",
      "food": ["พิซซ่า", "ไก่ทอด", "แฮมเบอเกอร์"],
    },

    3: {
      "typeFood": "หมูกระทะ",
      "imageUrl": "assets/images/food4.png",
      "food": [],
    },

    4: {
      "typeFood": "อาหารริมทาง",
      "imageUrl": "assets/images/food5.png",
      "food": ["ลูกชิ้นทอด", "โรตี", "น้ำปั่น"],
    },

    5: {
      "typeFood": "อาหารเพื่อสุขภาพ",
      "imageUrl": "assets/images/food6.png",
      "food": ["อกไก่", "สลัด"],
    },

    6: {
      "typeFood": "ชาบู",
      "imageUrl": "assets/images/food7.png",
      "food": [],
    },

    7: {
      "typeFood": "อาหารอิสาน",
      "imageUrl": "assets/images/food8.png",
      "food": ["ส้มตำ", "ไก่ย่าง", "ลาบ"],
    },

    8: {
      "typeFood": "อาหารจีน",
      "imageUrl": "assets/images/food9.png",
      "food": ["โต๊ะจีน", "เป็ดปักกิ่ง", "ติ่มซำ"],
    },

    9: {
      "typeFood": "อาหารเกาหลี",
      "imageUrl": "assets/images/food10.png",
      "food": ["คิมบับ", "เนื้อย่าง", "ไก่เกาหลี"],
    },

    10: {
      "typeFood": "อาหารญี่ปุ่น",
      "imageUrl": "assets/images/food11.png",
      "food": ["ซูชิ", "ข้าวด้ง", "ราเมน"],
    },

    11: {
      "typeFood": "อาหารอินเดีย",
      "imageUrl": "assets/images/food12.png",
      "food": ["นาน", "ไก่ทันดูรี"],
    },

  };

  @override
  Widget build(BuildContext context) {
    return RandomFoodScreen(info: typeOfFood, foodImg: foodImg, timeSpining: 2000, timeChanging: 1000, randomYet: false, imgNum: 0);
  }
}