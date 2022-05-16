import 'package:courses_app/models/podcast.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../article.dart';

class PresentPodcast extends StatefulWidget {
  final Podcast article;
  final double widgetHeight;
  final double widgetWidth;
  final int id;

  PresentPodcast(this.article, this.widgetHeight, this.widgetWidth, this.id);

  @override
  State<PresentPodcast> createState() => _PresentPodcastState();
}

class _PresentPodcastState extends State<PresentPodcast> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Hero(
            tag: widget.id,
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: widget.widgetHeight,
                width: widget.widgetWidth,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(2, 5),
                          ),
                        ], //color: Colors.black,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              widget.article.coverImage),
                          fit: BoxFit.cover,
                        ),
                        //borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: widget.article.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: widget.article.info,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
