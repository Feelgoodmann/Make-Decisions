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
  var foodResInfo = {
    1: {
      "typeFood": "อาหารตามสั่ง",
      "imageUrl": "assets/images/food1.png",
      "food": ["ข้าวผัด", "ผัดกะเพรา", "ผัดพริกแกง"],
    },

    2: {
      "typeFood": "อาหารเส้น",
      "imageUrl": "assets/images/food2.png",
      "food": ["ก๋วยเตี๋ยว", "ราเมน", "ขนมจีน"],
    },

    3: {
      "typeFood": "ฟาสฟู้ต",
      "imageUrl": "assets/images/food3.png",
      "food": ["พิซซ่า", "ไก่ทอด", "แฮมเบอเกอร์"],
    },

    4: {
      "typeFood": "หมูกระทะ",
      "imageUrl": "assets/images/food4.png",
      "food": [],
    },

    5: {
      "typeFood": "อาหารริมทาง",
      "imageUrl": "assets/images/food5.png",
      "food": ["ลูกชิ้นทอด", "โรตี", "น้ำปั่น"],
    },

    6: {
      "typeFood": "อาหารเพื่อสุขภาพ",
      "imageUrl": "assets/images/food6.png",
      "food": ["อกไก่", "สลัด"],
    },

    7: {
      "typeFood": "ชาบู",
      "imageUrl": "assets/images/food7.png",
      "food": [],
    },

    8: {
      "typeFood": "อาหารอิสาน",
      "imageUrl": "assets/images/food8.png",
      "food": ["ส้มตำ", "ไก่ย่าง", "ลาบ"],
    },

    9: {
      "typeFood": "อาหารจีน",
      "imageUrl": "assets/images/food9.png",
      "food": ["โต๊ะจีน", "เป็ดปักกิ่ง", "ติ่มซำ"],
    },

    10: {
      "typeFood": "อาหารเกาหลี",
      "imageUrl": "assets/images/food10.png",
      "food": ["คิมบับ", "เนื้อย่าง", "ไก่เกาหลี"],
    },

    11: {
      "typeFood": "อาหารญี่ปุ่น",
      "imageUrl": "assets/images/food11.png",
      "food": ["ซูชิ", "ข้าวด้ง", "ราเมน"],
    },

    12: {
      "typeFood": "อาหารอินเดีย",
      "imageUrl": "assets/images/food12.png",
      "food": ["นาน", "ไก่ทันดูรี"],
    },

  };

  @override
  Widget build(BuildContext context) {
    return RandomFoodScreen(info: foodResInfo, foodImg: foodImg);
  }
}