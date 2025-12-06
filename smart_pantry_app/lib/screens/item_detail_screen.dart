import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.asset('lib/assets/images/organic_milk.png', height: 300, fit: BoxFit.cover),
          _buildItemInfo(context),
          _buildSpoilageTimeline(),
          _buildActionButtons(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Mark as Used'),
        ),
      ),
    );
  }

  Widget _buildItemInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Organic Milk',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Chip(label: Text('Dairy')),
        ],
      ),
    );
  }

  Widget _buildSpoilageTimeline() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Spoilage Timeline'),
              Text('Expires in 3 days'),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.75,
            backgroundColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildQuantityControl(),
          const SizedBox(height: 16),
          const ListTile(
            title: Text('Date Added'),
            trailing: Text('June 18, 2024'),
          ),
          const ListTile(
            title: Text('Expiration Date'),
            trailing: Text('June 24, 2024'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControl() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Quantity'),
            Row(
              children: [
                IconButton(icon: const Icon(Icons.remove), onPressed: () {}),
                const Text('1'),
                IconButton(icon: const Icon(Icons.add), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
