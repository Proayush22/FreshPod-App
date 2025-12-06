import 'package:flutter/material.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildAddItemField() {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Add item (e.g., milk, eggs)',
            suffixIcon: IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: () {},
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
          ),
        ),
      );
    }

    Widget buildSuggestedForYou() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Suggested for You',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 16),
                SuggestedItem(
                  image: 'lib/assets/images/olive_oil.png',
                  name: 'Olive Oil',
                  reason: 'Low in Pantry',
                ),
                SizedBox(width: 16),
                SuggestedItem(
                  image: 'lib/assets/images/milk_carton.png',
                  name: 'Milk',
                  reason: 'Running Low',
                ),
                SizedBox(width: 16),
                SuggestedItem(
                  image: 'lib/assets/images/sourdough_bread.png',
                  name: 'Bread',
                  reason: 'Pantry Empty',
                ),
                SizedBox(width: 16),
                SuggestedItem(
                  image: 'lib/assets/images/bananas.png',
                  name: 'Bananas',
                  reason: 'Low in Pantry',
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      );
    }

    Widget buildMyList() {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My List',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const GroceryListItem(name: 'Apples, 2 lbs'),
            const GroceryListItem(name: 'Chicken Breast'),
            const GroceryListItem(name: 'Cereal'),
            const GroceryListItem(name: 'Yogurt', checked: true),
            const GroceryListItem(name: 'Olive Oil', checked: true),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          buildAddItemField(),
          buildSuggestedForYou(),
          buildMyList(),
        ],
      ),
    );
  }
}

class SuggestedItem extends StatelessWidget {
  final String image;
  final String name;
  final String reason;

  const SuggestedItem({
    super.key,
    required this.image,
    required this.name,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        child: Column(
          children: [
            Image.asset(image, height: 120, width: 160, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(name, style: Theme.of(context).textTheme.titleMedium),
                  Text(reason, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroceryListItem extends StatelessWidget {
  final String name;
  final bool checked;

  const GroceryListItem({
    super.key,
    required this.name,
    this.checked = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: checked,
        onChanged: (value) {},
      ),
      title: Text(
        name,
        style: TextStyle(
          decoration: checked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}
