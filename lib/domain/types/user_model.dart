class User {
  String nombre;         
  String correo;          
  String? imageURL;      
  String apellidos;       
  int telefono;        


  User({
    required this.nombre,
    required this.correo,
    this.imageURL,
    required this.apellidos,
    required this.telefono,
  });


  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'correo': correo,
      'imageURL': imageURL,
      'apellidos': apellidos,
      'telefono': telefono,
    };
  }


factory User.fromJson(Map<String, dynamic> json) {
  return User(
    nombre: json['Nombre'] ?? 'Nombre no disponible', 
    correo: json['correo'] ?? 'Correo no disponible',   
    imageURL: json['imageURL'], 
    apellidos: json['Apellidos'] ?? 'Apellidos no disponibles', 
    telefono: json['telefono'] ?? '0000000000', 
  );
}

}