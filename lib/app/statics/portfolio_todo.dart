/// PORTFOLIO TODO — replace only the values in this file as your final
/// content and assets are ready. Every image URL below is deliberately a
/// temporary network placeholder.
class PortfolioTodo {
  // Add your own hosted professional headshot before publishing.
  static const String profileImage = '';

  static const String heroEyebrow =
      'OPEN TO FULL-TIME ROLES & FREELANCE PROJECTS';

  static const String name = 'Devendra Maurya';

  static const String headline =
      'I turn complex product requirements into reliable mobile experiences.';

  static const String intro =
      'Software Development Engineer II with 5+ years of experience '
      'building Flutter applications across fintech, government services, '
      'and consumer products. Focused on clean architecture, performance, '
      'secure integrations, and end-to-end mobile delivery.';

  static const String location = 'Gurugram, Haryana, India';

  static const String availability =
      'Open to full-time opportunities, freelance projects, and collaborations';

  static const String resumeUrl =
      'https://drive.google.com/file/d/1Gwg-3VHR44nLAf0I_W2jXEPJ_mMBLkY3/view';

  static const String email = 'devendramaurya456@gmail.com';

  static const String whatsappUrl = 'https://wa.me/7897430432';

  static const String linkedinUrl =
      'https://www.linkedin.com/in/devendra-maurya-b639261aa/';

  static const String githubUrl = 'https://github.com/devendra456';

  static const String bookingUrl = '';

  // Metrics are taken from the resume.
  // Verify measurement methods and public-disclosure permissions.
  static const List<PortfolioMetric> metrics = [
    PortfolioMetric('5+', 'Years of mobile development'),
    PortfolioMetric('30+', 'Apps delivered'),
    PortfolioMetric('1M+', 'Users served by The Card Co'),
    PortfolioMetric('10+', 'Apps developed at Skyview'),
  ];

  static const String aboutTitle =
      'Engineering with care. Delivering impact at scale.';

  static const String about =
      'I am a mobile engineer experienced in building and shipping '
      'production applications using Flutter, Dart, and native Android '
      'technologies. My work spans fintech journeys, government-service '
      'platforms, GIS-based applications, and real-time social products. '
      'I enjoy solving complex integration challenges, improving '
      'application quality, and collaborating across Product, Design, '
      'Backend, and QA teams to deliver maintainable mobile experiences.';

  static const List<SkillGroup> skills = [
    SkillGroup('Mobile Engineering', [
      'Flutter',
      'Dart',
      'Android',
      'iOS',
      'Java',
      'Kotlin',
      'FlutterFlow',
    ]),
    SkillGroup('Architecture & State Management', [
      'BLoC',
      'GetX',
      'MVVM',
      'MVC',
      'Repository Pattern',
      'Clean Architecture',
    ]),
    SkillGroup('Backend & Firebase', [
      'REST APIs',
      'GraphQL',
      'Dio',
      'Firestore',
      'Cloud Functions',
      'Firebase Authentication',
      'FCM',
      'Remote Config',
      'Crashlytics',
      'App Check',
    ]),
    SkillGroup('Fintech Integrations', [
      'UPI',
      'Digital Wallets',
      'KYC Workflows',
      'Card Ordering',
      'Bill Payments',
      'Payment Gateways',
      'Razorpay',
      'Paytm',
      'PayU',
      'Stripe',
    ]),
    SkillGroup('Maps, Testing & Delivery', [
      'Leaflet Maps',
      'Google Maps',
      'Geolocation',
      'Unit Testing',
      'Widget Testing',
      'Integration Testing',
      'Git',
      'GitHub',
      'Play Store Deployment',
      'App Store Deployment',
    ]),
  ];

