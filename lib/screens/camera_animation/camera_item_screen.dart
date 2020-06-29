import 'package:flutter/material.dart';

class CameraItemScreen extends StatelessWidget {
  final Color color;
  final double maxWidth;

  const CameraItemScreen({Key key, this.color, this.maxWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth ?? double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Stack(
              children: <Widget>[
                Placeholder(),
              ],
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 0.3),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.swap_horiz),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      child: InkWell(
                        onTap: () {},
                        child: Material(
                          elevation: 8,
                          color: Colors.red,
                          shape: CircleBorder(),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(12),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
