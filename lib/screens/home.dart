import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/counterprovider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('HOME'),),
      body: 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                '${Provider.of<Counterprovider>(context,listen: true).counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              FloatingActionButton(
                onPressed: Provider.of<Counterprovider>(context,listen: false).Increment,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
    );
  }
}
