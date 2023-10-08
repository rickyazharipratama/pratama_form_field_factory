class PratamaRadioModel<T>{

  final T value;
  final String title;
  final String? subTitle;

  PratamaRadioModel({
    required this.value,
    required this.title,
    this.subTitle
  });
}