import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/models/article.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late final article = widget.article;
  bool isSelected = false;
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.article.coverImage,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: false,
              pinned: false,
              snap: false,
              floating: false,
              stretch: true,
              expandedHeight: 350.0,
              flexibleSpace: Stack(children: [
                Positioned(
                  child: InkWell(
                    /*onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          FullsreenImageView(link: widget.art.primaryImage),
                    ),
                  );
                },*/
                    child: FlexibleSpaceBar(
                      stretchModes: <StretchMode>[
                        StretchMode.zoomBackground,
                        StretchMode.fadeTitle,
                      ],
                      titlePadding: EdgeInsetsDirectional.only(
                          start: 30, end: 10, bottom: 40),
                      centerTitle: false,
                      title: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              spreadRadius: 70,
                              blurRadius: 120,
                              offset:
                                  Offset(10, 50), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text.rich(
                          TextSpan(
                            text: widget.article.title,
                            children: [
                              TextSpan(
                                text: '\n' + widget.article.author,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      background: DecoratedBox(
                          position: DecorationPosition.foreground,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      widget.article.coverImage),
                                  fit: BoxFit.cover))),
                    ),
                  ),
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    //height: 700.0,
                    //alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(
                                  text: 'Год',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black45,
                                    fontSize: 14,
                                  ),
                                )),
                                SizedBox(height: 3),
                                Text.rich(TextSpan(
                                  text: '2021',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                    fontSize: 16,
                                  ),
                                )),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, top: 0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconToggleButton(
                                    isSelected: isSelected,
                                    onPressed: () {
                                      setState(
                                        () {
                                          isSelected = !isSelected;
                                        },
                                      );
                                    },
                                    art: article,
                                  ),
                                ),
                              ),
                            )
                          ]),

                          // ------
                          //SizedBox(height: 30),

                          // ------
                          SizedBox(height: 30),
                          Text.rich(TextSpan(
                            text: 'Об авторе',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                              fontSize: 14,
                            ),
                          )),
                          SizedBox(height: 3),
                          Text.rich(TextSpan(
                            text:
                                'Психолог, Гештальт-терапевт скайпконсультант',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          )),
                          SizedBox(height: 30),
                          Text.rich(TextSpan(
                            text: 'Время чтения',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                              fontSize: 14,
                            ),
                          )),

                          SizedBox(height: 3),
                          Text.rich(TextSpan(
                            text: '2 минуты',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          )),

                          SizedBox(height: 40),
                          Text.rich(TextSpan(
                            text: 'У меня несколько раз на консультациях спрашивали – а что такое здоровые отношения между людьми. Я пообещал написать, с энтузиазмом сел за комп и обнаружил, что далеко не на все вопросы о здоровых отношениях у меня на настоящий момент есть четкий ответ. А действительно как четко определить вот сейчас здоровые отношения, а вот теперь нет. Где взять и какие четкие критерии можно использовать для описания здоровых отношений. Однако потом вспомнил, что даже у такой научной дисциплины как психология здоровья нет четких, всеми принятых критериев, я расслабился и сел писать то, как я понимаю эти самые здоровые отношения.' +
                                '\n\nТам же, на теплых берегах Адриатического моря, увидели свет и некоторые «теоретические» работы. Римско-католическая Джяково-Осиековская архиепархия сохранила в своих архивах хроники епископа Петара Бакича (1719 год) и Андреаса Кечкеметы (1739 год), оба говорят о специфичных для Хорватии собаках Canis Dalmaticus. В 1771 году натуралист из Уэльса Томас Пеннант написал книгу «Синопсис четвероногих», где впервые назвал породу Dalmatian. В 1790 году английский исследователь естественной истории Томас Бьюик включил далматинцев в «Общую историю четвероногих».',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                          )),

                          SizedBox(height: 60),
                          //------
                          // SizedBox(height: 30),
                          // Text.rich(TextSpan(
                          //   text: 'Similar',
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.black87,
                          //     fontSize: 25,
                          //   ),
                          // )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IconToggleButton extends StatelessWidget {
  final bool isSelected;
  final Function onPressed;
  final Article art;
  IconToggleButton(
      {required this.isSelected, required this.onPressed, required this.art});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: IconButton(
        iconSize: 30.0,
        color: Colors.black87,
        disabledColor: Colors.black87,
        splashColor: Colors.red,
        highlightColor: Color(0xFFEC407A),
        padding: EdgeInsets.all(5),
        icon: Icon(Icons.favorite_border),
        onPressed: () {
          /*if (artBox.containsKey(art.id)) {
            artBox.delete(art.id);
          } else {
            artBox.put(art.id, art);
          }*/
        },
      ),
    );
  }
}
