/// PORTFOLIO TODO — replace only the values in this file as your final
/// content and assets are ready. Every image URL below is deliberately a
/// temporary network placeholder.
class PortfolioTodo {
  // TODO: Replace this with a professional headshot or transparent PNG URL.
  static const String profileImage =
      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=900&q=85';
  static const String heroEyebrow = 'AVAILABLE FOR SELECT OPPORTUNITIES';
  static const String name = 'Devendra Maurya';
  static const String headline = 'I build reliable mobile experiences that people trust.';
  static const String intro =
      'Senior mobile developer specialising in Flutter, Android, iOS, fintech, and high-impact product delivery.';
  static const String location = 'Gurugram, Haryana, India';
  static const String availability = 'Open to freelance and product collaborations';
  static const String resumeUrl =
      'https://drive.google.com/file/d/1Gwg-3VHR44nLAf0I_W2jXEPJ_mMBLkY3/view';
  static const String email = 'devendramaurya456@gmail.com';
  static const String whatsappUrl = 'https://wa.me/7897430432';
  static const String linkedinUrl =
      'https://www.linkedin.com/in/devendra-maurya-b639261aa/';
  static const String githubUrl = 'https://github.com/devendra456';
  // TODO: Add a scheduling link when you are ready, or leave it empty.
  static const String bookingUrl = '';

  static const List<PortfolioMetric> metrics = [
    PortfolioMetric('4+', 'Years building products'),
    PortfolioMetric('30+', 'Apps delivered'),
    PortfolioMetric('2', 'Platforms: Android & iOS'),
    PortfolioMetric('12–24h', 'Typical reply time'),
  ];

  static const String aboutTitle = 'Engineering with care, not just code.';
  static const String about =
      'I turn product ideas into polished, maintainable mobile apps. My work spans discovery, UI implementation, API integration, app-store delivery, and ongoing product improvement.';
  static const List<SkillGroup> skills = [
    SkillGroup('Mobile', ['Flutter', 'Dart', 'Android', 'iOS']),
    SkillGroup('Architecture', ['BLoC', 'REST APIs', 'Firebase', 'State management']),
    SkillGroup('Payments & security', ['UPI', 'Wallets', 'Encryption', 'Risk monitoring']),
    SkillGroup('Delivery', ['Git', 'Play Store', 'App Store', 'Client collaboration']),
  ];
  static const List<ServiceItem> services = [
    ServiceItem('Mobile product delivery', 'From idea to a production-ready Flutter app.'),
    ServiceItem('Fintech integrations', 'Payments, wallets, secure APIs, and careful user journeys.'),
    ServiceItem('App modernisation', 'Improve reliability, performance, UX, and maintainability.'),
  ];

  static const List<ProjectItem> projects = [
    ProjectItem(
      title: 'The Card Company',
      category: 'Fintech · Flutter',
      imageUrl:
          'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=1200&q=85',
      summary: 'A premium digital wallet for spending, bills, rewards, and family money management.',
      role: 'Senior Software Developer',
      technologies: ['Flutter', 'BLoC', 'UPI', 'Remote Config', 'Native integrations'],
      challenge: 'TODO: Explain the hardest product or technical challenge you solved.',
      outcome: 'TODO: Add a measurable impact, launch milestone, or product outcome.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.fypmoney',
      iosUrl: 'https://apps.apple.com/in/app/the-card-company/id1573905747',
    ),
    ProjectItem(
      title: 'Mera Ration App',
      category: 'Government · Android & iOS',
      imageUrl:
          'https://images.unsplash.com/photo-1556740738-b6a63e27c4df?auto=format&fit=crop&w=1200&q=85',
      summary: 'A portable ration-distribution experience supporting the One Nation One Ration Card initiative.',
      role: 'Mobile App Developer',
      technologies: ['Flutter', 'Secure APIs', 'Aadhaar authentication', 'MPIN'],
      challenge: 'TODO: Describe a delivery, security, or accessibility challenge.',
      outcome: 'TODO: Add an outcome or scale metric that can be shared publicly.',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.nic.onenationonecard',
      iosUrl: 'https://apps.apple.com/in/app/mera-ration-app/id6621209637',
    ),
  ];

  static const List<ExperienceItem> experience = [
    ExperienceItem('2025 — Present', 'The Card Company', 'Senior Software Developer', 'Fintech, cards, wallets, UPI, performance, and security.'),
    ExperienceItem('2023 — 2025', 'RV Solution Pvt. Ltd.', 'Software Developer', 'Flutter, Android, iOS, delivery, and team coordination.'),
    ExperienceItem('2021 — 2023', 'Skyview Smart Solutions', 'Mobile App Developer', 'Flutter, Firebase, REST APIs, and client-facing delivery.'),
  ];

  static const List<String> achievements = [
    'TODO: Add a launch, award, or scale achievement.',
    'TODO: Add a measurable technical or delivery achievement.',
    'TODO: Add a certification, open-source contribution, or client outcome.',
  ];

  static const List<TestimonialItem> testimonials = [
    TestimonialItem('TODO: Add a short, approved client or manager quote.', 'Client / Manager name', 'Role · Company'),
    TestimonialItem('TODO: Add another approved quote focused on collaboration or quality.', 'Client / Manager name', 'Role · Company'),
  ];
}

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
