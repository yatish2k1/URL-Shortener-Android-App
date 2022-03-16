import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/home.dart';

class DataBase extends StatefulWidget {
  @override
  State<DataBase> createState() => _DataBaseDisplayPageState();
}

class _DataBaseDisplayPageState extends State<DataBase> {
  @override
  Widget build(BuildContext context) {
    final profetch = Provider.of<HomePageWidget>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'API PAGE',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder(
        future: profetch.fetchAndSetUrl(),
        builder: (ctx, AsyncSnapshot) => Consumer<HomePageWidget>(
          builder: (ctx, HomePageWidget, _) => ListView.builder(
            itemBuilder: (ctx, i) => Center(
              child: Text(
                'API KEY: ${profetch.keys[i].key}',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            itemCount: 1,
          ),
        ),
      ),
    );
  }
}
