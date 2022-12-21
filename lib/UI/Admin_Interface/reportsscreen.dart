import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  static const String routeName = 'repoort';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reportss'),
      ),
      body : Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No Available Reports For Now" , textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline1,)
        ],
      ),
    );
  }
}
