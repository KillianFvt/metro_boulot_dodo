import 'package:flutter/material.dart';
import 'palette.dart';
import 'widgets/next_departures.dart';

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

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            floating: true,
            snap: true,
            expandedHeight: 200,
            backgroundColor: Palette.primary,
          ),

          const SliverToBoxAdapter(
            child: NextDepartures(),
          ),
        ]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scrollController.animateTo(
              0, // top of page
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        },

        backgroundColor: Palette.primary,
        foregroundColor: Colors.white,

        tooltip: "Revenir en haut",

        child: const Icon(
          Icons.arrow_upward_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
