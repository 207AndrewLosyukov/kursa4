import 'package:courses_app/models/item.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../article.dart';

class PresentationWidget extends StatefulWidget {
  final Item article;
  final int id;

  PresentationWidget(this.article, this.id);

  @override
  State<PresentationWidget> createState() => _PresentationWidgetState();
}

class _PresentationWidgetState extends State<PresentationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Hero(
          tag: widget.id,
          //tag: widget.article.coverImage,
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: 180,
              width: 210,
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  InkWell(
                    // onTap: () {
                    //Navigator.of(context).push(
                    //MaterialPageRoute(
                    //builder: (context) => ArtViewPage(art: widget.art),
                    //),
                    //);
                    //print("Container clicked");
                    // },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0, 0.7, 1],
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              widget.article.title,
                              style: TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
