import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'base.dart';
import 'helpers.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController pageController = PageController();
  bool pageIsScrolling = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    /// Attach a listener which will update the state and refresh the page index
    pageController.addListener(() {
      if (pageController.page.round() != currentIndex) {
        setState(() {
          currentIndex = pageController.page.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Base(
      child: GestureDetector(
        onPanUpdate: (details) {
      _onScroll(details.delta.dy * -1);
        },
        child: Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          _onScroll(pointerSignal.scrollDelta.dy);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding(context)),
        child: Row(
          children: [
            Expanded(
                child: Text(
              getLeftText(),
              style: TextStyle(
                  fontSize: 48, color: Colors.white, letterSpacing: 4),
            )),
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                pageSnapping: true,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextDetail(
                            title: 'Dai valore al tuo curriculum!',
                            caption:
                                'Le aziende in cui hai lavorato potranno confermare le tue competenze dandoti così più visibilità nel mondo del lavoro.'),
                      ),
                      Expanded(
                          child:
                              Image.asset('assets/man_easy_work.png'))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child:
                              Image.asset('assets/multitasking.png')),
                      Expanded(
                        child: TextDetail(
                            title: 'Metti in vetrina le tue abilità!',
                            caption:
                                'Le tue competenze potranno essere valutate solo dalle aziende in cui hai lavorato, quindi acquistano un vero valore nei tuoi prossimi colloqui.'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextDetail(
                            title: 'Diventa il migliore nella tua città!',
                            caption:
                                'Guarda le classifiche per competenza, e tieni traccia dei tuoi progressi. Verranno elencati solo i migliori, mentre la tua posizione rimarrà privata.'),
                      ),
                      Expanded(
                          child:
                              Image.asset('assets/mountain_no_bg.png')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
        ),
      ),
    );
  }

  String getLeftText() {
   if(currentIndex == 0)
     return '🔥 your curriculum!';
   if(currentIndex == 1)
     return '🔥 your abilities!';
   return '🔥 your work!';
  }

  void _onScroll(double offset) {
    if (pageIsScrolling == false) {
      pageIsScrolling = true;
      if (offset > 0) {
        pageController
            .nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
      } else {
        pageController
            .previousPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
      }
    }
  }
}

class TextDetail extends StatelessWidget {
  const TextDetail({
    Key key,
    @required this.title,
    @required this.caption,
  }) : super(key: key);

  final String title;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            caption,
            style: TextStyle(color: Colors.white.withOpacity(0.85)),
          ),
          MaterialButton(
            onPressed: () => null,
            color: Colors.cyanAccent,
            hoverElevation: 10,
            splashColor: Colors.cyan,
            child: Text('Scopri di più'),
          )
        ]);
  }
}
