class User {
  int? id;
  String nombre;         
  String correo;          
  String? imageURL;      
  String apellidos;       
  int telefono;        
  String password;


  User({
    this.id,
    required this.nombre,
    required this.correo,
    this.imageURL,
    required this.apellidos,
    required this.telefono,
    required this.password
  });


  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'nombre': nombre,
      'correo': correo,
      'imageURL': imageURL,
      'apellidos': apellidos,
      'telefono': telefono,
      'password':password
    };
  }


factory User.fromJson(Map<String, dynamic> json) {
  return User(
    id: json['idUSUARIOS'] ?? 'No id found',
    nombre: json['Nombre'] ?? 'Nombre no disponible', 
    correo: json['correo'] ?? 'Correo no disponible',   
    imageURL: json['imageURL'], 
    apellidos: json['Apellidos'] ?? 'Apellidos no disponibles', 
    telefono: json['telefono'] ?? '0000000000', 
    password: json['password'] ?? ''
  );
}

}