import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';



class MyFirstApp extends StatelessWidget
{
  var item = RandomWordPair();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First app'),
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>SavedScreen(item.savedWords)),
            );
          }, icon: Icon(Icons.list)),
        ],
      ),
      body: item,
    );
  }
}

class RandomWordPair extends StatefulWidget
{
  Set<WordPair> savedWords = Set<WordPair>();
  @override
  State<StatefulWidget> createState() {
    return RandomWords(savedWords);
  }
}

class RandomWords extends State<RandomWordPair>
{
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  Set<WordPair> savedWords;


  RandomWords(this.savedWords);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20.0),
        itemBuilder: (context, i){
        if ( i.isOdd) return Divider();
        var index = i ~/ 2;
        // print("i = $i;index=${index};");
        if ( index >= _suggestions.length )
          {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _bulidRow(_suggestions[index]);
        }
    );
  }

  Widget _bulidRow (WordPair pair)
  {
    var alreadySaved = savedWords.contains(pair);
    return ListTile(
      title: Text(pair.toString(), style: _biggerFont,),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : Colors.grey,
      ),
      onTap: (){
        setState(() {
          if ( alreadySaved )
          {
            savedWords.remove(pair);
          }
          else
          {
            savedWords.add(pair);
          }
        });
      },
    );
  }
}

class SavedScreen extends StatelessWidget
{
  Set<WordPair> savedPair = Set<WordPair>();


  SavedScreen(this.savedPair);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Words-Move 2 Delete"),
        leading: BackButton(onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: getList(context),
    );
  }

  Widget getList (BuildContext context)
  {
    final item = savedPair.toList();
    final listview = ListView.builder(
      itemCount: savedPair.length,
      itemBuilder: (context, index) {
        final info = item[index].toString();
        return Dismissible(
            key: Key(info),
            background: Container(color: Colors.red,),
            onDismissed: (direction){
            item.removeAt(index);
            Scaffold.of(context).showBottomSheet((context) => Text("dismissed $info"));
          },
            child: ListTile(
              title: Text(info, style: TextStyle(fontSize: 18),),
            ),
        );
      },
    );

    return listview;
  }

}