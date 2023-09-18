import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 150,
            height:150,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: "https://www.digitaltrends.com/wp-content/uploads/2021/01/monkey-smartphone.jpg",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            )
        ),
        Container(
            height:30,
            child: Text("User: Victor M. ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ),
      ],
    );
  }
}
