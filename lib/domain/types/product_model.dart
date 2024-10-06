class ProductModel {
  ProductModel({
    required this.idPRODUCTOS,
    required this.nombre,
    required this.precio,
    required this.imgURL,
    required this.cantidad,
    required this.idEmprendimiento,
  });
  late final int idPRODUCTOS;
  late final String nombre;
  late final int precio;
  late final String imgURL;
  late final String cantidad;
  late final int idEmprendimiento;
  
  ProductModel.fromJson(Map<String, dynamic> json){
    idPRODUCTOS = json['idPRODUCTOS'];
    nombre = json['Nombre'];
    precio = json['Precio'];
    imgURL = json['imgURL'];
    cantidad = json['cantidad'];
    idEmprendimiento = json['EMPRENDIMIENTO_idEMPRENDIMIENTOS'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idPRODUCTOS'] = idPRODUCTOS;
    data['Nombre'] = nombre;
    data['Precio'] = precio;
    data['imgURL'] = imgURL;
    data['cantidad'] = cantidad;
    data['EMPRENDIMIENTO_idEMPRENDIMIENTOS'] = idEmprendimiento;
    return data;
  }
}