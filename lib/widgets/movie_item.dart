import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.name,
    required this.directorName,
    required this.posterUrl,
    required this.onDeleteTap,
  });

  final String name;
  final String directorName;
  final String? posterUrl;
  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(12.0),
          leading: posterUrl != null
              ? Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        posterUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const Icon(
                  Icons.movie,
                  size: 70,
                ),
          onTap: () {},
          trailing: IconButton(
            onPressed: onDeleteTap,
            icon: const Icon(Icons.delete),
          ),
          title: Text(name),
          subtitle: Text(directorName),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
