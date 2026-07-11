import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/statics/portfolio_todo.dart';
import '../../app/theme/bloc/theme_bloc/theme_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _scrollController = ScrollController();
  final _keys = <String, GlobalKey>{
    for (final section in ['about', 'projects', 'experience', 'contact']) section: GlobalKey(),
  };
  bool _showTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final show = _scrollController.offset > 420;
      if (show != _showTopButton) setState(() => _showTopButton = show);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _goTo(String section) {
    final context = _keys[section]?.currentContext;
    if (context != null) Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 650), curve: Curves.easeOutCubic);
  }

  Future<void> _open(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication) && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Unable to open this link.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 760;
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            _navigation(compact),
            SliverToBoxAdapter(child: _Hero(onProjects: () => _goTo('projects'), onContact: () => _goTo('contact'), onResume: () => _open(PortfolioTodo.resumeUrl))),
            SliverToBoxAdapter(child: _Section(key: _keys['about'], child: _About())),
            SliverToBoxAdapter(child: _Section(child: _Services())),
            SliverToBoxAdapter(child: _Section(key: _keys['projects'], child: _Projects(onOpen: _projectSheet))),
            SliverToBoxAdapter(child: _Section(key: _keys['experience'], child: _Experience())),
            SliverToBoxAdapter(child: _Section(child: _Achievements())),
            SliverToBoxAdapter(child: _Section(child: _Testimonials())),
            SliverToBoxAdapter(child: _Section(key: _keys['contact'], child: _Contact(onOpen: _open))),
            const SliverToBoxAdapter(child: _Footer()),
          ],
        ),
        if (_showTopButton) Positioned(right: 20, bottom: 20, child: FloatingActionButton.small(onPressed: () => _scrollController.animateTo(0, duration: const Duration(milliseconds: 600), curve: Curves.easeOutCubic), child: const Icon(Icons.arrow_upward_rounded))),
      ]),
    );
  }

  Widget _navigation(bool compact) => SliverAppBar(
    pinned: true,
    elevation: 0,
    title: Text(PortfolioTodo.name, style: const TextStyle(fontWeight: FontWeight.w800)),
    actions: [
      if (!compact) ...['About', 'Projects', 'Experience', 'Contact'].map((title) => TextButton(onPressed: () => _goTo(title.toLowerCase()), child: Text(title))),
      _ThemeToggle(),
      if (compact) PopupMenuButton<String>(onSelected: _goTo, itemBuilder: (_) => const [PopupMenuItem(value: 'about', child: Text('About')), PopupMenuItem(value: 'projects', child: Text('Projects')), PopupMenuItem(value: 'experience', child: Text('Experience')), PopupMenuItem(value: 'contact', child: Text('Contact'))]),
      const SizedBox(width: 8),
    ],
  );

  void _projectSheet(ProjectItem project) => showModalBottomSheet<void>(context: context, isScrollControlled: true, showDragHandle: true, builder: (_) => _ProjectDetails(project: project, onOpen: _open));
}

class _Section extends StatelessWidget {
  final Widget child;
  const _Section({super.key, required this.child});
  @override
  Widget build(BuildContext context) => Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 1160), child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 44), child: _Reveal(child: child))));
}

class _Hero extends StatelessWidget {
  final VoidCallback onProjects, onContact, onResume;
  const _Hero({required this.onProjects, required this.onContact, required this.onResume});
  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 760;
    final color = Theme.of(context).colorScheme.primary;
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [color.withOpacity(.16), Theme.of(context).scaffoldBackgroundColor], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 1160), child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 70, 24, 58),
        child: Flex(direction: compact ? Axis.vertical : Axis.horizontal, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Flexible(flex: compact ? 1 : 6, fit: compact ? FlexFit.loose : FlexFit.tight, child: _Reveal(delay: 0, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _Pill(label: PortfolioTodo.heroEyebrow),
            const SizedBox(height: 22),
            Text(PortfolioTodo.headline, style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900, height: 1.05)),
            const SizedBox(height: 18),
            Text(PortfolioTodo.intro, style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.55)),
            const SizedBox(height: 28),
            Wrap(spacing: 12, runSpacing: 12, children: [FilledButton.icon(onPressed: onProjects, icon: const Icon(Icons.grid_view_rounded), label: const Text('View projects')), OutlinedButton.icon(onPressed: onContact, icon: const Icon(Icons.mail_outline_rounded), label: const Text('Contact me')), TextButton.icon(onPressed: onResume, icon: const Icon(Icons.download_rounded), label: const Text('Résumé'))]),
            const SizedBox(height: 25),
            Row(children: [Icon(Icons.location_on_outlined, size: 18, color: color), const SizedBox(width: 6), Text(PortfolioTodo.location)]),
          ]))),
          SizedBox(width: compact ? 0 : 62, height: compact ? 40 : 0),
          _Reveal(delay: 120, child: SizedBox(width: compact ? 180 : 310, child: AspectRatio(aspectRatio: .86, child: ClipRRect(borderRadius: BorderRadius.circular(32), child: Image.network(PortfolioTodo.profileImage, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const ColoredBox(color: Color(0xFF202938), child: Icon(Icons.person_rounded, size: 96))))))),
        ]),
      ))),
    );
  }
}

