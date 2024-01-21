part of 'contact_us_imports.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  ContactUsData contactUsData = ContactUsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: BuildAuthAppBar(
        title: tr("contactUs"),
        isCenterTitle: false,
        haveLeading: true
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
        children: [
          BuildContactUsFields(contactUsData: contactUsData),
          BuildContactUsButton(contactUsData: contactUsData)
        ],
      ),
    );
  }
}
