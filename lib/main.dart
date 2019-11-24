import 'package:flutter/material.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenPage createState() => _HomeScreenPage();
}

class _HomeScreenPage extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple,
            brightness: Brightness.light,
            accentColor: Colors.red),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: new Scaffold(
          appBar: AppBar(
            title: Text("Bottom Navigation View"),
            centerTitle: true,
          ),
          body: new TabBarView(
            children: <Widget>[
              new MyBody("Page One"),
              new MyBody("Page Two"),
              new MyBody("Page Three")
            ],
//            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
          ),
          bottomNavigationBar: Material(
            color: Colors.purple,
            child: TabBar(
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.favorite_border),
                  text: "ONE",
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  text: "TWO",
                ),
                Tab(
                  icon: Icon(Icons.add_box),
                  text: "THREE",
                ),
              ],
              controller: tabController,
            ),
          ),
        ));
  }
}

class MyBody extends StatelessWidget {
  final String title;

  MyBody(this.title);

  final mySnackBar = SnackBar(
    content: Text(
      "Hello There!",
      style: TextStyle(color: Colors.white),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text(title + "  Click me"),
              onPressed: () => {Scaffold.of(context).showSnackBar(mySnackBar)}),
        ],
      ),
    );
  }
}
