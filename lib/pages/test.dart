import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/colors.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final List<String> normalSeatList = [
    'A',
    'Available',
    'Taken',
    'Available',
    'Available',
    '',
    '',
    'Taken',
    'Taken',
    'Taken',
    'Taken',
    'A',
    'B',
    'Available',
    'Available',
    'Taken',
    'Taken',
    '',
    '',
    'Taken',
    'Taken',
    'Taken',
    'Available',
    'B',
  ];

  final List<String> goldSeatList = [
    'C',
    'Taken',
    'Taken',
    'Available',
    'Available',
    '',
    '',
    'Available',
    'Available',
    'Available',
    'Available',
    'C',
    'D',
    'Available',
    'Taken',
    'Taken',
    'Taken',
    '',
    '',
    'Taken',
    'Taken',
    'Taken',
    'Taken',
    'D',
  ];

  final List<String> executiveSeatList = [
    'E',
    'Taken',
    'Taken',
    'Available',
    'Available',
    '',
    '',
    'Available',
    'Taken',
    'Available',
    'Taken',
    'E',
    'F',
    'Taken',
    'Taken',
    'Taken',
    'Taken',
    '',
    '',
    'Taken',
    'Taken',
    'Taken',
    'Taken',
    'F',
  ];

  final List<String> premiumSeatList = [
    'G',
    'coupleTaken',
    '',
    'Available',
    'Taken',
    'Available',
    'Taken',
    'Available',
    '',
    'coupleAvailable',
    'G',
    'H',
    'coupleTaken',
    '',
    'Taken',
    'Taken',
    'Taken',
    'Taken',
    'Taken',
    '',
    'coupleAvailable',
    'H',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Text(
                    "4500Ks",
                    style: TextStyle(color: WHITE_COLOR),
                    textAlign: TextAlign.center,
                  );
                } else if (index == 2) {
                  return Text(
                    "6500Ks",
                    style: TextStyle(color: WHITE_COLOR),
                    textAlign: TextAlign.center,
                  );
                } else if (index == 4) {
                  return Text("8500Ks",
                      style: TextStyle(color: WHITE_COLOR),
                      textAlign: TextAlign.center);
                } else if (index == 6) {
                  return Text("10000Ks",
                      style: TextStyle(color: WHITE_COLOR),
                      textAlign: TextAlign.center);
                } else if (index == 1) {
                  return NormalSeatGridView(seatList: normalSeatList);
                } else if (index == 3) {
                  return GoldSeatGridView(seatList: goldSeatList);
                } else if (index == 5) {
                  return ExecutiveSeatGridView(seatList: executiveSeatList);
                } else {
                  return PremiumSeatGridView(seatList: premiumSeatList);
                }
              }),
        ),
      ),
    );
  }
}

class NormalSeatGridView extends StatelessWidget {
  final List<String> seatList;
  NormalSeatGridView({required this.seatList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: seatList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 12),
        itemBuilder: (context, index) {
          if (index == 0 || index == 11 || index == 12 || index == 23) {
            return Text(
              seatList[index],textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            );
          } else if (seatList[index] == '') {
            return Container();
          } else if (seatList[index] == 'Available') {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 25,
                width: 25,
                color: GREY_COLOR,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 25,
                width: 25,
                color: WHITE_COLOR,
              ),
            );
          }
        },
      ),
    );
  }
}

class GoldSeatGridView extends StatelessWidget {
  final List<String> seatList;
  GoldSeatGridView({required this.seatList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: seatList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 12),
        itemBuilder: (context, index) {
          if (index == 0 || index == 11 || index == 12 || index == 23) {
            return Text(
              seatList[index],textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            );
          } else if (seatList[index] == '') {
            return Container();
          } else if (seatList[index] == 'Available') {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 25,
                width: 25,
                color: GREY_COLOR,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 25,
                width: 25,
                color: WHITE_COLOR,
              ),
            );
          }
        },
      ),
    );
  }
}

class ExecutiveSeatGridView extends StatelessWidget {
  final List<String> seatList;
  const ExecutiveSeatGridView({super.key, required this.seatList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: seatList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 12),
        itemBuilder: (context, index) {
          if (index == 0 || index == 11 || index == 12 || index == 23) {
            return Text(
              seatList[index],textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            );
          } else if (seatList[index] == '') {
            return Container();
          } else if (seatList[index] == 'Available') {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 25,
                width: 25,
                color: GREY_COLOR,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 25,
                width: 25,
                color: WHITE_COLOR,
              ),
            );
          }
        },
      ),
    );
  }
}

class PremiumSeatGridView extends StatelessWidget {
  final List<String> seatList;
  PremiumSeatGridView({required this.seatList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: seatList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11),
        itemBuilder: (context, index) {
          if (index == 0 || index == 10 || index == 11 || index == 21) {
            return Text(
              seatList[index],textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            );
          } else if (seatList[index] == '') {
            return Container();
          } else if (seatList[index] == 'Available') {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 25,
                width: 25,
                color: GREY_COLOR,
              ),
            );
          } else if (seatList[index] == 'Taken') {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 25,
                width: 25,
                color: WHITE_COLOR,
              ),
            );
          } else if (seatList[index] == 'coupleTaken') {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 40,
                height: 25,
                color: WHITE_COLOR,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 40,
                height: 25,
                color: GREY_COLOR,
              ),
            );
          }
        },
      ),
    );
  }
}
