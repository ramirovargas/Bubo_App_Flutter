import 'package:flutter/material.dart';

import 'models/shop_list.dart';
import 'models/compare_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
      ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

//
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
        child: ListView(children: [
          Image.asset('assets/images/Logo-Bubo.png'),
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Enter Email",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            validator: (val) {
              if (val.length == 0) {
                return "Email cannot be empty";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 10),
          new TextFormField(
            obscureText: true,
            decoration: new InputDecoration(
              labelText: "Enter Password",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            validator: (val) {
              if (val.length == 0) {
                return "Email cannot be empty";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          RaisedButton(
            color: Colors.cyan,
            textColor: Colors.white,
            child: Text('Go!'),
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
          ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRoute3() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page3(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRoute4() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page4(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {



  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
      slivers: <Widget>[

        SliverAppBar(
          backgroundColor: Colors.cyan,
          pinned:true,
          floating:false,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Bubo'),
          ),
        ),

        SliverFixedExtentList(
          itemExtent: 100,
          delegate: SliverChildListDelegate([
            //Container(color:Colors.red),
            //Container(color:Colors.green),

            Container(child:ListView(children: [
                Image.asset('assets/images/search.png')]
            ),
            ),
          ]),
        ),

        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categorias', style: TextStyle(
                fontSize:20,
                color:Colors.black,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationStyle: TextDecorationStyle.solid,
            ),
            ),
          ),
        ),

        SliverGrid(
          delegate: SliverChildListDelegate([

            Container(
              margin:EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset('assets/images/ropa.jpg',
                            height: 110,
                            fit:BoxFit.fill
                        ),
                      ),
                      ListTile(
                        title: Text('Ropa y Calzado'),
                        //subtitle: Text('Location 1'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin:EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(_createRoute3()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset('assets/images/tecnologia.jpg',
                            height: 110,
                            fit:BoxFit.fill
                        ),
                      ),
                      ListTile(
                        title: Text('Tecnología'),
                        //subtitle: Text('Location 1'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin:EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset('assets/images/cocina.jpg',
                            height: 110,
                            fit:BoxFit.fill
                        ),
                      ),
                      ListTile(
                        title: Text('Hogar y Cocina'),
                        //subtitle: Text('Location 1'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin:EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset('assets/images/automotriz.jpg',
                            height: 110,
                            fit:BoxFit.fill
                        ),
                      ),
                      ListTile(
                        title: Text('Automotriz'),
                        //subtitle: Text('Location 1'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Container(color:Colors.blue),

          ]),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.0,
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text('Promocionados', style: TextStyle(
              fontSize:20,
              color:Colors.black,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              decorationStyle: TextDecorationStyle.solid,
            ),
            ),
          ),
        ),

        SliverFixedExtentList(
          itemExtent: 100,
          delegate: SliverChildListDelegate([
            //Container(color:Colors.red),
            //Container(color:Colors.green),
            Container(child:ListView(children: [
              Image.asset('assets/images/add1.png' ,
                  height: 100,
                  fit:BoxFit.fill)]
            ),
            ),
          ]),
        ),

      ],
    )
    );
  }
}

class Page4 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("iPhone XR (Product RED)"),
      ),
      */
      body: MaterialApp(
        title: 'ShopX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: ShopListWidget(),
        home: CompareListWidget(),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Tecnología "),

      ),
      body: MaterialApp(
        title: 'ShopX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ShopListWidget(),
        //home: CompareListWidget(),
      ),
    );
  }
}

