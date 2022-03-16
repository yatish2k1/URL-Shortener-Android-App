import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/home.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomePageWidget>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('URL SHORTENER APP'),
        backgroundColor: Colors.purple[300],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "URL SHORTNER",
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Text(
              "URL Shortener by Bitly",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Spacer(),
            TextField(
              controller: state.urlController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide(
                    color: Colors.purple,
                  ),
                ),
                filled: true,
                fillColor: Colors.blue[50],
                hintText: "Enter or paste long URL",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Builder(
              builder: (context) => GestureDetector(
                child: Text(state.shortUrlMessage), //
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(text: state.shortUrlMessage), //
                  ).whenComplete(
                    () => Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Link is copied"), //
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  state.handleGetLinkButton();
                },
                //
                child: Text(
                  "GET SHORTENED LINK",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                color: Colors.purple,
                textColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/database-display-page'),
                child: Text(
                  "FETCH API KEY",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                color: Colors.purple,
                textColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
