import 'package:flutter/material.dart';
import 'package:smart_pantry_app/screens/item_detail_screen.dart';

class PantryScreen extends StatelessWidget {
  const PantryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildHeader(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Pantry',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
      );
    }

    Widget buildSearchBar() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search pantry by name...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
          ),
        ),
      );
    }

    Widget buildFilterChips() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              SizedBox(width: 16),
              FilterChip(label: Text('Expiring Soon'), onSelected: print),
              SizedBox(width: 8),
              FilterChip(label: Text('Produce'), onSelected: print),
              SizedBox(width: 8),
              FilterChip(label: Text('Dairy'), onSelected: print),
              SizedBox(width: 8),
              FilterChip(label: Text('Grains'), onSelected: print),
              SizedBox(width: 8),
              FilterChip(label: Text('Meats'), onSelected: print),
              SizedBox(width: 16),
            ],
          ),
        ),
      );
    }

    Widget buildPantryList() {
      return Column(
        children: const [
          PantryItem(
            image: 'lib/assets/images/avocados.png',
            name: 'Avocados',
            quantity: '2 remaining',
            expiry: 'Expires in 1 day',
            statusColor: Colors.red,
          ),
          PantryItem(
            image: 'lib/assets/images/organic_milk.png',
            name: 'Organic Milk',
            quantity: '1/2 gallon remaining',
            expiry: 'Expires in 3 days',
            statusColor: Colors.orange,
          ),
          PantryItem(
            image: 'lib/assets/images/free_range_eggs.png',
            name: 'Free-Range Eggs',
            quantity: '10 remaining',
            expiry: 'Expires in 12 days',
            statusColor: Colors.green,
          ),
          PantryItem(
            image: 'lib/assets/images/sourdough_bread.png',
            name: 'Sourdough Bread',
            quantity: '1 loaf remaining',
            expiry: 'Expires in 6 days',
            statusColor: Colors.green,
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            buildHeader(context),
            buildSearchBar(),
            buildFilterChips(),
            buildPantryList(),
          ],
        ),
      ),
    );
  }
}

class PantryItem extends StatelessWidget {
  final String image;
  final String name;
  final String quantity;
  final String expiry;
  final Color statusColor;

  const PantryItem({
    super.key,
    required this.image,
    required this.name,
    required this.quantity,
    required this.expiry,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ItemDetailScreen()),
        );
      },
      child: Card(
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
                    Text(quantity,
                        style: Theme.of(context).textTheme.bodyMedium),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(expiry, style: TextStyle(color: statusColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