  static const List<ServiceItem> services = [
    ServiceItem(
      'Flutter Product Development',
      'Build production-ready Android and iOS applications '
          'with reusable components, maintainable architecture, '
          'and polished user experiences.',
    ),
    ServiceItem(
      'Fintech Engineering',
      'Develop connected financial workflows spanning KYC, '
          'wallet creation, card ordering, UPI, bill payments, '
          'family payments, and gifting.',
    ),
    ServiceItem(
      'Mobile Performance & Modernization',
      'Improve application responsiveness, rendering, '
          'code quality, architecture, and maintainability.',
    ),
    ServiceItem(
      'Maps & Native Integrations',
      'Connect Flutter with GIS visualization, JavaScript, '
          'native Android functionality, and third-party services.',
    ),
  ];

  static const List<ProjectItem> projects = [
    ProjectItem(
      title: 'The Card Co',
      category: 'Fintech · Digital Banking & Payments',
      // Use an approved product screenshot when available.
      imageUrl: '',
      summary:
      'A digital banking and payments application offering UPI, '
          'prepaid cards, wallet services, bill payments, gifting, '
          'and family payment features.',
      role: 'Software Development Engineer II',
      technologies: [
        'Flutter',
        'Dart',
        'BLoC',
        'Firebase',
        'REST APIs',
        'HyperVerge',
        'C91',
        'UPI / NPCI',
        'Freshchat',
        'MoEngage',
      ],
      challenge:
      'Delivering connected onboarding, wallet, card, and payment '
          'journeys while maintaining a consistent user experience '
          'across complex third-party integrations.',
      outcome:
      'Implemented KYC onboarding, wallet creation, and card ordering '
          'using HyperVerge and C91; delivered UPI, bill payments, '
          'family payments, and gifting features. The resume reports '
          '1M+ users, 25% application performance improvement, '
          'and 20% usability improvement.',
      androidUrl:
      'https://play.google.com/store/apps/details?id=com.fypmoney',
      iosUrl:
      'https://apps.apple.com/in/app/the-card-company/id1573905747',
    ),
    ProjectItem(
      title: 'Mera Ration',
      category: 'Government · Public Services',
      imageUrl: '',
      summary:
      'A government application supporting the One Nation One '
          'Ration Card initiative, including ration-related services, '
          'entitlement information, and fair price shop information.',
      role: 'Software Development Engineer I',
      technologies: [
        'Flutter',
        'Dart',
        'REST APIs',
        'Government Integrations',
        'Authentication',
      ],
      challenge:
      'Building and delivering mobile workflows for a public-service '
          'application with reliable API integrations and accessible UX.',
      outcome:
      'Led development of the Mera Ration application as part of '
          'government mobile delivery work at RV Solutions.',
      androidUrl:
      'https://play.google.com/store/apps/details?id=com.nic.onenationonecard',
      iosUrl:
      'https://apps.apple.com/in/app/mera-ration-app/id6621209637',
    ),
    ProjectItem(
      title: 'MAUSAM — IMD Weather App',
      category: 'Weather · GIS · Government',
      imageUrl: '',
      summary:
      'A weather application providing forecasts, observations, '
          'radar imagery, and weather alerts.',
      role: 'Software Development Engineer I',
      technologies: [
        'Flutter',
        'Leaflet Maps',
        'JavaScript',
        'GIS',
        'Geospatial Rendering',
      ],
      challenge:
      'Integrating Flutter with JavaScript-based map functionality '
          'and visualizing large geospatial datasets smoothly.',
      outcome:
      'Developed GIS-based weather visualization and optimized '
          'map rendering for improved visualization performance.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.imd.masuam',
      iosUrl: 'https://apps.apple.com/in/app/mausam/id1522893967',
    ),
    ProjectItem(
      title: 'UPYOG',
      category: 'Government · Digital Public Services',
      imageUrl: '',
      summary:
      'A public-service platform included in government application '
          'delivery work at RV Solutions.',
      role: 'Software Development Engineer I',
      technologies: [
        'Flutter',
        'REST APIs',
        'Mobile UI',
        'Government Platforms',
      ],
      challenge:
      'Delivering production-ready mobile application functionality '
          'within a government-service development environment.',
      outcome:
      'Contributed to UPYOG platform delivery and government '
          'mobile application development. Specific feature ownership '
          'should be confirmed before adding further detail.',
      androidUrl: '',
      iosUrl: '',
    ),
    ProjectItem(
      title: 'Mate',
      category: 'Dating · Social · Real-Time Messaging',
      imageUrl: '',
      summary:
      'A cross-platform dating and social application featuring '
          'swipe matching, real-time messaging, random chat, '
          'profile verification, and location-based discovery.',
      role: 'Flutter Developer · Product Project',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase Authentication',
        'Cloud Firestore',
        'Cloud Functions',
        'FCM',
        'Remote Config',
        'Real-Time Messaging',
      ],
      challenge:
      'Building responsive discovery and messaging experiences '
          'supported by real-time data, notifications, and configurable '
          'product features.',
      outcome:
      'Designed a Firebase-based application architecture using '
          'Firestore, Cloud Functions, Authentication, FCM, and '
          'Remote Config to support the core product experience.',
      androidUrl: 'https://play.google.com/store/apps/details?id=meet.mate.app',
      iosUrl: '',
    ),
    ProjectItem(
      title: 'PMNDP — Pradhan Mantri National Dialysis Programme',
      category: 'Healthcare · Government of India',
      imageUrl: '',
      summary:
          'A nationwide healthcare initiative portal and tracking system under the '
          'Ministry of Health and Family Welfare (MoHFW) for kidney patients requiring dialysis.',
      role: 'Mobile Engineer · Government Services',
      technologies: [
        'Flutter',
        'Dart',
        'REST APIs',
        'Secure Auth',
        'State Management',
        'Offline Caching',
      ],
      challenge:
          'Managing critical patient records, session tracking, and dialysis centre '
          'lookups across state and national healthcare networks with zero downtime.',
      outcome:
          'Delivered accessible patient registration, dialysis session logs, center locator, '
          'and real-time notifications for patients and caregivers across India.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.apps.pmndp',
      iosUrl: 'https://apps.apple.com/in/app/pmndp/id6450005257',
    ),
    ProjectItem(
      title: 'इ - IRS (e-IRS)',
      category: 'Fintech · Tax Administration · Government',
      imageUrl: '',
      summary:
          'Official portal application for Indian Revenue Service officers under the '
          'Central Board of Direct Taxes (CBDT), Department of Revenue, Ministry of Finance.',
      role: 'Mobile Engineer · Public & Administrative Services',
      technologies: [
        'Flutter',
        'Dart',
        'Enterprise Security',
        'REST APIs',
        'Document Viewer',
        'Push Notifications',
      ],
      challenge:
          'Ensuring strict government-grade security, authenticated officer workflows, '
          'and fast access to internal tax administrative circulars and services.',
      outcome:
          'Implemented secure officer authentication, service bulletin delivery, document access, '
          'and official utility tools with seamless multi-platform support.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.apps.irs',
      iosUrl: 'https://apps.apple.com/us/app/%E0%A4%87-irs/id6448989728',
    ),
    ProjectItem(
      title: 'Survey Gesture — Customer Feedback App',
      category: 'Enterprise · Survey Solutions · Tablets',
      imageUrl: '',
      summary:
          'A specialized B2B customer feedback and survey platform built for tablet devices in commercial and enterprise environments.',
      role: 'Mobile Engineer · Enterprise Apps',
      technologies: [
        'Flutter',
        'Dart',
        'Tablet UI',
        'REST APIs',
        'Offline Survey Caching',
        'Analytics',
      ],
      challenge:
          'Enabling high-volume offline survey responses and background syncing across tablet kiosks.',
      outcome:
          'Built robust offline caching, automated synchronization upon reconnection, and custom tablet UI.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.skyviewads.feedback',
      iosUrl: '',
    ),
    ProjectItem(
      title: 'XperienceIT — Book Your Events',
      category: 'Event Booking · Celebrations · Lifestyle',
      imageUrl: '',
      summary:
          'A celebration and event booking application enabling users to curate and book memorable occasions such as candlelight dinners, yacht celebrations, and party setups.',
      role: 'Mobile Engineer · Consumer Products',
      technologies: [
        'Flutter',
        'Dart',
        'Slot Booking',
        'Payment Gateway',
        'Push Notifications',
        'REST APIs',
      ],
      challenge:
          'Real-time slot availability, booking management, and high-conversion checkout flows.',
      outcome:
          'Delivered end-to-end event discovery, customized add-on selection, and secure digital checkout.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.mustafaskyview.xperience_it',
      iosUrl: '',
    ),
    ProjectItem(
      title: 'Food Court Buyer — Ordering & Delivery',
      category: 'Food Delivery · Multi-Vendor',
      imageUrl: '',
      summary:
          'An on-demand food ordering and delivery marketplace app connecting customers to food courts, restaurants, and retail dining outlets.',
      role: 'Mobile Engineer · On-Demand Delivery',
      technologies: [
        'Flutter',
        'Dart',
        'Live Order Tracking',
        'Payment Gateway',
        'Cart System',
        'Google Maps',
      ],
      challenge:
          'Supporting multi-restaurant order baskets and live delivery boy tracking with low latency.',
      outcome:
          'Architected cart checkout system and real-time order status tracking with location updates.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.foodcourt.buyer',
      iosUrl: '',
    ),
    ProjectItem(
      title: 'Femme — Salon & Spa Booking',
      category: 'Beauty · Wellness · Appointment Booking',
      imageUrl: '',
      summary:
          'A consumer-facing salon and beauty appointment booking application for discovering top local salons and scheduling stylist appointments.',
      role: 'Mobile Engineer · Consumer & Booking',
      technologies: [
        'Flutter',
        'Dart',
        'Slot Booking Engine',
        'Geolocation',
        'REST APIs',
        'Push Notifications',
      ],
      challenge:
          'Dynamic service duration scheduling and stylist calendar management across busy salon hours.',
      outcome:
          'Created seamless slot selection, localized salon discovery, and appointment reminders.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.femmecustomer',
      iosUrl: '',
    ),
    ProjectItem(
      title: 'FemmePOS — Salon Point of Sale System',
      category: 'POS · Retail & Salon Management',
      imageUrl: '',
      summary:
          'Comprehensive Point of Sale (POS) and operations management software designed for salon and spa owners with invoice printing and staff scheduling.',
      role: 'Mobile Engineer · POS & Hardware Integration',
      technologies: [
        'Flutter',
        'Dart',
        'Thermal Printing',
        'Inventory Management',
        'Billing & Invoicing',
        'Offline Mode',
      ],
      challenge:
          'Reliable Bluetooth / USB thermal receipt printing and staff commission tracking.',
      outcome:
          'Integrated multi-printer protocols, commission calculators, and instant GST invoice generation.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.femme.pos',
      iosUrl: '',
    ),
    ProjectItem(
      title: 'DaemPOS India — Retail & Supermarket Billing',
      category: 'Retail POS · Supermarket Inventory',
      imageUrl: '',
      summary:
          'A robust Point of Sale and billing application built for Indian retail stores, supermarkets, and grocery marts with barcode scanning.',
      role: 'Mobile Engineer · Retail Tech',
      technologies: [
        'Flutter',
        'Barcode Scanner SDK',
        'Receipt Printing',
        'GST Invoicing',
        'Inventory Sync',
        'SQLite',
      ],
      challenge:
          'Sub-second barcode lookups and rapid billing queue throughput for supermarket cashiers.',
      outcome:
          'Implemented high-speed local SQLite indexing and instant hardware barcode scanner integration.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.tech.daempos.india',
      iosUrl: '',
    ),
    ProjectItem(
      title: 'Daem POS Restaurant — Kitchen & Dining POS',
      category: 'Hospitality · Restaurant Tech',
      imageUrl: '',
      summary:
          'A specialized restaurant management and billing POS app for table floor mapping, waiter order taking, and instant Kitchen Order Ticket (KOT) routing.',
      role: 'Mobile Engineer · Restaurant Tech',
      technologies: [
        'Flutter',
        'KOT Printing',
        'Table Floor Mapping',
        'Multi-Terminal Sync',
        'WebSockets',
      ],
      challenge:
          'Multi-waiter concurrent ordering without order duplication or kitchen ticket dropouts.',
      outcome:
          'Built websocket-powered table state sync and automated network printer failover for kitchens.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.daempos.restaurant',
      iosUrl: '',
    ),
    ProjectItem(
      title: 'Delarea — Healthy Diet & Meal Delivery',
      category: 'Health · Nutrition · Food Subscriptions',
      imageUrl: '',
      summary:
          'A personalized health and nutrition subscription app allowing users to subscribe to customized healthy lunch meal packages and macro goals.',
      role: 'Mobile Engineer · Health & Food Tech',
      technologies: [
        'Flutter',
        'Dart',
        'Subscription Engine',
        'Calorie Metrics',
        'Delivery Scheduling',
        'Razorpay',
      ],
      challenge:
          'Flexible recurring subscription management with pause, skip, and customize delivery features.',
      outcome:
          'Designed intuitive recurring calendar planner and automated payment subscription handling.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.skyviewads.delarea.delarea',
      iosUrl: '',
    ),
    ProjectItem(
      title: 'Markat (USA4All) — Global Shopping Platform',
      category: 'E-Commerce · Cross-Border Shopping',
      imageUrl: '',
      summary:
          'A multi-category cross-border e-commerce and shopping app allowing customers to browse and order international fashion, cosmetics, and lifestyle products.',
      role: 'Mobile Engineer · E-Commerce',
      technologies: [
        'Flutter',
        'Dart',
        'E-Commerce Cart',
        'Payment Gateway',
        'Order Tracking',
        'Multi-Currency',
      ],
      challenge:
          'Multi-currency pricing, international tax calculations, and localized catalog rendering.',
      outcome:
          'Delivered smooth high-performance catalog browsing, wishlist sync, and secure international checkout.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.salla.usa4all',
      iosUrl: '',
    ),
  ];

  static const List<ExperienceItem> experience = [
    ExperienceItem(
      'May 2025 – Present',
      'The Card Company',
      'SDE 2',
      'Fintech engineering across KYC, wallets, card ordering, UPI, '
          'bill payments, family payments, gifting, customer engagement, '
          'application performance, and code quality.',
    ),
    ExperienceItem(
      'May 2023 – May 2025',
      'RV Solutions Pvt. Ltd.',
      'SDE 1',
      'Flutter development and production delivery for government '
          'applications, including Mera Ration and UPYOG; GIS solutions, '
          'Leaflet Maps, Flutter–JavaScript integration, and native '
          'Android weather functionality.',
    ),
    ExperienceItem(
      'May 2021 – May 2023',
      'Skyview Smart Solutions',
      'Mobile App Developer',
      'Developed and deployed 10+ mobile applications across '
          'e-commerce, dating, POS, medical, salon management, '
          'food delivery, and hardware integration.',
    ),
  ];

  // Awards and academic achievement stated in the resume.
  static const List<String> achievements = [
    'Employee of the Month (EOM) for delivering critical '
        'fintech features within project timelines.',
    'Best Performer Award (2024) for technical excellence '
        'and project delivery.',
    'Achieved second rank in the Computer Science and '
        'Engineering diploma branch.',
  ];

  // Resume-reported outcomes. Confirm measurement definitions
  // and permission to publish before presenting these as verified.
  static const List<String> impactHighlights = [
    'The Card Co: 1M+ users and 25% application performance improvement.',
    'The Card Co: 20% improvement in usability following a UI and '
        'user-flow revamp.',
    'RV Solutions: 10% improvement in code quality, 25% reduction '
        'in development timelines, and 15% increase in application downloads.',
    'Skyview Smart Solutions: Developed and deployed 10+ mobile apps '
        'across multiple business domains.',
  ];

  // Do not publish fabricated or unapproved testimonials.
  static const List<TestimonialItem> testimonials = [];
}