class _About extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    _Heading('About & expertise', PortfolioTodo.aboutTitle),
    const SizedBox(height: 14), Text(PortfolioTodo.about, style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.6)),
    const SizedBox(height: 30),
    LayoutBuilder(builder: (context, constraints) => Wrap(spacing: 14, runSpacing: 14, children: PortfolioTodo.metrics.map((metric) => SizedBox(width: constraints.maxWidth > 700 ? (constraints.maxWidth - 42) / 4 : (constraints.maxWidth - 14) / 2, child: _MetricCard(metric))).toList())),
    const SizedBox(height: 32),
    Wrap(spacing: 18, runSpacing: 18, children: PortfolioTodo.skills.map((group) => SizedBox(width: 260, child: _SkillCard(group))).toList()),
  ]);
}

class _MetricCard extends StatelessWidget { final PortfolioMetric metric; const _MetricCard(this.metric); @override Widget build(BuildContext context) => Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(metric.value, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.primary)), const SizedBox(height: 6), Text(metric.label)]))); }
class _SkillCard extends StatelessWidget { final SkillGroup group; const _SkillCard(this.group); @override Widget build(BuildContext context) => Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(group.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)), const SizedBox(height: 13), Wrap(spacing: 7, runSpacing: 7, children: group.skills.map((skill) => Chip(label: Text(skill))).toList())]))); }

class _Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Heading('How I can help', 'Practical mobile engineering for ambitious products.'),
          const SizedBox(height: 24),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: PortfolioTodo.services.map((service) => SizedBox(
              width: 340,
              child: Card(child: Padding(padding: const EdgeInsets.all(22), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(Icons.auto_awesome_rounded, color: Theme.of(context).colorScheme.primary), const SizedBox(height: 16), Text(service.title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)), const SizedBox(height: 8), Text(service.description, style: const TextStyle(height: 1.5))]))),
            )).toList(),
          ),
        ],
      );
}

class _Projects extends StatelessWidget { final ValueChanged<ProjectItem> onOpen; const _Projects({required this.onOpen}); @override Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_Heading('Selected work', 'Products, systems, and user journeys I helped bring to life.'), const SizedBox(height: 24), LayoutBuilder(builder: (context, constraints) => Wrap(spacing: 20, runSpacing: 20, children: PortfolioTodo.projects.map((project) => SizedBox(width: constraints.maxWidth > 750 ? (constraints.maxWidth - 20) / 2 : constraints.maxWidth, child: _ProjectCard(project: project, onOpen: () => onOpen(project)))).toList()))]); }
class _ProjectCard extends StatelessWidget { final ProjectItem project; final VoidCallback onOpen; const _ProjectCard({required this.project, required this.onOpen}); @override Widget build(BuildContext context) => Card(clipBehavior: Clip.antiAlias, child: InkWell(onTap: onOpen, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [AspectRatio(aspectRatio: 1.75, child: Image.network(project.imageUrl, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const ColoredBox(color: Color(0xFF202938)))), Padding(padding: const EdgeInsets.all(22), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_Pill(label: project.category), const SizedBox(height: 14), Text(project.title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)), const SizedBox(height: 9), Text(project.summary, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(height: 1.5)), const SizedBox(height: 14), const Row(children: [Text('View case study'), SizedBox(width: 6), Icon(Icons.arrow_forward_rounded, size: 18)])]))]))); }

class _Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    _Heading('Career timeline', 'A progression through product delivery, mobile engineering, and fintech.'),
    const SizedBox(height: 22),
    ...PortfolioTodo.experience.map((item) => Padding(padding: const EdgeInsets.only(bottom: 16), child: Card(child: Padding(padding: const EdgeInsets.all(20), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(Icons.work_outline_rounded, color: Theme.of(context).colorScheme.primary), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(item.period, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w700)), Text(item.role, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)), Text(item.company, style: Theme.of(context).textTheme.titleSmall), const SizedBox(height: 8), Text(item.description, style: const TextStyle(height: 1.45))]))]))))),
  ]);
}

