import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CitySelector extends StatefulWidget {
  @override
  _CitySelectorState createState() => _CitySelectorState();
}

class _CitySelectorState extends State<CitySelector> {
  List<dynamic> regions = [];
  String? selectedCountry;
  String? selectedRegion;
  String? selectedCity;
  List<dynamic> cities = [];
  List<dynamic> states = [];

  @override
  void initState() {
    super.initState();
    loadRegions();
  }

  Future<void> loadRegions() async {
    try {
      final String response = await rootBundle.loadString('assets/country.json');
      final data = json.decode(response);
      setState(() {
        regions = data;
      });
    } catch (e) {
      print("Error loading regions: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select Location", style: TextStyle(color: Color(0xFF1A76D2))),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dropdown for Region
            _buildDropdown<String>(
              hint: "Select Country",
              value: selectedCountry,
              items: regions.map<DropdownMenuItem<String>>((region) {
                return DropdownMenuItem<String>(
                  value: region['name'],
                  child: Text(region['name']),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountry = newValue;
                  selectedRegion = null;
                  selectedCity = null;
                  if (newValue != null) {
                    var selectedRegionData = regions.firstWhere((region) => region['name'] == newValue);
                    states = selectedRegionData['state'];
                    cities = [];
                  }
                });
              },
            ),
            SizedBox(height: 20),

            // Dropdown for State
            _buildDropdown<String>(
              hint: "Select Region",
              value: selectedRegion,
              items: states.map<DropdownMenuItem<String>>((state) {
                return DropdownMenuItem<String>(
                  value: state['name'],
                  child: Text(state['name']),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedRegion = newValue;
                  selectedCity = null;
                  if (newValue != null) {
                    var selectedStateData = states.firstWhere((state) => state['name'] == newValue);
                    cities = selectedStateData['city'];
                  } else {
                    cities = [];
                  }
                });
              },
            ),
            SizedBox(height: 20),

            // Dropdown for City
            _buildDropdown<String>(
              hint: "Select City",
              value: selectedCity,
              items: cities.map<DropdownMenuItem<String>>((city) {
                return DropdownMenuItem<String>(
                  value: city['name'],
                  child: Text(city['name']),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue;
                });
              },
            ),
            SizedBox(height: 20),

            Text(
              selectedCity != null ? "Selected City: $selectedCity" : "No city selected",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (selectedCountry != null && selectedRegion != null && selectedCity != null) {
              // Use Future.delayed to avoid navigation conflicts
              Future.delayed(Duration.zero, () {
                Navigator.pop(context, <String, String>{
                  'country': selectedCountry!,
                  'region': selectedRegion!,
                  'city': selectedCity!,
                });
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please select a region, state, and city")),
              );
            }
          },
          child: Text("Save", style: TextStyle(color: Colors.white)), // Button text color
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1A76D2), // Primary color for the button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown<T>({
    required String hint,
    required T? value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(30), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: DropdownButton<T>(
        hint: Text(hint),
        value: value,
        isExpanded: true,
        onChanged: onChanged,
        items: items,
        underline: SizedBox(), // Remove the default underline
        dropdownColor: Colors.white, // Dropdown background color
      ),
    );
  }
}
