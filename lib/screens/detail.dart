import 'package:flutter/material.dart';
import 'package:mini_project/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_project/widgets/custom_tab_indicator.dart';
import 'package:mini_project/models/popular_book.dart';

class DetailScreen extends StatelessWidget {
  final PopularBookModel popularBookModel;

  const DetailScreen({Key? key, required this.popularBookModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 49,
        color: Colors.transparent,
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                )
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(color: kMainColor),
            ),
            backgroundColor: MaterialStateProperty.all(kMainColor),
          ),
          child: Text(
            'Add to Cart',
            style: GoogleFonts.openSans(
                fontSize: 14, fontWeight: FontWeight.w600, color: kWhiteColor),
          ),
        ),
      ),
      body: SafeArea(
        // child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kMainColor,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: Container(
                  color: Color(popularBookModel.color),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 25,
                        top: 35,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, "/homePage");
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kWhiteColor),
                            child: SvgPicture.asset(
                                'assets/icons/icon_back_arrow.svg'),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 62),
                          width: 172,
                          height: 225,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(popularBookModel.image),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 25),
                      child: Text(
                        popularBookModel.title,
                        style: GoogleFonts.openSans(
                            fontSize: 27,
                            color: kBlackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7, left: 25),
                      child: Text(
                        popularBookModel.author,
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kGreyColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 7, left: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Rp. ',
                              style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  color: kMainColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              popularBookModel.price,
                              style: GoogleFonts.openSans(
                                  fontSize: 32,
                                  color: kMainColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )),
                    Container(
                      height: 500,
                      margin: const EdgeInsets.only(top: 23, bottom: 36),
                      padding: const EdgeInsets.only(left: 7),
                      child: DefaultTabController(
                        length: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TabBar(
                                labelPadding: const EdgeInsets.all(0),
                                indicatorPadding: const EdgeInsets.only(left: 20),
                                isScrollable: true,
                                labelColor: kBlackColor,
                                unselectedLabelColor: kGreyColor,
                                labelStyle: GoogleFonts.openSans(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                                unselectedLabelStyle: GoogleFonts.openSans(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                                indicator: RoundedRectangleTabIndicator(
                                    weight: 2, width: 30, color: kBlackColor),
                                tabs: [
                                  Tab(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 20, right: 39),
                                      child: const Text('Description'),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 20, right: 39),
                                      child: const Text('Detail'),
                                    ),
                                  ),
                                ]),
                            Expanded(
                                child: TabBarView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 25),
                                      child: Text(
                                        popularBookModel.description,
                                        style: GoogleFonts.openSans(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: kGreyColor,
                                          letterSpacing: 1.5,
                                          height: 2,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(top:25, left: 25),
                                        child: Wrap(
                                          direction: Axis.horizontal,
                                          children: [
                                            Container(
                                              width: 120,
                                              height: 50,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      "Penerbit :"
                                                  ),
                                                  Text(
                                                      popularBookModel.publisher,
                                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              height: 50,
                                              margin: EdgeInsets.only(left: 140),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      "Jumlah Halaman :"
                                                  ),
                                                  Text(
                                                      popularBookModel.pages.toString(),
                                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 20),
                                              width: 120,
                                              height: 50,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      "Tanggal Terbit :"
                                                  ),
                                                  Text(
                                                      popularBookModel.dateIssue,
                                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 50,
                                              margin: EdgeInsets.only(left: 140),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      "Berat :"
                                                  ),
                                                  Text(
                                                      popularBookModel.weight,
                                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              height: 50,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      "ISBN :"
                                                  ),
                                                  Text(
                                                      popularBookModel.isbn,
                                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 50,
                                              margin: EdgeInsets.only(left: 140),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      "Lebar :"
                                                  ),
                                                  Text(
                                                      '${popularBookModel.width.toString()} cm',
                                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              height: 50,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      "Bahasa :"
                                                  ),
                                                  Text(
                                                      popularBookModel.language,
                                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 50,
                                              margin: EdgeInsets.only(left: 140),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Panjang :"
                                                  ),
                                                  Text(
                                                      '${popularBookModel.length.toString()} cm',
                                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]))
            ],
          ),
        // ),
      ),
    );
  }
}
