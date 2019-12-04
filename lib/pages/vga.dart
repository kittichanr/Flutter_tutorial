import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'vga-detail.dart';

class VgaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VgaDetailPage(),
                    )),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 150,
                      width: 150,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://static01.nyt.com/images/2018/05/03/us/03spongebob_xp/03spongebob_xp-articleLarge.jpg?quality=75&auto=webp&disable=upscale",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Text('$i')
                  ],
                ));
          },
        ),
      ),
    );
  }
}
