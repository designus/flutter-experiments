import 'package:flutter/material.dart';
import 'package:friendly_chat/skeleton.dart';

class Screen2 extends StatelessWidget {
  const Screen2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      title: 'Sekond screen',
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Image.asset('images/1.jpg', fit: BoxFit.fitHeight, height: 100)
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Image.asset('images/2.jpg', fit: BoxFit.cover, height: 100)
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Image.asset('images/3.jpg', fit: BoxFit.cover, height: 100)
              )
            ],
          ),
          const SizedBox(height: 20)
        ],
      )
    );
  }
}