import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class CountryCodePickerView extends StatefulWidget {
  const CountryCodePickerView({Key? key}) : super(key: key);

  @override
  State<CountryCodePickerView> createState() => _CountryCodePickerViewState();
}

class _CountryCodePickerViewState extends State<CountryCodePickerView> {
  late FlCountryCodePicker countryPicker;
  CountryCode? countryCode;
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final favoriteCountries = ["IN", "CA", "US"];
    countryPicker = FlCountryCodePicker(
      favorites: favoriteCountries,
      favoriteIcon: const Icon(Icons.star, color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: "Enter phone number",
              border: InputBorder.none,
              prefixIcon: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final code =
                            await countryPicker.showPicker(context: context);
                        setState(() {
                          countryCode = code;
                        });
                      },
                      child: Row(
                        children: [
                          //flag
                          Container(
                            child: countryCode != null
                                ? countryCode!.flagImage
                                : null,
                          ),
                          const SizedBox(width: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Text(
                              countryCode?.dialCode ?? "+1",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              labelStyle: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (countryCode != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "${countryCode?.dialCode}-${phoneController.text.toString()}")));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please select a phone Number"),
                  ),
                );
              }
            },
            child: const Text("Login"),
          )
        ],
      ),
    );
  }
}
