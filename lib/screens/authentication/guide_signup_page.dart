import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seyahat/screens/authentication/success_page.dart';
import 'package:seyahat/widgets/language_chooser.dart';
import '../../widgets/city_selector.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/password_field.dart';

class GuideSignUpPage extends StatefulWidget {
  const GuideSignUpPage({Key? key}) : super(key: key);

  @override
  _GuideSignUpPageState createState() => _GuideSignUpPageState();
}

class _GuideSignUpPageState extends State<GuideSignUpPage> {
  int currentStep = 0;

  // Controllers for each field
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  List<String> selectedLanguages = [];
  XFile? certificateFile;
  String selectedCountry = '';
  String selectedRegion = '';
  String selectedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Guide Sign Up"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          children: [
            const Text(
              'Sign Up as a Guide',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A76D2),
              ),
            ),
            const SizedBox(height: 20),
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Color(0xFF1A76D2), // Primary color for the Stepper
                colorScheme: ColorScheme.light(primary: Color(0xFF1A76D2)), // Primary color for the buttons
              ),
              child: Stepper(
                type: StepperType.vertical,
                currentStep: currentStep,
                onStepContinue: () {
                  if (currentStep < getSteps().length - 1) {
                    setState(() {
                      currentStep++;
                    });
                  } else {
                    _handleSignUp(context);
                  }
                },
                onStepCancel: () {
                  if (currentStep > 0) {
                    setState(() {
                      currentStep--;
                    });
                  }
                },
                steps: getSteps(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        title: const Text("Personal Info"),
        content: Column(
          children: [
            CustomTextField(
              controller: fullNameController,
              hintText: 'Full Name',
              prefixIcon: const Icon(Icons.person, color: Color(0xFF1A76D2)), // Username icon
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: cnicController,
              hintText: 'CNIC',
              prefixIcon: const Icon(Icons.person, color: Color(0xFF1A76D2)), // Username icon
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: phoneController,
              hintText: 'Phone Number',
              prefixIcon: const Icon(Icons.phone, color: Color(0xFF1A76D2)), // Username icon
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              prefixIcon: const Icon(Icons.mail, color: Color(0xFF1A76D2)), // Username icon
            ),
            PasswordTextField(controller: passwordController), // Your password field widget
          ],
        ),
      ),
      Step(
        title: const Text("Account Info"),
        content: Column(
          children: [
            const SizedBox(height: 10),
            CustomTextField(
              controller: experienceController,
              hintText: 'Experience',
              prefixIcon: const Icon(Icons.work, color: Color(0xFF1A76D2)), // Email icon
            ),
            const SizedBox(height: 10),
            LanguageChooser(
              decoration: const InputDecoration(labelText: "Language"),
              onLanguageSelected: (List<String> selectedLanguages) {
                this.selectedLanguages = selectedLanguages;
              },
            ),
          ],
        ),
      ),
      Step(
        title: const Text("Additional Info"),
        content: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                certificateFile = await picker.pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A76D2),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text("Upload Certificate (PDF)", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final selectedLocation = await showDialog<Map<String, String>>(
                  context: context,
                  builder: (context) => CitySelector(),
                );

                if (selectedLocation != null) {
                  setState(() {
                    selectedCountry = selectedLocation['country'] ?? '';
                    selectedRegion = selectedLocation['region'] ?? '';
                    selectedCity = selectedLocation['city'] ?? '';
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A76D2),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(selectedCity.isEmpty ? "Select City" : "$selectedCity, $selectedRegion, $selectedCountry", style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    ];
  }

  Future<void> _handleSignUp(BuildContext context) async {

    // Prepare data to be saved
    final data = {
      'fullName': fullNameController.text,
      'cnic': cnicController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'experience': experienceController.text,
      'languages': selectedLanguages,
      'location': {
        'country': selectedCountry,
        'region': selectedRegion,
        'city': selectedCity,
      },
    };

    try {
      // Save data to Firestore
      await FirebaseFirestore.instance.collection('guides').add(data);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SuccessPage(username :fullNameController.text)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to save data. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
