import 'package:flutter/material.dart';
import 'package:movie_app_flutter/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: style_text(text: '⭐⭐⭐ Rating - ' + vote),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child: style_text(
                  text: name != null ? name : 'Not Loaded', size: 24)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: style_text(text: 'Releasing On - ' + launch_on, size: 14)),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: style_text(
                      text: description,
                      size: 18,
                      color: Colors.white,
                    )),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
