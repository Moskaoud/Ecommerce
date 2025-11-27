// import 'package:flutter/material.dart';
//
// class CountryCodePicker extends StatelessWidget {
//   const CountryCodePicker({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Column(children: [
//       CountryCodePicker(
//         onChanged: print,
//         // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//         initialSelection: 'IT',
//         //You can set the margin between the flag and the country name to your taste.
//         margin: const EdgeInsets.symmetric(horizontal: 6),
//         comparator: (a, b) => b.name!.compareTo(a.name!),
//         //Get the country information relevant to the initial selection
//         onInit: (code) => debugPrint("on init ${code?.name} ${code?.dialCode} ${code?.name}"),
//       ),
//       CountryCodePicker(
//         hideHeaderText: true,
//         onChanged: print,
//         // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//         initialSelection: 'IT',
//         favorite: const ['+39', 'FR'],
//         countryFilter: const ['IT', 'FR'],
//         // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
//         flagDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(7),
//         ),
//         pickerStyle: PickerStyle.bottomSheet,
//       ),
//       const SizedBox(
//         width: 400,
//         height: 60,
//         child: CountryCodePicker(
//           onChanged: print,
//           hideMainText: true,
//           showFlagMain: true,
//           showFlag: false,
//           initialSelection: 'TF',
//           hideSearch: true,
//           showCountryOnly: true,
//           showOnlyCountryWhenClosed: true,
//           alignLeft: true,
//         ),
//       ),
//       SizedBox(
//         width: 400,
//         height: 60,
//         child: CountryCodePicker(
//           onChanged: (element) => debugPrint(element.toLongString()),
//           initialSelection: 'TF',
//           showCountryOnly: true,
//           showOnlyCountryWhenClosed: true,
//           favorite: const ['+39', 'FR'],
//         ),
//       ),
//       SizedBox(
//         width: 100,
//         height: 60,
//         child: CountryCodePicker(
//           enabled: false,
//           onChanged: (c) => c.name,
//           initialSelection: 'TF',
//           showCountryOnly: true,
//           showOnlyCountryWhenClosed: true,
//           favorite: const ['+39', 'FR'],
//         ),
//       ),
//     ],);
//   }
// }
