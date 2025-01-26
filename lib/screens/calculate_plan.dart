import 'package:flutter/material.dart';

class HotelBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HotelBookingPage(),
    );
  }
}

class HotelBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plan Your Stay',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your preferences to find the perfect hotel recommendations for your trip.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text('Budget', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'min',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'max',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Destination', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Select your destination',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.location_on),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Check In', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'dd-mm-yyyy',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Check Out', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'dd-mm-yyyy',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('No of guests', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Adults', style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                          Text('1'),
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Children', style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                          Text('0'),
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Hotel Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChoiceChip(label: Text('Budget'), selected: false, onSelected: (val) {}),
                  ChoiceChip(label: Text('Mid'), selected: false, onSelected: (val) {}),
                  ChoiceChip(label: Text('Luxury'), selected: false, onSelected: (val) {}),
                ],
              ),
              SizedBox(height: 20),
              Text('Amenities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 10,
                children: [
                  FilterChip(label: Text('Free Wi-Fi'), selected: false, onSelected: (val) {}),
                  FilterChip(label: Text('Breakfast included'), selected: false, onSelected: (val) {}),
                  FilterChip(label: Text('Pool'), selected: false, onSelected: (val) {}),
                  FilterChip(label: Text('Luxury'), selected: false, onSelected: (val) {}),
                  FilterChip(label: Text('River side'), selected: false, onSelected: (val) {}),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Reset'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Find'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
