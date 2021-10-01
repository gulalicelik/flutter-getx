import 'package:flutter/material.dart';
import 'package:getx/controllers/sayac_controller.dart';
import 'package:get/get.dart';
import 'package:getx/translate/translate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  SayacController _controller = Get.put(SayacController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyColumn(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            foregroundColor: Get.isDarkMode ? Colors.deepOrange : Colors.red,
            onPressed: () {
              _controller.arttir();
              print(_controller.sayac);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "2",
            foregroundColor: Get.isDarkMode ? Colors.deepOrange : Colors.red,
            onPressed: () {
              _controller.azalt();
              print(_controller.sayac);
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: "3",
            foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            child: Icon(Icons.wb_sunny),
          ),
          FloatingActionButton(
            heroTag: "4",
            foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
            onPressed: () {
              Get.to(NewPage());
            },
            child: Icon(Icons.rounded_corner),
          ),
          FloatingActionButton(
            heroTag: "5",
            foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
            onPressed: () {
              Get.updateLocale(Get.locale == Locale('tr', 'TR')
                  ? Locale('en', 'US')
                  : Locale('tr', 'TR'));
            },
            child: Icon(Icons.book),
          )
        ],
      ),
    );
  }
}

class MyColumn extends StatelessWidget {
  SayacController bulunanController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'hello'.tr,
          style: TextStyle(fontSize: 23),
        ),
        Text(
          'button-text'.tr,
          style: TextStyle(fontSize: 23),
        ),
        GetX<SayacController>(
            builder: (_controller2) => Text(_controller2.sayac.toString(),
                style: TextStyle(fontSize: 23))),
        Obx(() => Text(bulunanController.sayac.toString(),
            style: TextStyle(fontSize: 23)))
      ],
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('Yeni sayfa'),
          ),
          ElevatedButton(
              child: Text('Geri Dön'),
              onPressed: () {
                Get.back();
              })
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('İkinci sayfa'),
          ),
          ElevatedButton(
              child: Text('Geri Dön'),
              onPressed: () {
                Get.back();
              })
        ],
      ),
    );
  }
}
