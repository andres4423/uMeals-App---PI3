import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:umeals/domain/types/swiperInfo.dart';

class SwiperInfo extends StatelessWidget {
  final List<InfoSwiper> infoSwiper =[
    InfoSwiper(imagePath: 'https://www.google.com/imgres?q=aburrimiento%20inside%20out%202&imgurl=https%3A%2F%2Fstatic.wikia.nocookie.net%2Finside-out%2Fimages%2Fc%2Fcb%2FEnnui_inside_out_2_profile.png%2Frevision%2Flatest%3Fcb%3D20240625234449%26path-prefix%3Des&imgrefurl=https%3A%2F%2Finside-out.fandom.com%2Fes%2Fwiki%2FEnnui&docid=XMGlZO-y_hDpBM&tbnid=upfa1tDIfVnM0M&vet=12ahUKEwjF6-2j0fSHAxVfSjABHZrrA7QQM3oECBgQAA..i&w=827&h=1247&hcb=2&ved=2ahUKEwjF6-2j0fSHAxVfSjABHZrrA7QQM3oECBgQAA'),
    InfoSwiper(imagePath: 'https://www.google.com/imgres?q=aburrimiento%20inside%20out%202&imgurl=https%3A%2F%2Fstatic.wikia.nocookie.net%2Finside-out%2Fimages%2Fc%2Fcb%2FEnnui_inside_out_2_profile.png%2Frevision%2Flatest%3Fcb%3D20240625234449%26path-prefix%3Des&imgrefurl=https%3A%2F%2Finside-out.fandom.com%2Fes%2Fwiki%2FEnnui&docid=XMGlZO-y_hDpBM&tbnid=upfa1tDIfVnM0M&vet=12ahUKEwjF6-2j0fSHAxVfSjABHZrrA7QQM3oECBgQAA..i&w=827&h=1247&hcb=2&ved=2ahUKEwjF6-2j0fSHAxVfSjABHZrrA7QQM3oECBgQAA'),
    InfoSwiper(imagePath: 'https://www.google.com/imgres?q=aburrimiento%20inside%20out%202&imgurl=https%3A%2F%2Fstatic.wikia.nocookie.net%2Finside-out%2Fimages%2Fc%2Fcb%2FEnnui_inside_out_2_profile.png%2Frevision%2Flatest%3Fcb%3D20240625234449%26path-prefix%3Des&imgrefurl=https%3A%2F%2Finside-out.fandom.com%2Fes%2Fwiki%2FEnnui&docid=XMGlZO-y_hDpBM&tbnid=upfa1tDIfVnM0M&vet=12ahUKEwjF6-2j0fSHAxVfSjABHZrrA7QQM3oECBgQAA..i&w=827&h=1247&hcb=2&ved=2ahUKEwjF6-2j0fSHAxVfSjABHZrrA7QQM3oECBgQAA'),
    InfoSwiper(imagePath: 'https://www.google.com/imgres?q=aburrimiento%20inside%20out%202&imgurl=https%3A%2F%2Fstatic.wikia.nocookie.net%2Finside-out%2Fimages%2Fc%2Fcb%2FEnnui_inside_out_2_profile.png%2Frevision%2Flatest%3Fcb%3D20240625234449%26path-prefix%3Des&imgrefurl=https%3A%2F%2Finside-out.fandom.com%2Fes%2Fwiki%2FEnnui&docid=XMGlZO-y_hDpBM&tbnid=upfa1tDIfVnM0M&vet=12ahUKEwjF6-2j0fSHAxVfSjABHZrrA7QQM3oECBgQAA..i&w=827&h=1247&hcb=2&ved=2ahUKEwjF6-2j0fSHAxVfSjABHZrrA7QQM3oECBgQAA')

  ];
   SwiperInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        
        const Divider(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text("Promos e información", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
        
        SizedBox(
        height: 185,
        width: double.infinity,
        child: Swiper(
          viewportFraction: 0.8,
          scale: 0.9,
          autoplay: true,
      
          //los botones
          pagination: SwiperPagination(
            margin: const EdgeInsets.only(top:0),
            builder: DotSwiperPaginationBuilder(
              activeColor: colors.primary,
              color: colors.secondary
      
            )
          ),
          itemCount: infoSwiper.length,
          itemBuilder: (context,index){
            final empInfo = infoSwiper[index];
          return _SlideImage(info: empInfo);
          },
        ),
      ),
      ]
    );
  }
}

class _SlideImage extends StatelessWidget {
  final InfoSwiper info;
  const _SlideImage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
     final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
          BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0,10)
        )
      ]
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30), 
      child: DecoratedBox(
        decoration: decoration,
        //lo usamos para poder meter el borderRadius
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          //ponemos la imagen
          child: Image.network(
            info.imagePath,
            fit: BoxFit.cover,
            //esto es mientras carga muestre tal cosa
            loadingBuilder: (context, child, loadingProgress){
              if( loadingProgress != null){
                  return const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black12)
                    );
              
            }
            return child;
            }
          )
          )
          ),
      );
  }
}