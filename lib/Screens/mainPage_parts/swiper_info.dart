import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:umeals/domain/types/swiperInfo.dart';

class SwiperInfo extends StatelessWidget {
  final List<InfoSwiper> infoSwiper =[
    InfoSwiper(imagePath: 'https://cdn.prod.website-files.com/6423e8cf97045d0ac6e9ffb9/6565d9491a89f4b7b7915b3e_tipos%20de%20restaurante.jpg'),
    InfoSwiper(imagePath: 'https://cdn.prod.website-files.com/6423e8cf97045d0ac6e9ffb9/6565d9491a89f4b7b7915b3e_tipos%20de%20restaurante.jpg'),
    InfoSwiper(imagePath: 'https://cdn.prod.website-files.com/6423e8cf97045d0ac6e9ffb9/6565d9491a89f4b7b7915b3e_tipos%20de%20restaurante.jpg'),
    InfoSwiper(imagePath: 'https://cdn.prod.website-files.com/6423e8cf97045d0ac6e9ffb9/6565d9491a89f4b7b7915b3e_tipos%20de%20restaurante.jpg'),

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