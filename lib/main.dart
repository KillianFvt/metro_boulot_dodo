import 'package:flutter/material.dart';
import 'palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Palette.primary,
            background: Palette.neutral,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Metro Boulot Dodo'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(widget.title),
            floating: true,
            snap: true,
            expandedHeight: 200,
            backgroundColor: Palette.primary,
            flexibleSpace: FlexibleSpaceBar(

            ),
          ),
        ]
      ),
    );
  }
}
