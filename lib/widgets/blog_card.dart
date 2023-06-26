import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.title,
    required this.desc,
    required this.author,
    required this.press,
    required this.upvotes,
    this.image = '',
  });
  //required this.slug});

  final String image, title, desc, author, upvotes;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        color: Theme.of(context).cardTheme.color,
        surfaceTintColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image.isNotEmpty)
              Container(child: Image.network(image, fit: BoxFit.contain)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 23)),
                  const SizedBox(height: 10),
                  Text(
                    desc.length > 100
                        ? '${desc.substring(0, 100)}...'
                        : '$desc',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading:
                        CircleAvatar(radius: 20, child: Icon(Icons.person)),
                    title: Text(author,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                    trailing: Column(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          size: 20,
                        ),
                        Text(upvotes),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
