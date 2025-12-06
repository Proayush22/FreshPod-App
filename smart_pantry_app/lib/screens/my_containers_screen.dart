import 'package:flutter/material.dart';

class MyContainersScreen extends StatelessWidget {
  const MyContainersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Containers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: const [
          ContainerItem(
            image: 'lib/assets/images/raw_chicken.png',
            name: 'Likely Chicken',
            lastUpdated: 'Last Updated 3 hours ago',
          ),
          ContainerItem(
            image: 'lib/assets/images/ground_beef.png',
            name: 'Likely Beef',
            lastUpdated: 'Last Updated 1 hour ago',
          ),
          ContainerItem(
            image: 'lib/assets/images/salmon_fillets.png',
            name: 'Likely Salmon',
            lastUpdated: 'Last Updated 4 hours ago',
          ),
          ContainerItem(
            image: 'lib/assets/images/pork_chops.png',
            name: 'Likely Pork',
            lastUpdated: 'Last Updated 2 hours ago',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ContainerItem extends StatelessWidget {
  final String image;
  final String name;
  final String lastUpdated;

  const ContainerItem({
    super.key,
    required this.image,
    required this.name,
    required this.lastUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.titleLarge),
                  Text(lastUpdated, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
