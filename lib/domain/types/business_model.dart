class BusinessModel {
  BusinessModel({
    required this.idEMPRENDIMIENTOS,
    required this.nombre,
    required this.descripcion,
    required this.portadaImgURL,
    required this.estado,
    required this.logotipoImgUrl,
    required this.calificacion,
    required this.contacto,
    required this.ubicacion,
    required this.horarios,
  });
  late final int idEMPRENDIMIENTOS;
  late final String nombre;
  late final String descripcion;
  late final String portadaImgURL;
  late final int estado;
  late final String logotipoImgUrl;
  late final String calificacion;
  late final int contacto;
  late final String ubicacion;
  late final Horarios horarios;
  
  BusinessModel.fromJson(Map<String, dynamic> json){
    idEMPRENDIMIENTOS = json['idEMPRENDIMIENTOS'];
    nombre = json['Nombre'];
    descripcion = json['Descripcion'];
    portadaImgURL = json['portada_img_URL'];
    estado = json['Estado'];
    logotipoImgUrl = json['logotipo_img_url'];
    calificacion = json['Calificacion'];
    contacto = json['contacto'];
    ubicacion = json['ubicacion'];
    horarios = Horarios.fromJson(json['horarios']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idEMPRENDIMIENTOS'] = idEMPRENDIMIENTOS;
    data['Nombre'] = nombre;
    data['Descripcion'] = descripcion;
    data['portada_img_URL'] = portadaImgURL;
    data['Estado'] = estado;
    data['logotipo_img_url'] = logotipoImgUrl;
    data['Calificacion'] = calificacion;
    data['contacto'] = contacto;
    data['ubicacion'] = ubicacion;
    data['horarios'] = horarios.toJson();
    return data;
  }
}

class Horarios {
  Horarios({
    required this.lunes,
    required this.jueves,
    required this.martes,
    required this.viernes,
    required this.miercoles,
  });
  late final String lunes;
  late final String jueves;
  late final String martes;
  late final String viernes;
  late final String miercoles;
  
  Horarios.fromJson(Map<String, dynamic> json){
    lunes = json['lunes'];
    jueves = json['jueves'];
    martes = json['martes'];
    viernes = json['viernes'];
    miercoles = json['miercoles'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lunes'] = lunes;
    data['jueves'] = jueves;
    data['martes'] = martes;
    data['viernes'] = viernes;
    data['miercoles'] = miercoles;
    return data;
  }
}