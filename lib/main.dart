import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import 'provider/paginvation/PaginationProviderPage.dart';
import 'provider/paginvation/PhotoProvider.dart';
import 'provider/simpleProvider/SimpleProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
      initialData: InternetConnectionStatus.connected,
      create: (context) => InternetConnectionChecker().onStatusChange,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<PhotoProvider>(
            create: (_) => PhotoProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            listTileTheme: ListTileThemeData(
              tileColor: Colors.blue,
              contentPadding: EdgeInsets.all(5),
              horizontalTitleGap: 1.2,
              dense: true,
              textColor: Colors.white,
              enableFeedback: true,
              selectedColor: Colors.red,
            ),
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final listTileStyle = TextStyle(
    fontSize: 15,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 5),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SimpleProvider()),
              );
            },
            title: Text(
              'Simple provider',
              style: listTileStyle,
            ),
            trailing: const Icon(
              Icons.arrow_right,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 5),
          ListTile(
            trailing: const Icon(
              Icons.arrow_right,
              color: Colors.white,
              size: 30,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaginationProviderPage()),
              );
            },
            title: Text(
              'Simple provider',
              style: listTileStyle,
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
