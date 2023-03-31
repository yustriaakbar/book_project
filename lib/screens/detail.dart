import 'package:flutter/material.dart';
import 'package:mini_project/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_project/widgets/custom_tab_indicator.dart';
import 'package:mini_project/models/popular_book.dart';

class DetailScreen extends StatelessWidget {
  final PopularBookModel popularBookModel;

  DetailScreen({Key? key, required this.popularBookModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 49,
        color: Colors.transparent,
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Add to Library',
            style: GoogleFonts.openSans(
                fontSize: 14, fontWeight: FontWeight.w600, color: kWhiteColor),
          ),
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
                              '\$',
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
                      height: 28,
                      margin: const EdgeInsets.only(top: 23, bottom: 36),
                      padding: const EdgeInsets.only(left: 25),
                      child: DefaultTabController(
                        length: 3,
                        child: TabBar(
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
                                weight: 2, width: 30, color: kBlackColor),
                            tabs: [
                              Tab(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 39),
                                  child: const Text('Description'),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 39),
                                  child: const Text('Reviews'),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 39),
                                  child: const Text('Similar'),
                                ),
                              )
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
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
                    )
                  ]))
            ],
          ),
        // ),
      ),
    );
  }
}
