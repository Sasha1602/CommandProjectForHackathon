import 'package:flutter/material.dart';

import 'MyStyle.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;
  PageController pageController = PageController();

  get child => null;

  void onTappen(int index){
    setState(() {
      _selectIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage'),
        actions: <Widget>[
          IconButton(
              onPressed: (){ // Уведомления
                // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("You tap buttom"))); выводи сообщение на экрав в нижнем баре
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context){
                      return Scaffold(
                        appBar: AppBar(
                        ),
                        body: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("data", style: TextStyle(fontSize: 36),),
                             ],
                            ),
                          ),
                      );
                    }
                ));
              },
              icon: const Icon(Icons.add_alert))
        ],
      ),
      body: Align(
        alignment: Alignment(0, 0),
            child:Column(
              children: [
                Text("data"),
                MyStatelessWidget(),
              ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', ),
        BottomNavigationBarItem(icon: Icon(Icons.lens_outlined), label: 'lens'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'User'),
      ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.green,
        onTap: onTappen,
      ),
    );
  }
}


