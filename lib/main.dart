import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'MIXURY SINCE 2023 ICE CREAM';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text(appTitle, style: TextStyle(color: Colors.white))),
          backgroundColor: Colors.red,
        ),
        body: ListView(
          padding: const EdgeInsets.all(8), //กำหนดระยะห่างของการ์ดแต่ละอัน
          children: const <Widget>[ //สร้างการ์ดแต่ละอัน
            Card(
              child: ListTile( //การ์ดแต่ละอันจะมีรูปภาพและชื่อไอศกรีม
                leading: ImageSection(
                  image: 'images/vanilla.jpg'
                ),
                title: TitleSection(
                  name: 'Vanilla',
                  price: '฿ 40.00'))),
            Card(
              child: ListTile(
                leading: ImageSection(
                  image: 'images/chocolate.jpg'
                ),
                title: TitleSection(
                  name: 'Chocolate',
                  price: '฿ 50.00'))),
            Card(
              child: ListTile(
                leading: ImageSection(
                  image: 'images/strawberry.jpg'
                ),
                title: TitleSection(
                  name: 'Strawberry',
                  price: '฿ 40.00'))),
            Card(
              child: ListTile(
                leading: ImageSection(
                  image: 'images/mint.jpg'
                ),
                title: TitleSection(
                  name: 'Mint Choc Chip',
                  price: '฿ 60.00'))),
            Card(
              child: ListTile(
                leading: ImageSection(
                  image: 'images/cookies&cream.jpg'
                ),
                title: TitleSection(
                  name: 'Cookies & Cream',
                  price: '฿ 60.00'))),
            Card(
              child: ListTile(
                leading: ImageSection(
                  image: 'images/coffee.jpg'
                ),
                title: TitleSection(
                  name: 'Coffee',
                  price: '฿ 50.00'))),
            Card(
              child: ListTile(
                leading: ImageSection(
                  image: 'images/mango.jpg'
                ),
                title: TitleSection(
                  name: 'Mango',
                  price: '฿ 60.00'))),
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget { //สร้างคลาสสำหรับรูปภาพ
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(image, width: 100, height: 100, fit: BoxFit.cover),
    );
  }
}

class TitleSection extends StatelessWidget { //สร้างคลาสสำหรับชื่อและราคา
  const TitleSection({super.key, required this.name, required this.price});
  final String name;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),

      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(price, style: TextStyle(color: Colors.green[500])),
              ],
            ),
          ),
          OrderWidget(),
          /*3*/
          //Icon(Icons.favorite, color: Colors.red[500]),
          //const Padding(padding: EdgeInsets.only(left: 5)),
          //const Text(''),
        ],
      ),
    );
  }
}

class OrderWidget extends StatefulWidget { //สร้างคลาสสำหรับปุ่มกดอิโมจิ
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  int _orderCount = 0;
  bool _isOrdered = false; // เพิ่มตัวแปรเช็คการสั่งซื้อ
  
  void _increaseOrder() { //ปุ่มเพิ่มจำนวนสินค้า
    setState(() {
      _orderCount += 1;
    });
  }

  void _decreaseOrder() { //ปุ่มลดจำนวนสินค้า
    setState(() {
      if (_orderCount > 0) {
        _orderCount -= 1;
      }
    });
  }

  void _placeOrder() { //ปุ่มสั่งซื้อสินค้า
    if (_orderCount > 0) {
      setState(() {
        _isOrdered = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) { //สร้างปุ่มเพิ่มลดและสั่งซื้อสินค้า
    // ถ้าสั่งซื้อแล้ว แสดงไอคอนติ๊กถูก
    if (_isOrdered) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green[500],
            size: 30,
          ),
          const SizedBox(width: 8),
          Text(
            'สั่งแล้ว $_orderCount สกูป',
            style: TextStyle(
              color: Colors.green[500],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }

    // ถ้ายังไม่ได้สั่งซื้อ แสดงปุ่มเพิ่ม/ลดและสั่งซื้อ
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ปุ่มลด
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: const Icon(Icons.remove),
            color: _orderCount > 0 ? Colors.red[500] : Colors.grey,
            onPressed: _orderCount > 0 ? _decreaseOrder : null,
          ),
        ),
        // แสดงจำนวน
        SizedBox(
          width: 30, 
          child: Text(
            '$_orderCount',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ),
        // ปุ่มเพิ่ม
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: const Icon(Icons.add),
            color: Colors.green[500],
            onPressed: _increaseOrder,
          ),
        ),
        const SizedBox(width: 8),
        // ปุ่มสั่งซื้อ
        ElevatedButton(
          onPressed: _orderCount > 0 ? _placeOrder : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[500],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          child: const Text(
            'สั่งซื้อ',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
