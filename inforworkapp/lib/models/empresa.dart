class Empresa {
  final int id;
  final String nombre, descripcion, image;
  Empresa({this.id, this.nombre, this.descripcion, this.image});
}

List<Empresa> empresas = [
  Empresa(
    id: 1,
    nombre: "UCSM",
    descripcion:
        "La UCSM es la primera universidad particular de provincias con 59 años de vida académica formando profesionales con valores éticos.",
    image: "assets/images/Escudo_UCSM",
  ),
  Empresa(
    id: 2,
    nombre: "Leche Gloria",
    descripcion:
        "Gloria es una marca peruana de alimentos, destacándose sus productos lácteos. Es a la vez, una empresa subsidiaria del grupo homónimo.",
    image: "assets/images/Leche_Gloria",
  ),
  Empresa(
    id: 3,
    nombre: "San Fernando",
    descripcion:
        "Hace más de 69 años uniendo familias auténticas. Conoce nuestra línea de productos, dónde canjear tu pavo, cómo ser parte de nuestra familia y más.",
    image: "assets/images/San_Fernando",
  )
];
