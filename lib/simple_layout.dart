import 'package:flutter/material.dart';
import 'package:friendly_chat/skeleton.dart';

class SimpleLayout extends StatelessWidget {
  const SimpleLayout({ Key? key }) : super(key: key);

  Widget _buildTitleSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 6),
                child: const Text('Oeschinen Lake')
              ),
              Text('Kandersteg, Switzerland', style: Theme.of(context).textTheme.caption)
            ]
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber.shade600),
              const Text('41')
            ],
          )
        ],
      )
    );
  }

  Widget _buildImage() {
    return Row(
      children: [
        Expanded(
          child: Image.asset('images/1.jpg', height: 150, fit: BoxFit.cover)
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      title: 'Simple layout',
      body: Column(
        children: [
          _buildImage(),
          _buildTitleSection(context)
        ],
      )
    );
  }
}