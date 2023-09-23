//import 'package:bitcoin/home.dart';
import 'package:bitcoin/home.dart';
import 'package:flutter/material.dart';

class mysendscreen extends StatefulWidget {
  const mysendscreen({super.key});

  @override
  State<mysendscreen> createState() => _mysendscreenState();
}

// Initial Selected Value
String dropdownvalue = 'Item 1';

// List of items in our dropdown menu
var items = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];

class _mysendscreenState extends State<mysendscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        title: Text("Send"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Select Currency",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.grey,
                ),
                height: 60,
                width: 370,
                child: DropdownButton(
                  menuMaxHeight: Checkbox.width,
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Address",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.grey,
                ),
                height: 60,
                width: 370,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Amount",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.grey,
                ),
                height: 60,
                width: 370,
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Add the action you want to perform when the button is pressed
              //     // For example, you can navigate to the next screen here.
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => Home()),
              //     );
              //   },
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all(
              //         Colors.tealAccent), // Set button background color to red
              //   ),
              //   child: Text('Send'), // Button text
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
