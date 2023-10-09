import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/fitur/controller/auth_controller.dart';
import 'package:whatsapp/fitur/exstension/Costum_extention.dart';
import 'package:whatsapp/fitur/widget/alert_dialog.dart';
import 'package:whatsapp/fitur/widget/costum_elevatedbutton.dart';
import 'package:whatsapp/fitur/widget/icon_button.dart';
import 'package:whatsapp/fitur/widget/textfield.dart';
import 'package:whatsapp/fitur/widget/warna.dart';

class Loginpage extends ConsumerStatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  ConsumerState<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends ConsumerState<Loginpage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  sendCodeToPhone() {
    final phoneNumber = phoneNumberController.text;
    final countryName = countryNameController.text;
    final countryCode = countryCodeController.text;
    if (phoneNumber.isEmpty) {
      return showAlertDialog(
          context: context, message: "Please enter your phone number");
    } else if (phoneNumber.length < 9) {
      return showAlertDialog(
          context: context,
          message:
              "The phone number you entered is too short for the country: $countryName.\n\nInclude your area code if you haven't");
    } else if (phoneNumber.length < 10) {
      return showAlertDialog(
          context: context,
          message:
              'The phone number you entered is too long for the country $countryName');
    }
    //request code
    ref.read(authControllerProvider).sendSmsCode(
        context: context, phoneNumber: '+$countryCode$phoneNumber');
  }

  showCountryCodePicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['ID'], // 'ID' adalah kode negara untuk Indonesia
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).backgroundColor,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(color: context.theme.greyColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(
            color: context.theme.greyColor,
          ),
          prefixIcon: const Icon(
            Icons.language,
            color: warna.hijautua,
          ),
          hintText: 'Search Country code or name',
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: context.theme.greyColor!.withOpacity(0.2)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: warna.hijautua,
            ),
          ),
        ),
      ),
      onSelect: (country) {
        setState(() {
          countryNameController.text = country.name;
          countryCodeController.text = country.phoneCode;
        });
      },
    );
  }

  @override
  void initState() {
    countryNameController = TextEditingController(text: 'Indonesia');
    countryCodeController = TextEditingController(text: '+62');
    phoneNumberController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Enter your phone number',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        centerTitle: true,
        actions: [
          CostumIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'WhatsApp will need to verify your phone number.',
                style: TextStyle(
                  color: context.theme.greyColor,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "What's my number?",
                    style: TextStyle(
                      color: context.theme.blueColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Mytextfield(
              controller: countryNameController,
              onTap: () => showCountryCodePicker(),
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: warna.hijautua,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: Mytextfield(
                    onTap: () => showCountryCodePicker(),
                    controller: countryCodeController,
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Mytextfield(
                    controller: phoneNumberController,
                    hintText: 'phone number',
                    textAlign: TextAlign.left,
                    allowOnlyNumbers: true,
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Carrier charges may apply',
            style: TextStyle(
              color: context.theme.greyColor,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Costum_Elevated(
        onPressed: sendCodeToPhone,
        text: 'NEXT',
        buttonWidth: 90,
      ),
    );
  }
}
