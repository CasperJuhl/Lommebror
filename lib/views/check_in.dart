import 'package:flutter/cupertino.dart';
import 'package:slider_button/slider_button.dart';

class CheckIn extends StatefulWidget {
  @override
  CheckInState createState() => CheckInState();
}

class CheckInState extends State<CheckIn> {
  bool inChecked = false;
  bool outChecked = false;
  bool addGps = false;
  int numberInput = 0;
  TextEditingController headerController = TextEditingController();
  TextEditingController freeTextController = TextEditingController();

  void _handleCheckboxChange(bool? value, String type) {
    if (type == 'In') {
      setState(() {
        inChecked = value!;
        outChecked = !value;
      });
    } else {
      setState(() {
        outChecked = value!;
        inChecked = !value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Check In',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              CupertinoTextField(
                controller: headerController,
                placeholder: 'Enter name',
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoColors.lightBackgroundGray,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              CupertinoTextField(
                onChanged: (value) {
                  setState(() {
                    numberInput = int.tryParse(value) ?? 0;
                  });
                },
                keyboardType: TextInputType.number,
                placeholder: 'Enter number',
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoColors.lightBackgroundGray,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('In'),
                  CupertinoCheckbox(
                    value: inChecked,
                    onChanged: (bool? value) {
                      _handleCheckboxChange(value, 'In');
                    },
                  ),
                  SizedBox(width: 20),
                  Text('Out'),
                  CupertinoCheckbox(
                    value: outChecked,
                    onChanged: (bool? value) {
                      _handleCheckboxChange(value, 'Out');
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add GPS',
                    style: TextStyle(fontSize: 18),
                  ),
                  CupertinoSwitch(
                    value: addGps,
                    onChanged: (bool value) {
                      setState(() {
                        addGps = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              CupertinoTextField(
                controller: freeTextController,
                maxLines: 3,
                placeholder: 'Enter free text',
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoColors.lightBackgroundGray,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Spacer(),
              Center(
                child: SliderButton(
                  action: () async {
                    /// Do something here OnSlide
                    return true;
                  },
                  label: Text(
                    "Check in",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  icon: Icon(
                    CupertinoIcons.location,
                    color: Color(0xFF359756),
                    size: 40.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  boxShadow: BoxShadow(
                    color: Color(0xFF359756),
                    blurRadius: 12,
                  ),
                  alignLabel: Alignment.center,
                  width: 380,
                  radius: 15,
                  buttonColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Color(0xFF359756),
                  highlightedColor: Color(0xFF359756),
                  baseColor: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}

class CupertinoCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CupertinoCheckbox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        onChanged?.call(!value);
      },
      child: Icon(
        value ? CupertinoIcons.check_mark_circled_solid : CupertinoIcons.circle,
        color: CupertinoColors.activeBlue,
        size: 24,
      ),
    );
  }
}
