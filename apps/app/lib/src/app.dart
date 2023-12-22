import 'package:flutter/material.dart';

///App
class App extends StatelessWidget {
  ///App
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: Center(
            child: Text('App'),
          ),
        ),
      );
}