class _Achievements extends StatelessWidget { @override Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_Heading('Highlights', 'The proof points that deserve a closer look.'), const SizedBox(height: 18), ...PortfolioTodo.achievements.map((achievement) => ListTile(leading: Icon(Icons.verified_rounded, color: Theme.of(context).colorScheme.primary), title: Text(achievement)))]); }
class _Testimonials extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    _Heading('Words from collaborators', 'Add approved feedback here to make the work more credible.'),
    const SizedBox(height: 20),
    Wrap(spacing: 18, runSpacing: 18, children: PortfolioTodo.testimonials.map((item) => SizedBox(width: 440, child: Card(child: Padding(padding: const EdgeInsets.all(22), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Icon(Icons.format_quote_rounded, size: 34), Text(item.quote, style: const TextStyle(height: 1.55, fontStyle: FontStyle.italic)), const SizedBox(height: 16), Text(item.name, style: const TextStyle(fontWeight: FontWeight.w800)), Text(item.role)]))))).toList()),
  ]);
}

class _Contact extends StatelessWidget { final ValueChanged<String> onOpen; const _Contact({required this.onOpen}); @override Widget build(BuildContext context) => Card(color: Theme.of(context).colorScheme.primaryContainer, child: Padding(padding: const EdgeInsets.all(30), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_Heading('Let’s build something useful.', 'Tell me what you are working on, and I’ll get back within 12–24 hours.'), const SizedBox(height: 20), Wrap(spacing: 12, runSpacing: 12, children: [FilledButton.icon(onPressed: () => onOpen('mailto:${PortfolioTodo.email}'), icon: const Icon(Icons.email_outlined), label: const Text('Email me')), OutlinedButton.icon(onPressed: () => onOpen(PortfolioTodo.whatsappUrl), icon: const Icon(Icons.chat_bubble_outline_rounded), label: const Text('WhatsApp')), if (PortfolioTodo.bookingUrl.isNotEmpty) OutlinedButton.icon(onPressed: () => onOpen(PortfolioTodo.bookingUrl), icon: const Icon(Icons.calendar_month_outlined), label: const Text('Book a call'))])]))); }
class _Footer extends StatelessWidget { const _Footer(); @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.all(28), child: Center(child: Text('© ${DateTime.now().year} ${PortfolioTodo.name} · Built with Flutter'))); }
class _Heading extends StatelessWidget { final String eyebrow, title; const _Heading(this.eyebrow, this.title); @override Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(eyebrow.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.3, color: Theme.of(context).colorScheme.primary)), const SizedBox(height: 8), Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900, height: 1.15))]); }
class _Pill extends StatelessWidget { final String label; const _Pill({required this.label}); @override Widget build(BuildContext context) => DecoratedBox(decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary.withOpacity(.12), borderRadius: BorderRadius.circular(30)), child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), child: Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Theme.of(context).colorScheme.primary)))); }
class _Reveal extends StatelessWidget { final Widget child; final int delay; const _Reveal({required this.child, this.delay = 0}); @override Widget build(BuildContext context) => TweenAnimationBuilder<double>(duration: Duration(milliseconds: 500 + delay), curve: Curves.easeOutCubic, tween: Tween(begin: 0, end: 1), child: child, builder: (_, value, child) => Opacity(opacity: value, child: Transform.translate(offset: Offset(0, 20 * (1 - value)), child: child))); }
class _ThemeToggle extends StatelessWidget { @override Widget build(BuildContext context) => BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) { final dark = state is ThemeSuccess && state.themeMode == ThemeMode.dark; return IconButton(tooltip: dark ? 'Use light theme' : 'Use dark theme', onPressed: () => context.read<ThemeBloc>().add(ThemeLoadEvent(brightness: dark ? Brightness.light : Brightness.dark)), icon: Icon(dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined)); }); }
class _ProjectDetails extends StatelessWidget {
  final ProjectItem project;
  final ValueChanged<String> onOpen;
  const _ProjectDetails({required this.project, required this.onOpen});
  @override
  Widget build(BuildContext context) => SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(24, 8, 24, 32), child: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_Pill(label: project.category), const SizedBox(height: 14), Text(project.title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900)), const SizedBox(height: 14), Text(project.summary, style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.5)), const SizedBox(height: 22), _DetailBlock('My role', project.role), _DetailBlock('Technology', project.technologies.join(' · ')), _DetailBlock('Challenge', project.challenge), _DetailBlock('Outcome', project.outcome), const SizedBox(height: 18), Wrap(spacing: 10, runSpacing: 10, children: [OutlinedButton.icon(onPressed: () => onOpen(project.androidUrl), icon: const Icon(Icons.android_rounded), label: const Text('Google Play')), OutlinedButton.icon(onPressed: () => onOpen(project.iosUrl), icon: const Icon(Icons.apple_rounded), label: const Text('App Store'))])]))));
}
class _DetailBlock extends StatelessWidget { final String title, value; const _DetailBlock(this.title, this.value); @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w900)), const SizedBox(height: 5), Text(value, style: const TextStyle(height: 1.45))])); }
