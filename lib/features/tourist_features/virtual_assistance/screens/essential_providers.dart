import 'package:bt_frontend/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';

class BTEssentialProviders extends StatefulWidget {
  const BTEssentialProviders({super.key});

  @override
  State<BTEssentialProviders> createState() => _BTEssentialProvidersState();
}

class _BTEssentialProvidersState extends State<BTEssentialProviders> {
  String dropdownValue = 'Cafe';
  List<String> dropdownValues = ['Cafe', 'ATM', 'Restaurant', 'Convenience'];

  static const headerStyle = TextStyle(
      color: Color.fromARGB(255, 90, 90, 90),
      fontSize: 18,
      fontWeight: FontWeight.w600);
  var contentStyleHeader = TextStyle(
      color: Colors.grey[850], fontSize: 15.0, fontWeight: FontWeight.w700);
  var mainContentStyle = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 15.0, color: Colors.grey[850]);
  static const contentStyle = TextStyle(
      color: Color.fromARGB(255, 102, 102, 102),
      fontSize: 14,
      fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Essential Providers'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
        child: Accordion(
          headerBorderRadius: 7.0,
          contentBorderRadius: 7.0,
          headerBorderColor: Colors.grey,
          headerBackgroundColor: Colors.white,
          headerBorderColorOpened: Colors.grey,
          headerBorderWidth: 1,
          headerBackgroundColorOpened: Colors.white,
          contentBackgroundColor: Colors.white,
          contentBorderColor: Colors.grey,
          contentBorderWidth: 1,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
          sectionClosingHapticFeedback: SectionHapticFeedback.light,
          children: [
            AccordionSection(
              isOpen: true,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.business_center_outlined,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Landbank Camiguin',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Landbank Camiguin', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Placido Reyes St. Mambajao',
                            style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AccordionSection(
              isOpen: false,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.restaurant,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Jonard\'s Grill',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Jonard\'s Grill', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Balbagon, Mambajao', style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AccordionSection(
              isOpen: false,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.local_mall,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Gaisano Camiguin',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Gaisano Mall', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Vicente Romualdo St., Mambajao',
                            style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AccordionSection(
              isOpen: false,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.nightlife,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Alex Bar & Restaurant',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Alex Bar & Restaurant', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Yumbing, Mambajao', style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AccordionSection(
              isOpen: true,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.business_center_outlined,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Landbank Camiguin',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Landbank Camiguin', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Placido Reyes St. Mambajao',
                            style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AccordionSection(
              isOpen: false,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.restaurant,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Jonard\'s Grill',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Jonard\'s Grill', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Balbagon, Mambajao', style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AccordionSection(
              isOpen: false,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.local_mall,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Gaisano Camiguin',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Gaisano Mall', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Vicente Romualdo St., Mambajao',
                            style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AccordionSection(
              isOpen: false,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.nightlife,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Alex Bar & Restaurant',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Alex Bar & Restaurant', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Yumbing, Mambajao', style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AccordionSection(
              isOpen: true,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.business_center_outlined,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Landbank Camiguin',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Landbank Camiguin', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Placido Reyes St. Mambajao',
                            style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AccordionSection(
              isOpen: false,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.restaurant,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Jonard\'s Grill',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Jonard\'s Grill', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Balbagon, Mambajao', style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AccordionSection(
              isOpen: false,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.local_mall,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Gaisano Camiguin',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Gaisano Mall', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Vicente Romualdo St., Mambajao',
                            style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AccordionSection(
              isOpen: false,
              contentVerticalPadding: 10,
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              leftIcon: const Icon(
                Icons.nightlife,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Alex Bar & Restaurant',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name: ', style: contentStyle),
                        Text('Alex Bar & Restaurant', style: mainContentStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('Yumbing, Mambajao', style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
