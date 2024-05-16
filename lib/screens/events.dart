import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late Future<List<Map<String, dynamic>>> _futureEvents;

  @override
  void initState() {
    super.initState();
    _futureEvents = fetchEvents();
  }
  Future<List<Map<String, dynamic>>> fetchEvents() async {
    final response = await http.get(Uri.parse('https://ethiotravelapp.000webhostapp.com/event/index.php'));

    if (response.statusCode == 200) {
      final List<dynamic> eventsData = jsonDecode(response.body);
      final List<Map<String, dynamic>> eventsList = eventsData.map((event) =>
      {

        'title': event['title'],
        'date': event['date'],
        'description': event['descri'],

      }).toList();

      return eventsList;
    } else {
      throw Exception('Failed to fetch events');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Map<String, dynamic>> events = snapshot.data!;
            return Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  final String title = event['title'].toString();
                  final String descri = event['descri'].toString();
                  final String date = event['date'].toString();
                  return ListTile(
                    title: Text(title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(date),
                        Text(descri),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigate to event details page
                    },
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching events: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
