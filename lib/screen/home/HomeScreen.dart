import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/CustomSizeBox.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;
  late VideoPlayerController videoController;

  bool _isLiked = false;

  int selectIndex = 0;

  List<Map<String, dynamic>> tiktokVideos = [
    {
      "profile": "assets/images/nancyOne.jpg",
      "userName": "nancy@1500",
      "heart": 6,
      "comment": 345,
      "bookmark": 12,
      "share": 13,
      "description": "#Nancy Momoland momoland",
      "video": "assets/videos/nancyOne.mp4",
    },
    {
      "profile": "assets/images/nancyTwo.jpg",
      "userName": "nancy@1500",
      "heart": 1900,
      "comment": 645,
      "bookmark": 10,
      "share": 13,
      "description": "#Nancy Momoland momoland",
      "video": "assets/videos/nancyTwo.mp4",
    },
    {
      "profile": "assets/images/nancyThree.png",
      "userName": "nancy@1500",
      "heart": 2456,
      "comment": 345,
      "bookmark": 12,
      "share": 13,
      "description": "Love me baby, Nancy",
      "video": "assets/videos/nancyThree.mp4",
    },
    {
      "profile": "assets/images/nancyFour.jpg",
      "userName": "nancy@1500",
      "heart": 3656,
      "comment": 145,
      "bookmark": 12,
      "share": 500,
      "description": "#Nancy nancy",
      "video": "assets/videos/nancyFour.mp4",
    },
    {
      "profile": "assets/images/nancyFive.jpg",
      "userName": "nancy@1500",
      "heart": 3000,
      "comment": 5,
      "bookmark": 256,
      "share": 130,
      "description": "#Nancy.original sound good!",
      "video": "assets/videos/nancyFive.mp4",
    }
  ];

  int videoIndex = 0;

  void playVideo(int index) {
    videoController = VideoPlayerController.asset(tiktokVideos[index]["video"])
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) => videoController.play());
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    _sizeAnimation = Tween<double>(begin: 40, end: 50)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _colorAnimation = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    videoController = VideoPlayerController.asset(tiktokVideos[3]["video"])
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) => videoController.play());
  }

  @override
  void dispose() {
    _controller.dispose();
    videoController.dispose();
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55),
      child: Stack(
        children: <Widget>[
          PageView(
              scrollDirection: Axis.vertical,
              onPageChanged: (value) {
                playVideo(value);
              },
              children: [
                for (int v = 0; v < tiktokVideos.length; v++)
                  Stack(children: [
                    SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: videoController.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: videoController.value.aspectRatio,
                                child: VideoPlayer(videoController),
                              )
                            : Container()),

                    //Left Options(Heart,comment,share)
                    Positioned(
                      right: 20,
                      bottom: 0,
                      child: Column(
                        children: <Widget>[
                          //Avatar
                          Container(
                              width: 50,
                              height: 60,
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 26.0,
                                    backgroundColor: AppColor.defaultWhiteColor,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          tiktokVideos[v]["profile"]),
                                      // backgroundImage: AssetImage(
                                      //     "assets/images/nancyOne.jpg"),
                                      radius: 23.0,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: AppColor.tittokRed,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 18,
                                          color: AppColor.defaultWhiteColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),

                          const SizedBox(
                            height: 20.0,
                          ),
                          //End Avatar

                          //Start Heart
                          GestureDetector(
                              onTap: () {
                                _toggleLike();
                              },
                              child: Column(
                                children: <Widget>[
                                  AnimatedBuilder(
                                    animation: _controller,
                                    builder: (context, child) {
                                      return Icon(
                                        Icons.favorite,
                                        size: _sizeAnimation.value,
                                        color: _colorAnimation.value,
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  MyTextWidget(
                                    text: tiktokVideos[v]["heart"].toString(),
                                    fontSize: 12.0,
                                  )
                                ],
                              )),
                          //End Heart

                          const SizedBox(
                            height: 10.0,
                          ),

                          //Start Comment
                          Column(children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.mode_comment,
                                  size: 40,
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            MyTextWidget(
                              text: tiktokVideos[v]["comment"].toString(),
                              fontSize: 12.0,
                            )
                          ]),
                          //End Comment

                          const SizedBox(
                            height: 10.0,
                          ),

                          //Start Bookmark
                          GestureDetector(
                            onTap: null,
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Column(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.bookmark,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    MyTextWidget(
                                      text: tiktokVideos[v]["bookmark"]
                                          .toString(),
                                      fontSize: 12.0,
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          //End Bookmark

                          const SizedBox(
                            height: 10.0,
                          ),

                          //Start Share
                          Column(
                            children: <Widget>[
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 40,
                                    color: Colors.white,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              MyTextWidget(
                                text: tiktokVideos[v]["share"].toString(),
                                fontSize: 12.0,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          //End Share

                          //Start Lyric
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(
                                    width: 10.0,
                                    color:
                                        const Color.fromARGB(255, 61, 59, 59))),
                            child: Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(tiktokVideos[v]["profile"]),
                                radius: 15.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                    //End lyric

                    //Bottom Text
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MyTextWidget(
                              text: tiktokVideos[v]["userName"],
                              fontSize: 16.0,
                            ),
                            Gap(
                              h: 15,
                            ),
                            const MyTextWidget(
                              text: "#fyp #tiktokmyanmar",
                              fontSize: 16.0,
                            ),
                            Gap(
                              h: 15,
                            ),
                            MyTextWidget(
                              text: tiktokVideos[v]["description"],
                              fontSize: 16.0,
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
              ]),
          // //Top Search
          Positioned(
            top: -10,
            right: 5,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_outlined,
                  color: AppColor.defaultWhiteColor,
                  size: 32,
                )),
          ),

          ///Top Bar
          Align(
            alignment: Alignment.topCenter,
            child: Positioned(
              top: 0,
              child: Container(
                width: 165,
                height: 35,
                child: Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectIndex = 0;
                            });
                          },
                          child: MyTextWidget(
                            text: "Following",
                            color: selectIndex == 0
                                ? AppColor.defaultWhiteColor
                                : AppColor.secondaryTextColor,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectIndex = 1;
                            });
                          },
                          child: Row(
                            children: [
                              MyTextWidget(
                                text: "For You",
                                color: selectIndex == 1
                                    ? AppColor.defaultWhiteColor
                                    : AppColor.secondaryTextColor,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      bottom: 0,
                      left: selectIndex == 0 ? 30 : 130,
                      child: Container(
                        width: 30.0,
                        height: 4,
                        decoration: BoxDecoration(
                            color: AppColor.defaultWhiteColor,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
