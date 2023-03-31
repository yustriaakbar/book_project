import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/provider/favorite_provider.dart';
import 'package:mini_project/screens/favorite.dart';
import 'package:mini_project/screens/detail.dart';
import 'package:mini_project/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/models/popular_book.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(6).toList();
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book App'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: populars.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                      popularBookModel: populars[index]),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 19),
              height: 86,
              width: MediaQuery.of(context).size.width - 50,
              color: kBackgroundColor,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 81,
                    width: 62,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(populars[index].image),
                        ),
                        color: kMainColor),
                  ),
                  const SizedBox(
                    width: 21,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        populars[index].title,
                        style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kBlackColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        populars[index].author,
                        style: GoogleFonts.openSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: kGreyColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      IconButton(
                        onPressed: () {
                          provider.toggleFavorite(word);
                        },
                        icon: provider.isExist(word)
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(Icons.favorite_border),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final route = MaterialPageRoute(
            builder: (context) => const FavoritePage(),
          );
          Navigator.push(context, route);
        },
        label: const Text('Favorites'),
      ),
    );
  }
}