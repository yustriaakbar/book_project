import 'package:flutter/material.dart';
import 'package:mini_project/provider/favorite_provider.dart';
import 'package:mini_project/screens/favorite.dart';
import 'package:mini_project/screens/detail.dart';
import 'package:mini_project/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/models/popular_book.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<HomePage> {
  final List<PopularBookModel> popularBookData = [
    PopularBookModel(
      title: 'You’re A Miracle',
      author: 'Mike McHargue',
      price: '20',
      image:'assets/images/img_popular_book1.png',
      color:0xFFFFD3B6,
      description: 'Holding brain science in one hand and rich emotional presence in the other, this book feels timely and necessary.”—Shauna Niequist, New York Times bestselling author of Present Over Perfect\n\nWhy is there such a gap between what you want to do and what you actually do? The host of Ask Science Mike explains why our desires and our real lives are so wildly different—and what you can do to close the gap.\n\nFor thousands of years, scientists, philosophers, and self-help gurus have wrestled with one of the basic conundrums of human life: Why do we do the things we do? Or, rather, why do we so often not do the things we want to do? As a podcast host whose voice goes out to millions each month, Mike McHargue gets countless emails from people seeking to understand their own misbehavior—why we binge on Netflix when we know taking a walk outside would be better for us, or why we argue politics on Facebook when our real friends live just down the street. Everyone wants to be a good person, but few of us, twenty years into the new millennium, have any idea how to do that.\n\nIn You’re a Miracle (and a Pain in the Ass), McHargue addresses these issues. We like to think we’re in control of our thoughts and decisions, he writes, but science has shown that a host of competing impulses, emotions, and environmental factors are at play in every action we undertake. Touching on his podcast listeners’ most pressing questions, from relationships and ethics to stress and mental health, and sharing some of the biggest triumphs and hardships from his own life, McHargue shows us how some of our qualities that seem most frustrating—including “negative” emotions like sadness, anger, and anxiety—are actually key to helping humans survive and thrive. In doing so, he invites us on a path of self-understanding and, ultimately, self-acceptance.\n\nYou’re a Miracle (and a Pain in the Ass) is a guided tour through the mystery of human consciousness, showing readers how to live more at peace with themselves in a complex world.',
    ),
    PopularBookModel(
        title: 'Pattern Maker',
        author: 'Kerry Johnston',
        price: '40',
        image:'assets/images/img_popular_book2.png',
        color:0xFF2B325C,
        description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text.\n\nAll the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.'
    ),
    PopularBookModel(
        title: 'Pa/percra/f',
        author: 'Mike Brown',
        price: '60',
        image:'assets/images/img_popular_book3.png',
        color:0xFFF7EA4A,
        description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.\n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book App'),
      ),
      body: ListView.builder(
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
                      IconButton(
                        onPressed: () {
                          provider.toggleFavorite(book);
                        },
                        icon: provider.isExist(book)
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
              builder: (context) {
                return Consumer<FavoriteProvider>(
                  builder: (context, FavoriteProvider data, widget) {
                    return FavoritePage(
                        popularBookData: data.favoriteBookList);
                  },
                );
              });
          Navigator.push(context, route);
        },
        label: const Text('Favorites'),
      ),
    );
  }
}
