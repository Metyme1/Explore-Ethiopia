import 'package:flutter/cupertino.dart';

class BookMark extends StatefulWidget {
  const BookMark({Key? key}) : super(key: key);

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:Center(
          child: Text(
              " bookmark"
          ),
        )
    );
  }
}
