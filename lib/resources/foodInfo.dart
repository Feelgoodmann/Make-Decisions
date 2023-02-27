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
      "imageUrl": "",
      "food": ["ข้าวผัด", "ผัดกะเพรา", "ผัดพริกแกง"],
    },

    2: {
      "type": "อาหารเส้น",
      "imageUrl": "",
      "food": ["ก๋วยเตี๋ยว", "ราเมน", "ขนมจีน"],
    },

    3: {
      "type": "ฟาสฟู้ต",
      "imageUrl": "",
      "food": ["พิซซ่า", "ไก่ทอด", "แฮมเบอเกอร์"],
    },

    4: {
      "type": "หมูกระทะ",
      "imageUrl": "",
      "food": [],
    },

    5: {
      "type": "อาหารริมทาง",
      "imageUrl": "",
      "food": ["ลูกชิ้นทอด", "โรตี", "น้ำปั่น"],
    },

    6: {
      "type": "อาหารเพื่อสุขภาพ",
      "imageUrl": "",
      "food": ["อกไก่", "สลัด"],
    },

    7: {
      "type": "ชาบู",
      "imageUrl": "",
      "food": [],
    },

    8: {
      "type": "อาหารอิสาน",
      "imageUrl": "",
      "food": ["ส้มตำ", "ไก่ย่าง", "ลาบ"],
    },

    9: {
      "type": "อาหารจีน",
      "imageUrl": "",
      "food": ["โต๊ะจีน", "เป็ดปักกิ่ง", "ติ่มซำ"],
    },

    10: {
      "type": "อาหารเกาหลี",
      "imageUrl": "",
      "food": ["คิมบับ", "เนื้อย่าง", "ไก่เกาหลี"],
    },

    11: {
      "type": "อาหารญี่ปุ่น",
      "imageUrl": "",
      "food": ["ซูชิ", "ข้าวด้ง", "ราเมน"],
    },

    12: {
      "type": "อาหารอินเดีย",
      "imageUrl": "",
      "food": ["นาน", "ไก่ทันดูรี"],
    },

  };

  @override
  Widget build(BuildContext context) {
    return RandomFoodScreen(info: foodResInfo);
  }
}