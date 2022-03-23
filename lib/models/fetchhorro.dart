class MyData {
  final String desc;
  final String luckColor;
  final String luckNo;
  MyData({required this.desc, required this.luckColor, required this.luckNo});
  factory MyData.fromJson(Map<String,dynamic> json)=>_$MyDataFromJson(json);
}
MyData _$MyDataFromJson(Map<String, dynamic> json) => MyData(
      desc: json['description'] as String? ?? '',
      luckColor: json['color'] as String? ?? '',
      luckNo: json['lucky_number'] as String? ?? '',
    );
