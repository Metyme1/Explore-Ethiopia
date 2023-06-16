import 'package:ethiopia/pages/signup_login.dart';
import 'package:flutter/material.dart';

class Comment {
  final int id;
  final String text;

  Comment({required this.id, required this.text});
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> _comments = [
    'Comment 1 text',
    'Comment 2 text',
    'Comment 3 text',
    'Comment 4 text',
    'Comment 5 text',
    'Comment 6 text',
  ]; // Make sure to initialize your comments list

  int _selectedIndex = 0;
  String _selectedCommentText = 'Comment 1 text';
  bool _isBookmarked = false;

  final TextEditingController _commentController = TextEditingController();



  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "images/categories/Hist&cal/lalibela.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous screen
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 20, // Set the position of the bookmark button to the bottom
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _isBookmarked ? Colors.red : Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isBookmarked = !_isBookmarked; // Toggle the bookmark state
                        });
                      },
                      icon: Icon(
                        _isBookmarked ? Icons.bookmark : Icons.bookmark,
                        color: _isBookmarked ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 280,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Example Location',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 300,
                                      child: Center(
                                        child: Text('Map of the place'),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.location_on, color: Colors.grey),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'City, Country',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'This is an example description of the location. You can add more details here. This is an example description of the location. You can add more details here.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Add comment',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _commentController,
                          decoration: InputDecoration(
                            hintText: 'Enter your comment here',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.teal),
                          ),
                          onPressed: () {
                            setState(() {
                              _comments.add(_commentController.text);
                              _selectedIndex = _comments.length - 1;
                              _selectedCommentText = _comments[_selectedIndex];
                              _commentController.clear();
                            });
                          },
                          child: Text('Post comment'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Comments',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 300,
                          child: ListView.builder(
                            itemCount: _comments.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                    _selectedCommentText = _comments[_selectedIndex];
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        // color: Colors.grey[300],
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'User $index',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(_comments[index]),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}