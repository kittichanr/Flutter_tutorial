import 'package:flutter/material.dart';
import 'navigation.dart';

// void main() => runApp(QuoteApp());
void main() => runApp(Navigation());

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote',
      home: StatefulHomePage(),
    );
  }
}

class Quote {
  final String text;
  final String author;
  Quote(this.text, this.author);
}

class StatefulHomePage extends StatefulWidget {
  @override
  _StatefulHomePageState createState() => _StatefulHomePageState();
}

class _StatefulHomePageState extends State<StatefulHomePage> {
  final _formkey = GlobalKey<FormState>();

  String _inputQuote;
  String _inputAuthor;

  List<Quote> quotes = [] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quote'),
        ),
        body: Column(
          children: <Widget>[
            Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Quote'
                    ),
                    onSaved: (String value){
                      _inputQuote = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Author'
                    ),
                    onSaved: (String value){
                      _inputAuthor = value;
                    },
                  ),
                  RaisedButton(
                    onPressed: (){
                      _formkey.currentState.save();
                      setState(() {
                        quotes.insert(0, Quote(_inputQuote, _inputAuthor));
                      });
                      
                       _formkey.currentState.reset();
                    },
                    child: Text('Add'),
                  )
                ],
              ),
            ),
            Expanded(
              child: quotes.length == 0
                              ? Center(
                      child: Text('Empty'),
                    )
                  : ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return QuoteCard(quotes[index].text, quotes[index].author);
                      },
                      itemCount: quotes.length,
                    ),
            ),
          ],
        ));
  }
}

class QuoteCard extends StatelessWidget {
  final String _text;
  final String _author;

  const QuoteCard(
    this._text,
    this._author, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 10,
      child: Column(
        children: <Widget>[
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
