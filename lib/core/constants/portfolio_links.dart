import 'package:url_launcher/url_launcher.dart';

// ---------------------------------------------------------------------------
// Links & External Resources
// ---------------------------------------------------------------------------
class PortfolioLinks {
  static final Uri resume = Uri.parse(
    'https://drive.google.com/file/d/1Gwg-3VHR44nLAf0I_W2jXEPJ_mMBLkY3/view',
  );
  static final Uri email = Uri.parse('mailto:devendramaurya456@gmail.com');
  static final Uri whatsapp = Uri.parse('https://wa.me/7897430432');
  static final Uri phone = Uri.parse('tel:+917897430432');
  static final Uri linkedin = Uri.parse(
    'https://www.linkedin.com/in/devendra-maurya-b639261aa/',
  );
  static final Uri github = Uri.parse('https://github.com/devendra456');

  // Education Institution Links
  static final Uri bssitm = Uri.parse('https://bssitm.ac.in');
  static final Uri gppPratapgarh = Uri.parse('https://www.gpppratapgarh.in');

  // Company Website Links
  static final Uri theCardCompany = Uri.parse('https://thecardcompany.in/');
  static final Uri rvSolutions = Uri.parse('https://www.rvsolutions.in');
  static final Uri skyviewAds = Uri.parse('https://skyviewads.com');

  // Project App Links
  static final Uri theCardCoAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.fypmoney',
  );
  static final Uri theCardCoiOS = Uri.parse(
    'https://apps.apple.com/in/app/the-card-company/id1573905747',
  );
  static final Uri meraRationAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.nic.onenationonecard',
  );
  static final Uri meraRationiOS = Uri.parse(
    'https://apps.apple.com/in/app/mera-ration-app/id6621209637',
  );
  static final Uri mateAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=meet.mate.app',
  );
  static final Uri mausamAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.imd.masuam',
  );
  static final Uri mausamiOS = Uri.parse(
    'https://apps.apple.com/in/app/mausam/id1522893967',
  );
  static final Uri pmndpAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.apps.pmndp',
  );
  static final Uri pmndpiOS = Uri.parse(
    'https://apps.apple.com/in/app/pmndp/id6450005257',
  );
  static final Uri irsAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.apps.irs',
  );
  static final Uri irsiOS = Uri.parse(
    'https://apps.apple.com/us/app/%E0%A4%87-irs/id6448989728',
  );
  static final Uri surveyGestureAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.skyviewads.feedback',
  );
  static final Uri xperienceItAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.mustafaskyview.xperience_it',
  );
  static final Uri foodCourtAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.foodcourt.buyer',
  );
  static final Uri femmeCustomerAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.femmecustomer',
  );
  static final Uri femmePosAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.femme.pos',
  );
  static final Uri daemPosIndiaAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.tech.daempos.india',
  );
  static final Uri daemRestaurantAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.daempos.restaurant',
  );
  static final Uri delareaAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.skyviewads.delarea.delarea',
  );
  static final Uri markatUsa4allAndroid = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.salla.usa4all',
  );

  static Future<void> open(Uri url) async {
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
  }
}
