import 'package:flutter/material.dart';
import 'package:mini_project/provider/favorite_provider.dart';
import 'package:mini_project/screens/favorite.dart';
import 'package:mini_project/screens/detail.dart';
import 'package:mini_project/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/models/popular_book.dart';
import 'package:mini_project/models/new_book.dart';
import 'package:mini_project/models/trending_book.dart';
import 'package:mini_project/models/best_book.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_project/widgets/custom_tab_indicator.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}
class _ListItemState extends State<ListItem> {
  final List<PopularBookModel> popularBookData = [
    PopularBookModel(
      title: 'You’re A Miracle',
      author: 'Mike McHargue',
      price: '100.000',
      image:'assets/images/img_popular_book1.png',
      color:0xFFFFD3B6,
      pages: 144,
      publisher: 'Gramedia Pustaka Utama',
      dateIssue: '1 Mar 2023',
      weight: '0.11',
      isbn: '9786230309117',
      width: 13,
      language: 'inggris',
      length: 18,
      description: 'Holding brain science in one hand and rich emotional presence in the other, this book feels timely and necessary.”—Shauna Niequist, New York Times bestselling author of Present Over Perfect\n\nWhy is there such a gap between what you want to do and what you actually do? The host of Ask Science Mike explains why our desires and our real lives are so wildly different—and what you can do to close the gap.\n\nFor thousands of years, scientists, philosophers, and self-help gurus have wrestled with one of the basic conundrums of human life: Why do we do the things we do? Or, rather, why do we so often not do the things we want to do?',
    ),
    PopularBookModel(
        title: 'Pattern Maker',
        author: 'Kerry Johnston',
        price: '120.000',
        image:'assets/images/img_popular_book2.png',
        color:0xFF2B325C,
        pages: 231,
        publisher: 'Gagas Media',
        dateIssue: '2 Mar 2023',
        weight: '0.11',
        isbn: '9786230309169',
        width: 13,
        language: 'inggris',
        length: 18,
        description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text.\n\nAll the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.'
    ),
    PopularBookModel(
        title: 'Pa/percra/f',
        author: 'Mike Brown',
        price: '150.000',
        image:'assets/images/img_popular_book3.png',
        color:0xFFF7EA4A,
        pages: 154,
        publisher: 'Bentang Pustaka',
        dateIssue: '7 Mar 2023',
        weight: '0.11',
        isbn: '9786230309182',
        width: 13,
        language: 'inggris',
        length: 18,
        description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 25, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Discover Latest Book',
                        style: GoogleFonts.openSans(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: kBlackColor),
                      ),
                    ],
                  )),
              Container(
                height: 39,
                margin: const EdgeInsets.only(left: 25, right: 25, top: 18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kLightGreyColor),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      // maxLengthEnforced: true,
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          color: kBlackColor,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.only(left: 19, right: 50, bottom: 8),
                          border: InputBorder.none,
                          hintText: 'Search book..',
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              color: kGreyColor,
                              fontWeight: FontWeight.w600)),
                    ),
                    Positioned(
                      right: 0,
                      child: SvgPicture.asset('assets/svg/background_search.svg'),
                    ),
                    Positioned(
                      top: 8,
                      right: 9,
                      child:
                      SvgPicture.asset('assets/icons/icon_search_white.svg'),
                    )
                  ],
                ),
              ),
              Container(
                height: 280,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(left: 25),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TabBar(
                          labelPadding: const EdgeInsets.all(0),
                          indicatorPadding: const EdgeInsets.all(0),
                          isScrollable: true,
                          labelColor: kBlackColor,
                          unselectedLabelColor: kGreyColor,
                          labelStyle: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.w700),
                          unselectedLabelStyle: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          indicator: RoundedRectangleTabIndicator(
                              weight: 2, width: 10, color: kBlackColor),
                          tabs: [
                            Tab(
                              child: Container(
                                margin: const EdgeInsets.only(right: 23),
                                child: const Text('New'),
                              ),
                            ),
                            Tab(
                              child: Container(
                                margin: const EdgeInsets.only(right: 23),
                                child: const Text('Trending'),
                              ),
                            ),
                            Tab(
                              child: Container(
                                margin: const EdgeInsets.only(right: 23),
                                child: const Text('Best Seller'),
                              ),
                            )
                          ]),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 21),
                              height: 150,
                              child: ListView.builder(
                                  padding: const EdgeInsets.only(right: 6),
                                  itemCount: newBookData.length,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final NewBookModel newbook = newBookData[index];
                                    return Container(
                                      margin: const EdgeInsets.only(right: 19),
                                      height: 150,
                                      width: 153,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: kMainColor,
                                          image: DecorationImage(
                                            image: AssetImage(newbook.image),
                                          )),
                                    );
                                  }),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 21),
                              height: 210,
                              child: ListView.builder(
                                  padding: const EdgeInsets.only(right: 6),
                                  itemCount: trendingBookData.length,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final TrendingBookModel trendingbook = trendingBookData[index];
                                    return Container(
                                      margin: const EdgeInsets.only(right: 19),
                                      height: 210,
                                      width: 153,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: kMainColor,
                                          image: DecorationImage(
                                            image: AssetImage(trendingbook.image),
                                          )),
                                    );
                                  }),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 21),
                              height: 210,
                              child: ListView.builder(
                                  padding: const EdgeInsets.only(right: 6),
                                  itemCount: bestBookData.length,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final BestBookModel bestbook = bestBookData[index];
                                    return Container(
                                      margin: const EdgeInsets.only(right: 19),
                                      height: 210,
                                      width: 153,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: kMainColor,
                                          image: DecorationImage(
                                            image: AssetImage(bestbook.image),
                                          )),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: Text(
                  'Popular',
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kBlackColor),
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: popularBookData.length,
                itemBuilder: (context, index) {
                  final PopularBookModel book = popularBookData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                              popularBookModel: book),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 19),
                      height: 81,
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
                                  image: AssetImage(book.image),
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
                                book.title,
                                style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: kBlackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                book.author,
                                style: GoogleFonts.openSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: kGreyColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\Rp. ' + book.price,
                                style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kBlackColor),
                              )
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              provider.toggleFavorite(book);
                            },
                            icon: provider.isExist(book)
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     final route = MaterialPageRoute(
      //         builder: (context) {
      //           return Consumer<FavoriteProvider>(
      //             builder: (context, FavoriteProvider data, widget) {
      //               return FavoritePage(
      //                   popularBookData: data.favoriteBookList);
      //             },
      //           );
      //         });
      //     Navigator.push(context, route);
      //   },
      //   label: const Text('Favorites'),
      // ),
    );
  }
}
