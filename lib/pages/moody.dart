import 'package:flutter/material.dart';

class Moody extends StatelessWidget {
  const Moody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/logo.png")),
                const Text("Moody"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text("Hello,"),
              Text(
                "Sara Rose",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Text("How are you feeling today ?"),
          const SizedBox(height: 20),

          // CircleAvatar(child: Image(image: AssetImage("assets/images/logo.png"))),
          // CircleAvatar(child: Icon(Icons.emoji_emotions)),
          // CircleAvatar(child: Icon(Icons.emoji_emotions)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image(image: AssetImage("assets/images/love.png")),
                  ),
                  Text("Love"),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image(image: AssetImage("assets/images/cool.png")),
                  ),
                  Text("Cool"),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image(image: AssetImage("assets/images/love.png")),
                  ),
                  Text("Happy"),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image(image: AssetImage("assets/images/sad.png")),
                  ),
                  Text("Sad"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Feature"), Text("See more>")],
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.green,
            child: Row(
              children: [
                Image(image: AssetImage("assets/images/logo.png")),
                Column(
                  children: [
                    Text("Hello"),
                    Text("Hello"),
                    Row(children: [Icon(Icons.play_arrow), Text("Hello")]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
