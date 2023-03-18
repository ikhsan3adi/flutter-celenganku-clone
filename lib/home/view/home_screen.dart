import 'package:celenganku_app_clone/achieved/achieved.dart';
import 'package:celenganku_app_clone/on_going/on_going.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: theme.textTheme.bodyLarge!.color,
        title: const Text("Celenganku"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.brightness_medium),
          ),
          PopupMenuButton(
            itemBuilder: (ctx) => [
              PopupMenuItem(
                onTap: () {},
                child: const Text("Beri Nilai Aplikasi"),
              )
            ],
          )
        ],
        bottom: TabBar(
          labelColor: theme.colorScheme.primary,
          indicatorColor: theme.colorScheme.primary,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 48),
          indicatorWeight: 3,
          controller: _tabController,
          tabs: const [
            Tab(text: 'Berlangsung'),
            Tab(text: 'Tercapai'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          OnGoingPage(),
          AchievedPage(),
        ],
      ),
    );
  }
}
