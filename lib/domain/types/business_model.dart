class BusinessModel {
  BusinessModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.portadaImgURL,
    required this.rating,
    required this.estado,
    required this.logotipoImgUrl,
  });
  late final int id;
  late final String nombre;
  late final String descripcion;
  late final String portadaImgURL;
  late final String rating;
  late final int estado;
  late final String logotipoImgUrl;

  BusinessModel.fromJson(Map<String, dynamic> json) {
    id = json['idEMPRENDIMIENTOS'];
    nombre = json['Nombre'];
    descripcion = json['Descripcion'];
    portadaImgURL = json['portada_img_URL'];
    rating = json['Calificacion'];
    estado = json['Estado'];
    logotipoImgUrl = json['logotipo_img_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idEMPRENDIMIENTOS'] = id;
    data['Nombre'] = nombre;
    data['Descripcion'] = descripcion;
    data['portada_img_URL'] = portadaImgURL;
    data['Calificacion'] = rating;
    data['Estado'] = estado;
    data['logotipo_img_url'] = logotipoImgUrl;
    return data;
  }
}