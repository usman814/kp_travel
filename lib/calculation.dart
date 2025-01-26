import 'package:flutter/material.dart';
import "package:intl/intl.dart";

void main() {
  runApp(PlanYourStayApp());
}

class PlanYourStayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlanYourStayScreen(),
    );
  }
}

class PlanYourStayScreen extends StatefulWidget {
  @override
  _PlanYourStayScreenState createState() => _PlanYourStayScreenState();
}

class _PlanYourStayScreenState extends State<PlanYourStayScreen> {
  double _minBudget = 0;
  double _maxBudget = 1000;
  String? _destination;
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  int _adults = 1;
  int _children = 0;
  String _hotelType = 'Budget';
  List<String> _selectedAmenities = [];

  void _selectDate(BuildContext context, bool isCheckIn) async {
    DateTime initialDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = pickedDate;
        } else {
          _checkOutDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan Your Stay'),
        backgroundColor: Colors.green,
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
              ),
              SizedBox(height: 20),
              Text('Budget', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: 'min'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _minBudget = double.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: 'max'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _maxBudget = double.tryParse(value) ?? 1000;
                        });
                      },
                    ),
                  ),
                ],
              ),
              RangeSlider(
                min: 0,
                max: 50000,
                values: RangeValues(_minBudget, _maxBudget),
                onChanged: (RangeValues values) {
                  setState(() {
                    _minBudget = values.start;
                    _maxBudget = values.end;
                  });
                },
              ),
              SizedBox(height: 20),
              Text('Destination',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(
                decoration:
                InputDecoration(hintText: 'Select your destination'),
                onChanged: (value) {
                  setState(() {
                    _destination = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Check In',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () => _selectDate(context, true),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(_checkInDate == null
                                ? 'dd-mmm-yyyy'
                                : DateFormat('dd-MMM-yyyy')
                                .format(_checkInDate!)),
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
                        Text('Check Out',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () => _selectDate(context, false),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(_checkOutDate == null
                                ? 'dd-mmm-yyyy'
                                : DateFormat('dd-MMM-yyyy')
                                .format(_checkOutDate!)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('No of guests',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Wrap(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Add this to spread items
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Centering the content
                      children: [
                        Text('Adults: '),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (_adults > 1) _adults--;
                            });
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text('$_adults'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _adults++;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10), // Add space between adults and children
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Centering the content
                      children: [
                        Text('Children: '),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (_children > 0) _children--;
                            });
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text('$_children'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _children++;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Hotel Type', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: ['Budget', 'Mid', 'Luxury'].map((type) {
                  return Expanded(
                    child: ChoiceChip(
                      label: Text(type),
                      selected: _hotelType == type,
                      onSelected: (selected) {
                        setState(() {
                          _hotelType = type;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text('Amenities', style: TextStyle(fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 10,
                children: ['Free Wi-Fi', 'Breakfast included', 'Swimming pool']
                    .map((amenity) {
                  return FilterChip(
                    label: Text(amenity),
                    selected: _selectedAmenities.contains(amenity),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedAmenities.add(amenity);
                        } else {
                          _selectedAmenities.remove(amenity);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Reset functionality
                        _minBudget = 0;
                        _maxBudget = 1000;
                        _destination = null;
                        _checkInDate = null;
                        _checkOutDate = null;
                        _adults = 1;
                        _children = 0;
                        _hotelType = 'Budget';
                        _selectedAmenities.clear();
                      });
                    },
                    child: Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement Find functionality
                      print('Find clicked');
                    },
                    child: Text('Find'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}