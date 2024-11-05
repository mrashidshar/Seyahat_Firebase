import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:seyahat/constants/languages.dart';

class LanguageChooser extends StatefulWidget {
  final Function(List<String>) onLanguageSelected;

  const LanguageChooser({Key? key, required this.onLanguageSelected, required InputDecoration decoration}) : super(key: key);

  @override
  _LanguageChooserState createState() => _LanguageChooserState();
}

class _LanguageChooserState extends State<LanguageChooser> {
  Set<String> _selectedLanguageCodes = {}; // Use a Set to avoid duplicates

  @override
  void initState() {
    super.initState();
    _loadSavedLanguages();
  }

  Future<void> _loadSavedLanguages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguages = prefs.getString('selected_languages');
    setState(() {
      if (savedLanguages != null) {
        _selectedLanguageCodes = savedLanguages.split(',').toSet();
      }
    });
  }

  Future<void> _saveSelectedLanguages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selected_languages', _selectedLanguageCodes.join(','));
    widget.onLanguageSelected(_selectedLanguageCodes.toList());
  }

  void _showLanguageSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Select Languages',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A76D2),
            ),
          ),
          content: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setDialogState) {
                return Column(
                  mainAxisSize: MainAxisSize.min, // To prevent the dialog from being too large
                  children: LanguageConstants.languages.entries.map((entry) {
                    return CheckboxListTile(
                      title: Text(entry.key),
                      value: _selectedLanguageCodes.contains(entry.value),
                      onChanged: (bool? value) {
                        setDialogState(() {
                          if (value == true) {
                            _selectedLanguageCodes.add(entry.value);
                          } else {
                            _selectedLanguageCodes.remove(entry.value);
                          }
                        });
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _saveSelectedLanguages();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Done',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1A76D2),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _showLanguageSelectionDialog,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1A76D2),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        'Select Languages',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

}
