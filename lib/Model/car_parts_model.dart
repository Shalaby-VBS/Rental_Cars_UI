class CarPartsModel {
  final String img;
  final String carParts1;
  final String carParts2;

  CarPartsModel(
      {required this.img, required this.carParts1, required this.carParts2});

  static List<CarPartsModel> carPartsList = [
    CarPartsModel(
        img: 'assets/img/seat.png',
        carParts1: 'Capacity',
        carParts2: '4 Seats'),
    CarPartsModel(
        img: 'assets/img/part1.png',
        carParts1: 'Max Speed',
        carParts2: '265 KM/h'),
    CarPartsModel(
        img: 'assets/img/part2.png', carParts1: 'Power', carParts2: '580 HP'),
  ];
}
