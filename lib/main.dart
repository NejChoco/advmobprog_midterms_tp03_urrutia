import 'package:flutter/material.dart';

const List<Map<String, String>> keykFlavors = [
  {
    'name': 'Classic Vanilla',
    'description': 'Light sponge with Madagascar vanilla bean cream',
    'picNgKeyk': 'assets/keyk/chocolate.png',
  },
  {
    'name': 'Chocolate',
    'description': 'Masarap to yum yum favorite ni jinseng',
    'picNgKeyk': 'assets/keyk/chocolate.png',
  },
];

const List<Map<String, String>> keykSize = [
  {'sizeName': 'Maliit', 'price': '100 pitot'},
  {'sizeName': 'Mas Malaki sa maliit', 'price': '200 pitot'},
  {'sizeName': 'Mas Malaki sa malaki', 'price': '300 pitot'},
];

const List<Map<String, String>> keykDagdag = [
  {'nameDagdag': 'Tsokoleyt na panis', 'priceDagdag': '30 pitot'},
  {'nameDagdag': 'Balat ng saging', 'priceDagdag': '40 pitot'},
  {'nameDagdag': 'Mga pangaral ni sir Mario', 'priceDagdag': '999999 pitot'},
];
const List<Map<String, String>> keykInfo = [
  {'label': 'Recipient Name', 'hint': 'e.g. Jinseng'},
  {'label': 'Dedication Message', 'hint': 'e.g. Mama mo dedication'},
  {'label': 'Delivery Address', 'hint': 'e.g. 123 Biringan City'},
  {'label': 'Delivery Instructions', 'hint': 'e.g. Bawal ibagsak'},
];

const List<String> keykDays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

const List<Map<String, String>> keykPay = [
  {'Type': 'Jeykas'},
  {'Type': 'Maya'},
  {'Type': 'BIDIOH'},
];

final List<TextEditingController> _controllers = List.generate(
  keykInfo.length,
  (_) => TextEditingController(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  GumaganangVersion createState() => GumaganangVersion();
}

class GumaganangVersion extends State<MyApp> {
  int? anoLasaNgKeyk = 0;
  int? anoSizeNgKeyk = 0;
  int? anoAngPimint = 0;
  Set<int> _pinilingAddOns = {};
  String? mgaAraw;
  //bool? mayCheeseBa = false;
  //bool? mayHalamanBa = false;
  //bool? maySusejBa = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('KIYK NA MASARAP NI JINSENG')),
        body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1600),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF9F4),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFFE8C9B0),
                          width: 1.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 16,
                            spreadRadius: 0,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      //* Cake selection - radio
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('CHOOSE ACHUCHU'),
                          Divider(
                            color: Color(0xFFE8C9B0),
                            thickness: 1,
                            height: 20,
                          ),
                          ...List.generate(keykFlavors.length, (i) {
                            final flavor = keykFlavors[i];
                            return RadioListTile<int>(
                              value: i,
                              groupValue: anoLasaNgKeyk,
                              onChanged: (v) =>
                                  setState(() => anoLasaNgKeyk = v!),
                              title: Text(flavor['name']!),
                              subtitle: Text(flavor['description']!),
                              secondary: Container(
                                width: 100,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFF5EAE6),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    flavor['picNgKeyk']!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    //* Cake addons - checkbox
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF9F4),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFFE8C9B0),
                          width: 1.2,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('CHOOSE ADDONS'),
                          Divider(
                            color: Color(0xFFE8C9B0),
                            thickness: 1,
                            height: 20,
                          ),
                          ...List.generate(keykDagdag.length, (i) {
                            final addons = keykDagdag[i];
                            return CheckboxListTile(
                              value: _pinilingAddOns.contains(i),
                              onChanged: (checked) => setState(() {
                                checked!
                                    ? _pinilingAddOns.add(i)
                                    : _pinilingAddOns.remove(i);
                              }),
                              title: Text(addons['nameDagdag']!),
                              subtitle: Text(addons['priceDagdag']!),
                            );
                          }),
                        ],
                      ),
                    ),
                    //* Cake Size - Radio
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF9F4),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFFE8C9B0),
                          width: 1.2,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('CHOOSE LAKI'),
                          Divider(
                            color: Color(0xFFE8C9B0),
                            thickness: 1,
                            height: 20,
                          ),
                          ...List.generate(keykSize.length, (i) {
                            final laki = keykSize[i];
                            return RadioListTile<int>(
                              value: i,
                              groupValue: anoSizeNgKeyk,
                              onChanged: (v) =>
                                  setState(() => anoSizeNgKeyk = v!),
                              title: Text(laki['sizeName']!),
                              subtitle: Text(laki['price']!),
                            );
                          }),
                        ],
                      ),
                    ),
                    //*
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF9F4),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFFE8C9B0),
                          width: 1.2,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('INFORMATION'),
                          Divider(
                            color: Color(0xFFE8C9B0),
                            thickness: 1,
                            height: 20,
                          ),
                          ...List.generate(keykInfo.length, (i) {
                            final datos = keykInfo[i];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: TextField(
                                controller: _controllers[i],
                                decoration: InputDecoration(
                                  labelText: datos['label']!,
                                  hintText: datos['hint']!,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF9F4),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFFE8C9B0),
                          width: 1.2,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Delivery Day'),
                          Divider(
                            color: Color(0xFFE8C9B0),
                            thickness: 1,
                            height: 20,
                          ),
                          DropdownButtonFormField<String>(
                            value: mgaAraw,
                            hint: Text('Pumili ng araw mo'),
                            items: keykDays.map((araw) {
                              return DropdownMenuItem(
                                value: araw,
                                child: Text(araw),
                              );
                            }).toList(),
                            onChanged: (v) => setState(() => mgaAraw = v),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF9F4),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFFE8C9B0),
                          width: 1.2,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('CHOOSE BAYAD'),
                          Divider(
                            color: Color(0xFFE8C9B0),
                            thickness: 1,
                            height: 20,
                          ),
                          ...List.generate(keykPay.length, (i) {
                            final bayad = keykPay[i];
                            return RadioListTile<int>(
                              value: i,
                              groupValue: anoAngPimint,
                              onChanged: (v) =>
                                  setState(() => anoAngPimint = v!),
                              title: Text(bayad['Type']!),
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: Text('Save My order'),
                        ),
                        SizedBox(width: 32),
                        OutlinedButton(onPressed: () {}, child: Text('Reset')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
