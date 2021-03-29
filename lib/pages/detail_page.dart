import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/pages/error_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/facility_item.dart';
import 'package:bwa_cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    launchURL(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorScreen(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                widget.space.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  SizedBox(height: 328),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        color: whiteColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.space.name,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                        text: '\$${widget.space.price}',
                                        style: purpleTextStyle.copyWith(
                                            fontSize: 16),
                                        children: [
                                          TextSpan(
                                              text: ' / month',
                                              style: greyTextStyle.copyWith(
                                                  fontSize: 16))
                                        ]),
                                  ),
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: RatingItem(
                                      index: index,
                                      rating: widget.space.rating,
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        //Note : main fasilitis

                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Main Facilitiess',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                name: ' kitchen',
                                imageUrl: 'assets/001-bar-counter.png',
                                total: widget.space.numberOfKitchens,
                              ),
                              FacilityItem(
                                name: ' bedroom',
                                imageUrl: 'assets/002-double-bed.png',
                                total: widget.space.numberOfBedrooms,
                              ),
                              FacilityItem(
                                name: ' Big Lemari',
                                imageUrl: 'assets/003-cupboard.png',
                                total: widget.space.numberOfCupboards,
                              ),
                            ],
                          ),
                        ),
                        //Note : Photo
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Photos',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: widget.space.photos.map((item) {
                                return Container(
                                  margin: EdgeInsets.only(left: 24),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      item,
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList()
                              // [
                              //   SizedBox(
                              //     width: edge,
                              //   ),
                              //   Image.asset(
                              //     'assets/city1.png',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              //   SizedBox(
                              //     width: 18,
                              //   ),
                              //   Image.asset(
                              //     'assets/city2.png',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              //   SizedBox(
                              //     width: 18,
                              //   ),
                              //   Image.asset(
                              //     'assets/city3.png',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              //   SizedBox(
                              //     width: 18,
                              //   ),
                              //   Image.asset(
                              //     'assets/city4.png',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              //   SizedBox(
                              //     width: 18,
                              //   ),
                              //   Image.asset(
                              //     'assets/city5.png',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              // ],
                              ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // Note : Loccation
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Location',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.space.address}\n${widget.space.city}',
                                style: greyTextStyle,
                              ),
                              InkWell(
                                onTap: () {
                                  launchURL(widget.space.mapUrl);
                                },
                                child: Image.asset(
                                  'assets/btn_wishlist1.png',
                                  width: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: edge),
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          child: RaisedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text(
                                          "Konfirmasi",
                                        ),
                                        content: Text(
                                            'Apakah kamu ingin menghubungi pemilik kos?'),
                                        actions: <Widget>[
                                          FlatButton(
                                              child: Text('Panggil'),
                                              onPressed: () {
                                                launchURL(
                                                    'tel:${widget.space.phone}');
                                              }),
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Batalkan'))
                                        ],
                                      ));
                            },
                            color: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/btn_back.png',
                        width: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      child: Image.asset(
                        isClicked
                            ? 'assets/btn_wishlist.png'
                            : 'assets/btn_wishlist2.png',
                        width: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
