import 'package:flutter/material.dart';

void main() => runApp(QuoteApp());

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote'),
      ),
      body: ListView(
        children: <Widget>[
          QuoteCard("1111","2222","https://sportshub.cbsistatic.com/i/r/2019/11/20/d02262c9-3d1c-4c47-9f7f-02cfea79f607/thumbnail/1200x675/c1aeae444c56e9c97e71796535ca83db/lebron.jpg"),
          QuoteCard("1111","2222","https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/1966.png"),
          QuoteCard("1111","2222","https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fpeopledotcom.files.wordpress.com%2F2019%2F10%2Flebron-james.jpg&w=400&c=sc&poi=face&q=85"),
          QuoteCard("1111","2222","https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fpeopledotcom.files.wordpress.com%2F2019%2F10%2Flebron-james.jpg&w=400&c=sc&poi=face&q=85"),
        ],
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final String _text;
  final String _author;
  final String _imgUrl;

  const QuoteCard(this._text,this._author,this._imgUrl,{
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        '$_imgUrl'))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$_text',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment(1, 0),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '--$_author',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
