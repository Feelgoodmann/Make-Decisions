import 'package:flutter/cupertino.dart';

import '../screens/randomFood.dart';

class FoodResInfo extends StatefulWidget{

  const FoodResInfo({Key? key}):super (key: key);
  
  @override
  State<FoodResInfo> createState() => FoodResInfoState();
}

class FoodResInfoState extends State<FoodResInfo>{
  var foodResInfo = {
    1: {
      "type": "อาหารตามสั่ง",
      "imageUrl": "assets/images/food1.png",
      "food": ["ข้าวผัด", "ผัดกะเพรา", "ผัดพริกแกง"],
    },

    2: {
      "type": "อาหารเส้น",
      "imageUrl": "assets/images/food2.png",
      "food": ["ก๋วยเตี๋ยว", "ราเมน", "ขนมจีน"],
    },

    3: {
      "type": "ฟาสฟู้ต",
      "imageUrl": "assets/images/food3.png",
      "food": ["พิซซ่า", "ไก่ทอด", "แฮมเบอเกอร์"],
    },

    4: {
      "type": "หมูกระทะ",
      "imageUrl": "assets/images/food4.png",
      "food": [],
    },

    5: {
      "type": "อาหารริมทาง",
      "imageUrl": "assets/images/food5.png",
      "food": ["ลูกชิ้นทอด", "โรตี", "น้ำปั่น"],
    },

    6: {
      "type": "อาหารเพื่อสุขภาพ",
      "imageUrl": "assets/images/food6.png",
      "food": ["อกไก่", "สลัด"],
    },

    7: {
      "type": "ชาบู",
      "imageUrl": "assets/images/food7.png",
      "food": [],
    },

    8: {
      "type": "อาหารอิสาน",
      "imageUrl": "assets/images/food8.png",
      "food": ["ส้มตำ", "ไก่ย่าง", "ลาบ"],
    },

    9: {
      "type": "อาหารจีน",
      "imageUrl": "assets/images/food9.png",
      "food": ["โต๊ะจีน", "เป็ดปักกิ่ง", "ติ่มซำ"],
    },

    10: {
      "type": "อาหารเกาหลี",
      "imageUrl": "assets/images/food10.png",
      "food": ["คิมบับ", "เนื้อย่าง", "ไก่เกาหลี"],
    },

    11: {
      "type": "อาหารญี่ปุ่น",
      "imageUrl": "assets/images/food11.png",
      "food": ["ซูชิ", "ข้าวด้ง", "ราเมน"],
    },

    12: {
      "type": "อาหารอินเดีย",
      "imageUrl": "assets/images/food12.png",
      "food": ["นาน", "ไก่ทันดูรี"],
    },

  };

  @override
  Widget build(BuildContext context) {
    return RandomFoodScreen(info: foodResInfo);
  }
}