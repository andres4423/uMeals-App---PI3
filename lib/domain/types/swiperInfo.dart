class InfoSwiper{
  final String imagePath;

  InfoSwiper({required this.imagePath});
  
    factory InfoSwiper.fromMap(Map<String, dynamic> map) {
    return InfoSwiper(
      imagePath: map['ImgPath'] ?? '', 
    );
  }
 

}

