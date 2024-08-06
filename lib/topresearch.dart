import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    const materialApp = const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Text(String()),
    );
    return materialApp;
  }
}

String searchText = '';
 

List<String> items = ['경복궁', '남산타워', '남대문', '국립중앙박물관'];
List<String> itemContents = [
  '경복궁 Contents',
  '남산타워 Contents',
  '남대문 Contents',
  '국립중앙박물관 Contents'
];
 

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}
 

class MyAppState extends State<MyApp> {
  
  void cardClickEvent(BuildContext context, int index) {
    String content = itemContents[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        // 정의한 ContentPage의 폼 호출
        builder: (context) => ContentPage(content: content),
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MemoApp', // 
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Search Example'), 
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '검색어를 입력해주세요.',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  
                  if (searchText.isNotEmpty &&
                      !items[index]
                          .toLowerCase()
                          .contains(searchText.toLowerCase())) {
                    return SizedBox.shrink();
                  }
                  
                  else {
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(20, 20))),
                      child: ListTile(
                        title: Text(items[index]),
                        onTap: () => cardClickEvent(context, index),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 

class ContentPage extends StatelessWidget {
  final String content;
 
  const ContentPage({Key? key, required this.content}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content'),
      ),
      body: Center(
        child: Text(content),
      ),
    );
  }
}