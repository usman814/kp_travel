import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _selectedDate = DateTime.now();
  List<DateTime> _bookedDates = [
    DateTime.now().add(Duration(days: 5)),
    DateTime.now().add(Duration(days: 10)),
  ];

  Widget _buildCalendarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            setState(() {
              _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
            });
          },
        ),
        Text(
          DateFormat('MMMM yyyy').format(_selectedDate),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            setState(() {
              _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
            });
          },
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    int daysInMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    int firstDayOfWeek = DateTime(_selectedDate.year, _selectedDate.month, 1).weekday;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: daysInMonth + firstDayOfWeek - 1,
      itemBuilder: (context, index) {
        int day = index - firstDayOfWeek + 2;
        if (index < firstDayOfWeek - 1) {
          return Container();
        } else {
          DateTime currentDate = DateTime(_selectedDate.year, _selectedDate.month, day);
          bool isBooked = _bookedDates.contains(currentDate);

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = currentDate;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                color: isBooked ? Colors.green[200] : null,
              ),
              child: Center(
                child: Text(
                  day.toString(),
                  style: TextStyle(
                    color: currentDate == _selectedDate ? Colors.white : Colors.black,
                    fontWeight: currentDate == _selectedDate ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendarHeader(),
            _buildCalendarGrid(),
            SizedBox(height: 20),
            Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://i.ibb.co/4g1C8m9/serene-valley-resort.jpg',
                    width: 120,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Serene Valley Resort',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Jalbanr Rd, Kalam, Swat'),
                          Text('17,500 PKR/Night'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 2,
        onTap: (index) {
          // Handle navigation here
        },
      ),
    );
  }
}
