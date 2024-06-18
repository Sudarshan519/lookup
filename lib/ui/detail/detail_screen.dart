import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lookup/features/favourites/presentation/favourites_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.image, required this.tag})
      : super(key: key);

  final String image;
  final String tag;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // Method to handle adding or removing favorite
  void updateFavourite(FavoritesProvider provider) async {
    await provider.addOrRemoveFavourite(widget.image);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(!provider.isFavourite(widget.image)
            ? "Image removed from favourite"
            : "Image added to favourites")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Detail Page"),
        actions: [
          Consumer<FavoritesProvider>(
            builder: (context, provider, _) => InkWell(
              onTap: () {
                updateFavourite(provider);
              },
              child: Icon(
                provider.isFavourite(widget.image)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            ),
          ),
        ],
      ),
      body: Hero(
        tag: widget.tag,
        child: Container(
          color: Colors.black,
          child: CachedNetworkImage(imageUrl: widget.image),
        ),
      ),
    );
  }
}
