import 'package:flutter/material.dart';

const List<Map<String, String>> keykFlavors = [
  {
    'name': 'Classic Vanilla',
    'description':
        'Light sponge with Madagascar vanilla bean cream. Di masarap',
    'picNgKeyk': 'assets/keyk/vanilla.jpg',
  },
  {
    'name': 'Chocolate',
    'description': 'Masarap to yum yum favorite ni jinseng',
    'picNgKeyk': 'assets/keyk/chocolate.jpg',
  },
  {
    'name': 'Matcha Cake',
    'description': 'Lasang damo',
    'picNgKeyk': 'assets/keyk/matcha.jpg',
  },
  {
    'name': 'Strawbery Cake',
    'description': 'Mga 8/10 lang piro pidi na',
    'picNgKeyk': 'assets/keyk/strawberry.jpg',
  },
  {
    'name': 'Tiramisu',
    'description': 'Hindi ko pa ito natitikman pero mukhang masarap',
    'picNgKeyk': 'assets/keyk/tiramisu.jpg',
  },
];

const List<Map<String, String>> keykSize = [
  {'sizeName': 'Maliit', 'price': '+ 200 pitot'},
  {'sizeName': 'Mas Malaki sa maliit', 'price': '+ 400 pitot'},
  {'sizeName': 'Mas Malaki sa malaki', 'price': '+ 600 pitot'},
];

const List<Map<String, String>> keykDagdag = [
  {'nameDagdag': 'Tsokoleyt na panis', 'priceDagdag': '+ 30 pitot'},
  {'nameDagdag': 'Balat ng saging', 'priceDagdag': '+ 40 pitot'},
  {'nameDagdag': 'Pinya', 'priceDagdag': '+ 50 pitot'},
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
  {'Type': 'Jeykas', 'pic': 'assets/payment/gcash.png'},
  {'Type': 'Maya', 'pic': 'assets/payment/maya.png'},
  {'Type': 'Kash', 'pic': 'assets/payment/cash.png'},
];

final List<TextEditingController> _controllers = List.generate(
  keykInfo.length,
  (_) => TextEditingController(),
);

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  GumaganangVersion createState() => GumaganangVersion();
}

class GumaganangVersion extends State<MyApp> {
  int? anoLasaNgKeyk = 0;
  int? anoSizeNgKeyk = 0;
  int? anoAngPimint = 0;
  Set<int> pinilingAddOns = {};
  String? mgaAraw;

