import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(movieDetails());
}

class movieDetails extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF212B65),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Container(
                padding: new EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Image.network(
                    "https://yaftamobile-pulse.s3.eu-central-1.amazonaws.com/blog/flutter.png"),
              ),
              Container(
                padding: new EdgeInsets.fromLTRB(10, 50, 10, 0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text("Movie",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.white)),
          ),
          RatingBar.builder(
            initialRating: 3,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.blue,
            ),
            itemSize: 18,
            onRatingUpdate: (_) {},
          ),
          Row(
            children: [
              Container(
                  padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Icon(
                    Icons.alarm,
                    color: Colors.white,
                    size: 20,
                  )),
              Container(
                padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  "3h 35m",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                    size: 20,
                  )),
              Container(
                padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  "2021/1/1",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text(
              "The default constructor takes an explicit List<Widget> of children. This constructor is appropriate for list views with a small number of children because constructing the List requires doing work for every child that could possibly be displayed in the list view instead of just those children that are actually visible. \n",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      // ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
