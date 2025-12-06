import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildHeader() {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage:
                      AssetImage('lib/assets/images/user_profile.png'),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Good Morning, Alex',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    Widget buildExpiringSoonSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Expiring Soon',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 16),
                ExpiringItem(
                    image: 'lib/assets/images/milk_carton.png',
                    name: 'Milk',
                    daysLeft: 2),
                SizedBox(width: 16),
                ExpiringItem(
                    image: 'lib/assets/images/lettuce.png',
                    name: 'Lettuce',
                    daysLeft: 3),
                SizedBox(width: 16),
                ExpiringItem(
                    image: 'lib/assets/images/eggs.png',
                    name: 'Eggs',
                    daysLeft: 4),
                SizedBox(width: 16),
                ExpiringItem(
                    image: 'lib/assets/images/apple.png',
                    name: 'Apple',
                    daysLeft: 5),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      );
    }

    Widget buildGroceryListCard() {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            children: [
              Image.asset('lib/assets/images/grocery_cart.png'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Grocery List',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('You have 12 items on your list.'),
                    const Text('- Milk, Bread, Eggs...'),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('View All'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget buildRecentAlerts() {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Alerts',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const AlertItem(
                icon: Icons.kitchen,
                title: 'Milk is running low',
                subtitle: 'Smart Container - 1h ago'),
            const SizedBox(height: 16),
            const AlertItem(
                icon: Icons.coffee_maker,
                title: 'Coffee refilled',
                subtitle: 'Smart Container - 3h ago'),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            buildHeader(),
            buildExpiringSoonSection(),
            buildGroceryListCard(),
            buildRecentAlerts(),
          ],
        ),
      ),
    );
  }
}

class ExpiringItem extends StatelessWidget {
  final String image;
  final String name;
  final int daysLeft;

  const ExpiringItem({
    super.key,
    required this.image,
    required this.name,
    required this.daysLeft,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, height: 120, width: 150, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text(name, style: Theme.of(context).textTheme.titleMedium),
          Text('$daysLeft days left',
              style: const TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }
}

class AlertItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const AlertItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