  void _reset() {
    setState(() {
      anoLasaNgKeyk = 0;
      anoSizeNgKeyk = 0;
      anoAngPimint = 0;
      pinilingAddOns = {};
      mgaAraw = null;
    });
    for (final c in _controllers) {
      c.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFFF9F4),
        appBar: AppBar(
          title: const Text('KIYK NA MASARAP NI JINSENG'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1600),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SectionCard(
                      title: 'Anong Flavor ang Gusto mo?',
                      child: mgaFlavors(),
                    ),
                    const SizedBox(height: 16),
                    SectionCard(
                      title: 'Anong toppings?',
                      child: dagdagsakeyks(),
                    ),
                    const SizedBox(height: 16),
                    SectionCard(title: 'Gaano Kalaki?', child: kiykSizes()),
                    const SizedBox(height: 16),
                    SectionCard(
                      title: 'Paki Fill upan hehe',
                      child: inputFields(),
                    ),
                    const SizedBox(height: 16),
                    SectionCard(
                      title: 'Kelan Ipapadala?',
                      child: kelanDadalhin(),
                    ),
                    const SizedBox(height: 16),
                    SectionCard(
                      title: 'Paano ka magbabayad?',
                      child: pambayad(),
                    ),
                    const SizedBox(height: 16),
                    saveOrReset(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mgaFlavors() {
    return Column(
      children: List.generate(keykFlavors.length, (i) {
        final flavor = keykFlavors[i];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio<int>(
                value: i,
                groupValue: anoLasaNgKeyk,
                onChanged: (v) => setState(() => anoLasaNgKeyk = v!),
                activeColor: Color(0xFFE8A87C),
                fillColor: WidgetStateProperty.all(Color(0xFFE8A87C)),
              ),
              SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  flavor['picNgKeyk']!,
                  width: 80, // ← change this
                  height: 100, // ← change this
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flavor['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF6B3F2A),
                      ),
                    ),
                    Text(
                      flavor['description']!,
                      style: const TextStyle(
                        color: Color(0xFF9E6B4A),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget dagdagsakeyks() {
    return Column(
      children: List.generate(keykDagdag.length, (i) {
        final addon = keykDagdag[i];
        return CheckboxListTile(
          activeColor: Color(0xFFE8A87C),
          checkColor: Colors.white,
          side: BorderSide(color: Color(0xFFE8A87C), width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          value: pinilingAddOns.contains(i),
          onChanged: (checked) => setState(() {
            checked! ? pinilingAddOns.add(i) : pinilingAddOns.remove(i);
          }),
          title: Text(
            addon['nameDagdag']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF6B3F2A),
            ),
          ),
          subtitle: Text(
            addon['priceDagdag']!,
            style: const TextStyle(color: Color(0xFF9E6B4A), fontSize: 12),
          ),
        );
      }),
    );
  }

  Widget kiykSizes() {
    return Column(
      children: List.generate(keykSize.length, (i) {
        final laki = keykSize[i];
        return RadioListTile<int>(
          activeColor: Color(0xFFE8A87C),
          fillColor: WidgetStateProperty.all(Color(0xFFE8A87C)),
          value: i,
          groupValue: anoSizeNgKeyk,
          onChanged: (v) => setState(() => anoSizeNgKeyk = v!),
          title: Text(
            laki['sizeName']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF6B3F2A),
            ),
          ),
          subtitle: Text(
            laki['price']!,
            style: const TextStyle(color: Color(0xFF9E6B4A), fontSize: 12),
          ),
        );
      }),
    );
  }

  Widget inputFields() {
    return Column(
      children: List.generate(keykInfo.length, (i) {
        final datos = keykInfo[i];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextField(
            controller: _controllers[i],
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Color(0xFF9E6B4A)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFFE8A87C)),
              ),
              labelText: datos['label']!,
              hintText: datos['hint']!,
            ),
          ),
        );
      }),
    );
  }

  Widget kelanDadalhin() {
    return DropdownButtonFormField<String>(
      dropdownColor: Color(0xFFFFF9F4),
      style: TextStyle(
        color: Color(0xFF6B3F2A),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      value: mgaAraw,
      hint: const Text('Pumili ng araw'),
      items: keykDays.map((araw) {
        return DropdownMenuItem(value: araw, child: Text(araw));
      }).toList(),
      onChanged: (v) => setState(() => mgaAraw = v),
      borderRadius: BorderRadius.circular(16),
    );
  }

  Widget pambayad() {
    return Column(
      children: List.generate(keykPay.length, (i) {
        final bayad = keykPay[i];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Radio<int>(
                activeColor: Color(0xFFE8A87C),
                fillColor: WidgetStateProperty.all(Color(0xFFE8A87C)),
                value: i,
                groupValue: anoAngPimint,
                onChanged: (v) => setState(() => anoAngPimint = v!),
              ),
              const SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  bayad['pic']!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                bayad['Type']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF6B3F2A),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget saveOrReset() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 201, 129, 81),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: Size(double.infinity, 60),
            ),
            child: const Text(
              'Save My Order',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: _reset,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 201, 201, 201),
              foregroundColor: const Color.fromARGB(221, 0, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: Size(double.infinity, 60),
            ),
            child: const Text(
              'Reset',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9F4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8C9B0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 100, 72, 49).withOpacity(0.35),
            blurRadius: 16,
            spreadRadius: 0,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF6B3F2A),
            ),
          ),
          const Divider(color: Color(0xFFE8C9B0), thickness: 1, height: 20),
          child,
        ],
      ),
    );
  }
}
