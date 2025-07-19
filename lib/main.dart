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
  bool _isOrdered = false;
  int _orderCount = 0;
  void _toggleOrder() { //เมื่อกดอิโมจิ จะมาเช็คตรงนี้
    setState(() {
      if (_isOrdered) {
        _orderCount -= 1;
        _isOrdered = false;
      } else {
        _orderCount += 1;
        _isOrdered = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) { //สร้างปุ่มกดอิโมจิ
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon:
                (_isOrdered
                    ? const Icon(Icons.task_alt_rounded) //เป็นจริงเอาไปใช้
                    : const Icon(Icons.add) //เป็นเท็จเอาไปใช้
                    ),
            color: _isOrdered ? Colors.green[500] : Colors.red[500],
            onPressed: _toggleOrder, //เมื่อกดจะไปเรียกฟังก์ชันนี้
          ),
        ),
        SizedBox(width: 18, child: SizedBox(child: Text('$_orderCount')
        )
      ),
    ],);
  }
}