/*
class PortfolioTodo {
  // Replace with your own hosted professional headshot before publishing.
  static const String profileImage = '';

  static const String heroEyebrow = 'OPEN TO OPPORTUNITIES & COLLABORATIONS';
  static const String name = 'Devendra Maurya';

  static const String headline =
      'Building reliable mobile experiences, from idea to production.';

  static const String intro =
      'Flutter Developer with 5+ years of mobile development experience, '
      'specialising in fintech, cross-platform apps, API integrations, '
      'and scalable mobile experiences.';

  static const String location = 'Gurugram, Haryana, India';

  static const String availability =
      'Open to full-time roles, freelance projects, and collaborations';

  static const String resumeUrl =
      'https://drive.google.com/file/d/1Gwg-3VHR44nLAf0I_W2jXEPJ_mMBLkY3/view';

  static const String email = 'devendramaurya456@gmail.com';

  static const String whatsappUrl = 'https://wa.me/7897430432';

  static const String linkedinUrl =
      'https://www.linkedin.com/in/devendra-maurya-b639261aa/';

  static const String githubUrl =
      'https://github.com/devendra456';

  static const String bookingUrl = '';

  static const List<PortfolioMetric> metrics = [
    PortfolioMetric('5+', 'Years in mobile development'),
    PortfolioMetric('30+', 'Apps delivered'),
    PortfolioMetric('Android & iOS', 'Cross-platform development'),
    PortfolioMetric('Fintech', 'Domain expertise'),
  ];

  static const String aboutTitle =
      'Engineering with care, not just code.';

  static const String about =
      'I build and maintain production-ready mobile applications using '
      'Flutter and Dart. My experience spans fintech products, digital '
      'wallets, UPI integrations, bill payments, secure onboarding, '
      'API integrations, and user-focused mobile experiences. I focus '
      'on clean architecture, maintainable code, performance, and '
      'delivering reliable features in collaboration with product and '
      'engineering teams.';

  static const List<SkillGroup> skills = [
    SkillGroup('Mobile Development', [
      'Flutter',
      'Dart',
      'Android',
      'iOS',
      'Native Integrations',
    ]),
    SkillGroup('Architecture & APIs', [
      'BLoC',
      'State Management',
      'REST APIs',
      'GraphQL',
      'Repository Pattern',
    ]),
    SkillGroup('Firebase & Analytics', [
      'Firebase',
      'Cloud Functions',
      'FCM',
      'Remote Config',
      'Crashlytics',
      'Google Analytics',
    ]),
    SkillGroup('Fintech & Integrations', [
      'UPI',
      'Digital Wallets',
      'KYC Integration',
      'Card Ordering',
      'Bill Payments',
      'Payment APIs',
    ]),
    SkillGroup('Delivery & Quality', [
      'Git',
      'Performance Optimization',
      'App Store Releases',
      'Play Store Releases',
      'Debugging',
    ]),
  ];

  static const List<ServiceItem> services = [
    ServiceItem(
      'Flutter App Development',
      'Build cross-platform Android and iOS applications '
          'with maintainable architecture and polished interfaces.',
    ),
    ServiceItem(
      'Fintech Product Engineering',
      'Integrate wallet features, UPI payments, KYC workflows, '
          'card ordering, and bill payment experiences.',
    ),
    ServiceItem(
      'Mobile App Modernization',
      'Improve application performance, maintainability, '
          'reliability, and user experience.',
    ),
  ];

  static const List<ProjectItem> projects = [
    ProjectItem(
      title: 'The Card Company',
      category: 'Fintech · Flutter',
      imageUrl:
      'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d'
          '?auto=format&fit=crop&w=1200&q=85',
      summary:
      'A digital wallet experience covering payments, cards, '
          'bill payments, rewards, and family payment features.',
      role: 'Flutter Developer',
      technologies: [
        'Flutter',
        'Dart',
        'BLoC',
        'REST APIs',
        'UPI / NPCI Integration',
        'Firebase',
        'Native Integrations',
      ],
      challenge:
      'Delivering interconnected fintech journeys across '
          'onboarding, KYC, wallet creation, card ordering, '
          'payments, and bill payments.',
      outcome:
      'Contributed to KYC integration with Hyperverge, card ordering '
          'with C91, UPI integration, family payments, gifting, '
          'bill payment improvements, and customer engagement integrations.',
      androidUrl:
      'https://play.google.com/store/apps/details?id=com.fypmoney',
      iosUrl:
      'https://apps.apple.com/in/app/the-card-company/id1573905747',
    ),
    ProjectItem(
      title: 'Mera Ration App',
      category: 'Government · Mobile',
      imageUrl:
      'https://images.unsplash.com/photo-1556740738-b6a63e27c4df'
          '?auto=format&fit=crop&w=1200&q=85',
      summary:
      'A mobile application supporting access to ration-related '
          'services under the One Nation One Ration Card initiative.',
      role: 'Mobile App Developer',
      technologies: [
        'Flutter',
        'REST APIs',
        'Authentication',
        'Mobile UI',
      ],
      challenge:
      'Building mobile workflows for a public-service application '
          'with attention to accessibility, usability, and reliable API integration.',
      outcome:
      'Contributed to mobile application development and delivery '
          'for a government-service use case.',
      androidUrl:
      'https://play.google.com/store/apps/details?id=com.nic.onenationonecard',
      iosUrl:
      'https://apps.apple.com/in/app/mera-ration-app/id6621209637',
    ),
  ];

  static const List<ExperienceItem> experience = [
    ExperienceItem(
      'Dates to be confirmed',
      'The Card Company',
      'Flutter Developer',
      'Fintech product development, KYC, wallets, card ordering, '
          'UPI, family payments, gifting, and bill payment improvements.',
    ),
    ExperienceItem(
      'Dates to be confirmed',
      'RV Solutions Pvt. Ltd.',
      'Software Developer',
      'Mobile application development across projects including '
          'Mera Ration and other public-service and enterprise applications.',
    ),
  ];

  static const List<String> achievements = [
    'Received Employee of the Month recognition for delivering '
        'critical fintech features within project timelines.',
    'Received the Best Performer Award (2024) for technical '
        'excellence and project delivery.',
    'Achieved second rank in the academic branch.',
  ];

  // Add testimonials only after receiving approval from the people quoted.
  static const List<TestimonialItem> testimonials = [];
}
*/

class PortfolioMetric {
  final String value;
  final String label;
  const PortfolioMetric(this.value, this.label);
}

class SkillGroup {
  final String title;
  final List<String> skills;
  const SkillGroup(this.title, this.skills);
}

class ServiceItem {
  final String title;
  final String description;
  const ServiceItem(this.title, this.description);
}

class ProjectItem {
  final String title, category, imageUrl, summary, role, challenge, outcome, androidUrl, iosUrl;
  final List<String> technologies;
  const ProjectItem({required this.title, required this.category, required this.imageUrl, required this.summary, required this.role, required this.technologies, required this.challenge, required this.outcome, required this.androidUrl, required this.iosUrl});
}

class ExperienceItem {
  final String period, company, role, description;
  const ExperienceItem(this.period, this.company, this.role, this.description);
}

class TestimonialItem {
  final String quote, name, role;
  const TestimonialItem(this.quote, this.name, this.role);
}
