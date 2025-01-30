import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.green,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500, // Weight medium
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.green, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with your image URL
            ),
            SizedBox(height: 8),
            Text(
              'shaheer ali',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Preview', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500, // Weight medium
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Corner radius 8
                ),
                hintText: 'Enter your full name',
                hintStyle: TextStyle(color: Color(0xFF71717A)), // Placeholder color
              ),
              controller: TextEditingController(text: 'Devon Lane'),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Change Picture',
                      labelStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500, // Weight medium
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8), // Corner radius 8
                      ),
                      hintText: 'Upload new picture',
                      hintStyle: TextStyle(color: Color(0xFF71717A)), // Placeholder color
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.upload_file),
                  onPressed: () {
                    // Implement upload functionality
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Text('max size 5MB', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement save changes functionality
                    },
                    child: Text('Save changes'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Corner radius 8
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Implement cancel functionality
                    },
                    child: Text('Cancel'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.green, side: BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Corner radius 8
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}