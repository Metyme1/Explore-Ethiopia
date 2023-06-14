import 'package:flutter/material.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  List<String> _bookmarkedItems = [
    "Historical and cultural places",
    "Wildlife and nature",
  ];

  void _removeBookmark(String item) {
    setState(() {
      _bookmarkedItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmarks"),
      ),
      body: _bookmarkedItems.isEmpty
          ? Center(
        child: Text("No bookmarks yet"),
      )
          : ListView.builder(
        itemCount: _bookmarkedItems.length,
        itemBuilder: (context, index) {
          final item = _bookmarkedItems[index];
          return ListTile(
            title: Text(item),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeBookmark(item),
            ),
          );
        },
      ),
    );
  }
}