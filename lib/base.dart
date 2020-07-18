import 'package:flutter/material.dart';
import 'package:joblit/helpers.dart';

class Base extends StatelessWidget {
  final Widget child;

  const Base({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/background.png',
                    fit: BoxFit.cover,
                  )),
              Column(
        children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding(context), vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'WorkLit',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'Product',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 8.0,),
                        Text(
                          'Discover',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 8.0,),
                        Text(
                          'Platform',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 8.0,),
                        Text(
                          'Support',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(child: child),
        ],
      ),
            ],
          )),
    );
  }
}
