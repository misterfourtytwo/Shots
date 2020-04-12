import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/game/components/shot_card.dart';
import 'package:shots/app/models/shot_card.dart';
import 'package:shots/app/providers/card_provider.dart';

class CardGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);

    ShotCardModel currentCardText = cardProvider.cards[cardProvider.currentCardIndex];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _CardDragTarget(),
        Flexible(
          flex: 7,
          child: ShotCard(
            line1: currentCardText.line1,
            line2: currentCardText.line2 ?? null,
            rotateAngle: currentCardText.rotateAngle,
          ),
        ),
        _CardDragTarget(),
      ],
    );
  }
}

class _CardDragTarget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);

    return Flexible(
      flex: 1,
      child: DragTarget(
        builder: (_, __, ___) {
          return Container(
            // drag target should be just slighly smaller than viewport hiehg
            height: MediaQuery.of(context).size.height - 200,

            // uncomment below target to visualize card drop position
            // color: Colors.red,
          );
        },
        // un comment if required
        // onWillAccept: (_) {
        //   print("onWillAccept");
        //   return true;
        // },
        onAccept: (_) {
          print("onAccept");
          // current card done, go to next card
          cardProvider.nextCard();
        },
        // onLeave: (_) => print("onLeave"),
      ),
    );
  }
}