import 'package:flutter/material.dart';

class CategoryItem {
  final String title;
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  CategoryItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.backgroundColor,
  });
}

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryItem> categories = [
      CategoryItem(
        title: 'Health',
        icon: Icons.favorite,
        color: Colors.blue,
        backgroundColor: Colors.blue.withOpacity(0.1),
      ),
      CategoryItem(
        title: 'Work',
        icon: Icons.work,
        color: Colors.green,
        backgroundColor: Colors.green.withOpacity(0.1),
      ),
      CategoryItem(
        title: 'Personal',
        icon: Icons.person,
        color: Colors.purple,
        backgroundColor: Colors.purple.withOpacity(0.1),
      ),
      CategoryItem(
        title: 'Others',
        icon: Icons.more_horiz,
        color: Colors.orange,
        backgroundColor: Colors.orange.withOpacity(0.1),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: categories[index].backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(
                  categories[index].icon,
                  color: categories[index].color,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  categories[index].title,
                  style: TextStyle(
                    color: categories[index].color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}