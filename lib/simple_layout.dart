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
          ),
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

  Widget _buildText() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      child: const Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.'
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities ',
          softWrap: true,
        ),
    );
  }

  Widget _buildActionButton(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, color: color)
        ),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: Text(label, style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w400
          )),
        )
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(color, Icons.call, 'CALL'),
          _buildActionButton(color, Icons.near_me, 'ROUTE'),
          _buildActionButton(color, Icons.share, 'SHARE')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      title: 'Simple layout',
      body: ListView(
        children: [
          _buildImage(),
          _buildTitleSection(context),
          _buildActionButtons(context),
          _buildText()
        ],
      )
    );
  }
}