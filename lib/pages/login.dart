import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'انضم إلينا!',
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFE8ECEB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'الاستمرار كضيف',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3CB7B5),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // AutofillGroup(
                //   child: Column(
                //     children: <Widget>[
                //       TextFormField(
                //         autofillHints: [AutofillHints.givenName],
                //         // ... other properties
                //       ),
                //       TextFormField(
                //         autofillHints: [AutofillHints.familyName],
                //         // ... other properties
                //       ),
                //       // ... other fields
                //     ],
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'الاسم الأول',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 150,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'الاسم الآخر',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CountryCodePicker(
                      onChanged: print,
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'EG',
                      favorite: ['+20','EG'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                      ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'رقم الهاتف',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Expanded(
                      child: Text(
                        'أقر وأوافق على الاتفاقية المستخدمة و سياسة الخصوصية الخاصة بنا',
                        // style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'أو سجل عبر',
                  // style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.apple),
                      label: const Text('أبل'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.g_mobiledata),
                      label: const Text('جوجل'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'هل لديك حساب؟ تسجيل الدخول',
                    // style: TextStyle(color: Colors.white),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('إنشاء حساب'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
