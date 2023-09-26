import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'BT'
    ),
    home: MyWidget(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatefulWidget {

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  late PageController pageController;
  int active = 0;

  List<Map<String, String>> listData = [
    {
      'image':'assets/images/image_01.png',
      'name':'Introduction Screen 01',
      'Description':'In the heart of the bustling city, amidst the towering '
          'skyscrapers and bustling streets, lies a hidden gem of a park. This '
          'tranquil oasis offers a refuge from the daily hustle and bustle, with'
          ' lush greenery, winding pathways, and the soothing sound of a '
          'babbling brook. People come here to unwind, read a book, or simply '
          'enjoy a peaceful moment away from the urban chaos. It\'s a reminder'
          'that even in the midst of a fast-paced world, moments of serenity and'
          'nature\'s beauty can be found if you seek them.'
    },
    {
      'image':'assets/images/image_02.png',
      'name':'Introduction Screen 02',
      'Description':'In the heart of the bustling city, amidst the towering '
          'skyscrapers and bustling streets, lies a hidden gem of a park. This '
          'tranquil oasis offers a refuge from the daily hustle and bustle, with'
          ' lush greenery, winding pathways, and the soothing sound of a '
          'babbling brook. People come here to unwind, read a book, or simply '
          'enjoy a peaceful moment away from the urban chaos. It\'s a reminder'
          'that even in the midst of a fast-paced world, moments of serenity and'
          'nature\'s beauty can be found if you seek them.'
    },
    {
      'image':'assets/images/image_03.png',
      'name':'Introduction Screen 03',
      'Description':'In the heart of the bustling city, amidst the towering '
          'skyscrapers and bustling streets, lies a hidden gem of a park. This '
          'tranquil oasis offers a refuge from the daily hustle and bustle, with'
          ' lush greenery, winding pathways, and the soothing sound of a '
          'babbling brook. People come here to unwind, read a book, or simply '
          'enjoy a peaceful moment away from the urban chaos. It\'s a reminder'
          'that even in the midst of a fast-paced world, moments of serenity and'
          'nature\'s beauty can be found if you seek them.'
    }
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
              onPageChanged: (value){
                setState(() {
                  active = value;
                });
              },
              controller: pageController,
              itemCount: listData.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Expanded(flex: 4,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          child: Image.asset(listData[index]['image']!),
                      ),
                      ),
                      Expanded(flex: 3,
                        child: Column(
                          children: [
                            Text(listData[index]['name']!,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),),
                            const SizedBox(height: 7,),
                            Container(
                              margin: EdgeInsets.all(10),
                                child: Text(listData[index]['Description']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold
                                  ),)
                            )
                          ],
                        ))
                    ],
                  ),
                );
              }),
          Positioned(
            bottom: 30,
            child: Row(
              children: [
                Opacity(
                  opacity: active == listData.length - 1 ? 0 : 1,
                  child: InkWell(
                    onTap: (){
                      pageController.animateToPage(listData.length - 1, duration:
                      const Duration(milliseconds: 500), curve: Curves.easeInQuart);
                    },
                    child: const Text('Skip',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 15
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 70,),
                Row(
                    children: List.generate(listData.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.all(7),
                    width: active == index ? 25 : 15,
                    height: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: active == index ? Colors.blueAccent : Colors.grey),
                  );
                }),
                ),
                const SizedBox(width: 70,),
                Opacity(
                  opacity: active != listData.length - 1 ? 0 : 1,
                  child: const Text("Login",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15
                      ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

