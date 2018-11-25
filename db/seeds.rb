# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Clasification.delete_all

Clasification.create(value: 1, name: "Primer tercio", start_date: Date.today, finish_date: Date.today + 5, description: "", status: :active)
Clasification.create(value: 2, name: "Segundo tercio", start_date: Date.today, finish_date: Date.today + 5, description: "", status: :active)
Clasification.create(value: 3, name: "Tercio tercio", start_date: Date.today, finish_date: Date.today + 5, description: "", status: :active)
Clasification.create(value: 4, name: "Cachimbos", start_date: Date.today, finish_date: Date.today + 5, description: "", status: :active)

Group.delete_all

Group.create(name: "A", description: "", status: :active)
Group.create(name: "B", description: "", status: :active)
Group.create(name: "C", description: "", status: :active)
Group.create(name: "D", description: "", status: :active)
Group.create(name: "E", description: "", status: :active)
Course.delete_all
#MALLA 2013
# PRIMER AÑO-PRIMER SEMESTRE
Course.create(name: "CALCULO EN UNA VARIABLE", code: 1301101,has_laboratory: false, status: :active, description: "")
Course.create(name: "ESTRUCTURAS DISCRETAS 1", code: 1301102,has_laboratory: false, status: :active, description: "")
Course.create(name: "INTRODUCCION A LA COMPUTACION", code: 1301103,has_laboratory: false, status: :active, description: "")
Course.create(name: "FUNDAMENTOS DE LA PROGRAMACION 1", code: 1301104,has_laboratory: false, status: :active, description: "")
Course.create(name: "TECNICAS DE ESTUDIO", code: 1301106,has_laboratory: false, status: :active, description: "")
# PRIMER AÑO-SEGUNDO SEMESTRE
Course.create(name: "CALCULO EN VARIAS VARIABLES", code: 1301207,has_laboratory: false, status: :active, description: "")
Course.create(name: "ESTRUCTURAS DISCRETAS 2", code: 1301208,has_laboratory: false, status: :active, description: "")
Course.create(name: "PROGRAMACION WEB 1", code: 1301209,has_laboratory: false, status: :active, description: "")
Course.create(name: "FUNDAMENTOS DE PROGRAMACION 2", code: 1301210,has_laboratory: false, status: :active, description: "")
Course.create(name: "COMUNICACION ORAL Y ESCRITA", code: 1301211,has_laboratory: false, status: :active, description: "")
Course.create(name: "TALLER DE LIDERAZGO Y COLABORACION", code: 1301212,has_laboratory: false, status: :active, description: "")
# SEGUNDO AÑO-PRIMER SEMESTRE
Course.create(name: "ALGEBRA LINEAL", code: 1302113,has_laboratory: false, status: :active, description: "")
Course.create(name: "ESTADISTICA MATEMATICA PROBABILIDADES Y METODOS EMPIRICOS", code: 1302114,has_laboratory: false, status: :active, description: "")
Course.create(name: "TALLERES DE PSICOLOGIA", code: 1302115,has_laboratory: false, status: :active, description: "")
Course.create(name: "ESTRUCTURA DE DATOS Y ALGORITMOS", code: 1302116,has_laboratory: false, status: :active, description: "")
Course.create(name: "PROGRAMACION WEB 2	", code: 1302117,has_laboratory: false, status: :active, description: "")
Course.create(name: "ETICA PROFESIONAL Y ASPECTOS LEGALES", code: 1302118,has_laboratory: false, status: :active, description: "")
Course.create(name: "REDACCION DE ARTICULOS E INFORMES DE INVESTIGACION", code: 1302119,has_laboratory: false, status: :active, description: "")
# SEGUNDO AÑO-SEGUNDO SEMESTRE
Course.create(name: "ARQUITECTURA DE COMPUTADORES", code: 1302220,has_laboratory: false, status: :active, description: "")
Course.create(name: "BASE DE DATOS", code: 1302221,has_laboratory: false, status: :active, description: "")
Course.create(name: "METODOS NUMERICOS", code: 1302222,has_laboratory: false, status: :active, description: "")
Course.create(name: "INTERACCION HUMANO COMPUTADOR", code: 1302223,has_laboratory: false, status: :active, description: "")
Course.create(name: "ENFOQUE EMPRESARIAL", code: 1302224,has_laboratory: false, status: :active, description: "")
Course.create(name: "ANALISIS Y DISENO DE ALGORITMOS", code: 1302225,has_laboratory: false, status: :active, description: "")
# TERCER AÑO-PRIMER SEMESTRE
Course.create(name: "PROGRAMACION DE SISTEMAS", code: 1303126,has_laboratory: false, status: :active, description: "")
Course.create(name: "INTRODUCCION A LA INGENIERIA DE SOFTWARE", code: 1303127,has_laboratory: false, status: :active, description: "")
Course.create(name: "FISICA COMPUTACIONAL", code: 1303128,has_laboratory: false, status: :active, description: "")
Course.create(name: "TEORIA DE LA COMPUTACION", code: 1303129,has_laboratory: false, status: :active, description: "")
Course.create(name: "INNOVACION Y CREATIVIDAD", code: 1303130,has_laboratory: false, status: :active, description: "")
Course.create(name: "ORGANIZACION Y METODOS", code: 1303131,has_laboratory: false, status: :active, description: "")
# TERCER AÑO-SEGUNDO SEMESTRE
Course.create(name: "CONSTRUCCION DE SOFTWARE", code: 1303232,has_laboratory: false, status: :active, description: "")
Course.create(name: "REDES Y COMUNICACION DE DATOS", code: 1303233,has_laboratory: false, status: :active, description: "")
Course.create(name: "TECNOLOGIA DE OBJETOS", code: 1303234,has_laboratory: false, status: :active, description: "")
Course.create(name: "SISTEMAS OPERATIVOS", code: 1303235,has_laboratory: false, status: :active, description: "")
Course.create(name: "FUNDAMENTOS DE SISTEMAS DE INFORMACION", code: 1303236,has_laboratory: false, status: :active, description: "")
Course.create(name: "METODOS DE INVESTIGACION Y REDACCION", code: 1303237,has_laboratory: false, status: :active, description: "")
# CUARTO AÑO-PRIMER SEMESTRE
Course.create(name: "INVESTIGACION DE OPERACIONES", code: 1304138,has_laboratory: false, status: :active, description: "")
Course.create(name: "TECNOLOGIAS DE INFORMACION", code: 1304139,has_laboratory: false, status: :active, description: "")
Course.create(name: "INTELIGENCIA ARTIFICIAL", code: 1304140,has_laboratory: false, status: :active, description: "")
Course.create(name: "DISENO Y ARQUITECTURA DE SOFTWARE", code: 1304141,has_laboratory: false, status: :active, description: "")
Course.create(name: "SISTEMAS DISTRIBUIDOS", code: 1304142,has_laboratory: false, status: :active, description: "")
Course.create(name: "AUDITORIA DE INGENIERIA DE SOFTWARE", code: 1304143,has_laboratory: false, status: :active, description: "")
# CUARTO AÑO-SEGUNDO SEMESTRE
Course.create(name: "ASPECTOS FORMALES DE VERIFICACION Y ESPECIFICACION", code: 1304244,has_laboratory: false, status: :active, description: "")
Course.create(name: "GESTION DE PROYECTOS DE SOFTWARE", code: 1304245,has_laboratory: false, status: :active, description: "")
Course.create(name: "CALIDAD DE SOFTWARE", code: 1304246,has_laboratory: false, status: :active, description: "")
Course.create(name: "PRUEBAS DE SOFTWARE", code: 1304247,has_laboratory: false, status: :active, description: "")
Course.create(name: "INGENIERIA DE REQUERIMIENTOS", code: 1304248,has_laboratory: false, status: :active, description: "")
Course.create(name: "NEGOCIOS ELECTRONICOS (E)", code: 1304249,has_laboratory: false, status: :active, description: "")
Course.create(name: "INTRODUCCION AL DESARROLLO DE SOFTWARE DE ENTRETENIMIENTO (E)", code: 1304250,has_laboratory: false, status: :active, description: "")
Course.create(name: "INTRODUCCION AL DESARROLLO DE NUEVAS PLATAFORMAS (E)", code: 1304251,has_laboratory: false, status: :active, description: "")
# QUINTO AÑO-PRIMER SEMESTRE
Course.create(name: "PROYECTO DE INGENIERIA DE SOFTWARE 1", code: 1305152,has_laboratory: false, status: :active, description: "")
Course.create(name: "PROYECTO DE TESIS", code: 1305153,has_laboratory: false, status: :active, description: "")
Course.create(name: "GESTION DE EMPRENDIMIENTOS DE SOFTWARE 1", code: 1305154,has_laboratory: false, status: :active, description: "")
Course.create(name: "SISTEMAS DE SEGURIDAD CRITICA", code: 1305155,has_laboratory: false, status: :active, description: "")
Course.create(name: "MANTENIMIENTO, CONFIGURACION Y EVOLUCION DE SOFTWARE", code: 1305156,has_laboratory: false, status: :active, description: "")
Course.create(name: "GESTION DE SISTEMAS Y TECNOLOGIAS DE INFORMACION (E)", code: 1305157,has_laboratory: false, status: :active, description: "")
Course.create(name: "MULTIMEDIA Y REALIDAD VIRTUAL (E)", code: 1305158,has_laboratory: false, status: :active, description: "")
Course.create(name: "DESARROLLO EN NUEVAS PLATAFORMAS AVANZADO (E)", code: 1305159,has_laboratory: false, status: :active, description: "")

#MALLA 2017
# PRIMER AÑO-PRIMER SEMESTRE
Course.create(name: "RAZONAMIENTO LOGICO MATEMATICO", code: 1701102,has_laboratory: false, status: :active, description: "")
Course.create(name: "MATEMATICA BASICA", code: 1701103,has_laboratory: false, status: :active, description: "")
Course.create(name: "ESTRUCTURAS DISCRETAS 1", code: 1701104,has_laboratory: false, status: :active, description: "")
Course.create(name: "INTRODUCCION A LA COMPUTACION", code: 1701105,has_laboratory: false, status: :active, description: "")
Course.create(name: "FUNDAMENTOS DE LA PROGRAMACION 1", code: 1701106,has_laboratory: false, status: :active, description: "")
Course.create(name: "METODOLOGIA DEL TRABAJO INTELECTUAL UNIVERSITARIO", code: 1701114,has_laboratory: false, status: :active, description: "")
Course.create(name: "RELACIONES HUMANAS", code: 1701115,has_laboratory: false, status: :active, description: "")
# PRIMER AÑO-SEGUNDO SEMESTRE
Course.create(name: "CALCULO EN UNA VARIABLE", code: 1701210,has_laboratory: false, status: :active, description: "")
Course.create(name: "ESTRUCTURAS DISCRETAS 2", code: 1701211,has_laboratory: false, status: :active, description: "")
Course.create(name: "PROGRAMACION WEB 1", code: 1701212,has_laboratory: false, status: :active, description: "")
Course.create(name: "FUNDAMENTOS DE PROGRAMACION 2", code: 1701213,has_laboratory: false, status: :active, description: "")
Course.create(name: "COMUNICACION INTEGRAL", code: 1701216,has_laboratory: false, status: :active, description: "")
Course.create(name: "REALIDAD NACIONAL", code: 1701217,has_laboratory: false, status: :active, description: "")
# SEGUNDO AÑO-PRIMER SEMESTRE
Course.create(name: "TALLERES DE PSICOLOGIA", code: 1702118,has_laboratory: false, status: :active, description: "")
Course.create(name: "CALCULO EN VARIAS VARIABLES", code: 1702119,has_laboratory: false, status: :active, description: "")
Course.create(name: "TALLER DE LIDERAZGO Y COLABORACION", code: 1702120,has_laboratory: false, status: :active, description: "")
Course.create(name: "INNOVACION Y CREATIVIDAD", code: 1702121,has_laboratory: false, status: :active, description: "")
Course.create(name: "PROGRAMACION WEB 2	", code: 1702122,has_laboratory: false, status: :active, description: "")
Course.create(name: "REDACCION DE ARTICULOS E INFORMES DE INVESTIGACION", code: 1702123,has_laboratory: false, status: :active, description: "")
Course.create(name: "ESTRUCTURA DE DATOS Y ALGORITMOS", code: 1702124,has_laboratory: false, status: :active, description: "")
Course.create(name: "CIUDADANIA E INTERCULTURALIDAD", code: 1702125,has_laboratory: false, status: :active, description: "")
# SEGUNDO AÑO-SEGUNDO SEMESTRE
Course.create(name: "ESTADISTICA MATEMATICA, PROBABILIDADES Y METODOS EMPIRICOS", code: 1702226,has_laboratory: false, status: :active, description: "")
Course.create(name: "ARQUITECTURA DE COMPUTADORAS", code: 1702227,has_laboratory: false, status: :active, description: "")
Course.create(name: "METODOS DE INVESTIGACION Y REDACCION", code: 1702228,has_laboratory: false, status: :active, description: "")
Course.create(name: "INTERACCION HUMANO COMPUTADOR", code: 1702229,has_laboratory: false, status: :active, description: "")
Course.create(name: "ENFOQUE EMPRESARIAL", code: 1702230,has_laboratory: false, status: :active, description: "")
Course.create(name: "ANALISIS Y DISENO DE ALGORITMOS", code: 1702231,has_laboratory: false, status: :active, description: "")
Course.create(name: "ECOLOGIA Y MEDIO AMBIENTE	", code: 1702232,has_laboratory: false, status: :active, description: "")
# TERCER AÑO-PRIMER SEMESTRE
Course.create(name: "BASE DE DATOS", code: 1703133,has_laboratory: false, status: :active, description: "")
Course.create(name: "PROGRAMACION DE SISTEMAS", code: 1703134,has_laboratory: false, status: :active, description: "")
Course.create(name: "INGENIERIA Y PROCESOS DE SOFTWARE", code: 1703135,has_laboratory: false, status: :active, description: "")
Course.create(name: "TEORIA DE LA COMPUTACION", code: 1703136,has_laboratory: false, status: :active, description: "")
Course.create(name: "ORGANIZACION Y METODOS", code: 1703137,has_laboratory: false, status: :active, description: "")
Course.create(name: "INVESTIGACION DE OPERACIONES", code: 1703138,has_laboratory: false, status: :active, description: "")
# TERCER AÑO-SEGUNDO SEMESTRE
Course.create(name: "REDES Y COMUNICACION DE DATOS", code: 1703239,has_laboratory: false, status: :active, description: "")
Course.create(name: "TECNOLOGIA DE OBJETOS", code: 1703240,has_laboratory: false, status: :active, description: "")
Course.create(name: "SISTEMAS OPERATIVOS", code: 1703241,has_laboratory: false, status: :active, description: "")
Course.create(name: "FUNDAMENTOS DE SISTEMAS DE INFORMACION", code: 1703242,has_laboratory: false, status: :active, description: "")
Course.create(name: "CONSTRUCCION DE SOFTWARE", code: 1703243,has_laboratory: false, status: :active, description: "")
Course.create(name: "METODOS NUMERICOS", code: 1703244,has_laboratory: false, status: :active, description: "")
# CUARTO AÑO-PRIMER SEMESTRE
Course.create(name: "INTRODUCCION A LA FISICA COMPUTACIONAL	", code: 1704145,has_laboratory: false, status: :active, description: "")
Course.create(name: "TECNOLOGIAS DE INFORMACION", code: 1704146,has_laboratory: false, status: :active, description: "")
Course.create(name: "INTELIGENCIA ARTIFICIAL", code: 1704147,has_laboratory: false, status: :active, description: "")
Course.create(name: "DISENO Y ARQUITECTURA DE SOFTWARE", code: 1704148,has_laboratory: false, status: :active, description: "")
Course.create(name: "SISTEMAS DISTRIBUIDOS", code: 1704149,has_laboratory: false, status: :active, description: "")
Course.create(name: "AUDITORIA DE SISTEMAS", code: 1704150,has_laboratory: false, status: :active, description: "")
Course.create(name: "INGLES", code: 1704151,has_laboratory: false, status: :active, description: "")
# CUARTO AÑO-SEGUNDO SEMESTRE
Course.create(name: "GESTION DE PROYECTOS DE SOFTWARE", code: 1704252,has_laboratory: false, status: :active, description: "")
Course.create(name: "CALIDAD DE SOFTWARE", code: 1704253,has_laboratory: false, status: :active, description: "")
Course.create(name: "PRUEBAS DE SOFTWARE", code: 1704254,has_laboratory: false, status: :active, description: "")
Course.create(name: "INGENIERIA DE REQUERIMIENTOS", code: 1704255,has_laboratory: false, status: :active, description: "")
Course.create(name: "NEGOCIOS ELECTRONICOS (E)", code: 1704256,has_laboratory: false, status: :active, description: "")
Course.create(name: "INTRODUCCION AL DESARROLLO DE SOFTWARE DE ENTRETENIMIENTO (E)", code: 1704257,has_laboratory: false, status: :active, description: "")
Course.create(name: "INTRODUCCION AL DESARROLLO DE NUEVAS PLATAFORMAS (E)", code: 1704258,has_laboratory: false, status: :active, description: "")
Course.create(name: "ASPECTOS FORMALES DE ESPECIFICACION Y VERIFICACION", code: 1704259,has_laboratory: false, status: :active, description: "")
# QUINTO AÑO-PRIMER SEMESTRE
Course.create(name: "PROYECTO DE INGENIERIA DE SOFTWARE 1", code: 1705160,has_laboratory: false, status: :active, description: "")
Course.create(name: "PROYECTO DE TESIS", code: 1705161,has_laboratory: false, status: :active, description: "")
Course.create(name: "GESTION DE EMPRENDIMIENTO DE SOFTWARE", code: 1705162,has_laboratory: false, status: :active, description: "")
Course.create(name: "SEGURIDAD INFORMATICA", code: 1705163,has_laboratory: false, status: :active, description: "")
Course.create(name: "MANTENIMIENTO, CONFIGURACION Y EVOLUCION DE SOFTWARE", code: 1705164,has_laboratory: false, status: :active, description: "")
Course.create(name: "ETICA GENERAL Y PROFESIONAL", code: 1705165,has_laboratory: false, status: :active, description: "")
Course.create(name: "TOPICOS AVANZADOS EN BASES DE DATOS (E)", code: 1705166,has_laboratory: false, status: :active, description: "")
Course.create(name: "COMPUTACION GRAFICA, VISION COMPUTACIONAL Y MULTIMEDIA (E)", code: 1705167,has_laboratory: false, status: :active, description: "")
Course.create(name: "DESARROLLO AVANZADO EN NUEVAS PLATAFORMAS (E)", code: 1705168,has_laboratory: false, status: :active, description: "")
# QUINTO AÑO-SEGUNDO SEMESTRE
Course.create(name: "TOPICOS AVANZADOS EN INGENIERIA DE SOFTWARE", code: 1705269,has_laboratory: false, status: :active, description: "")
Course.create(name: "PRACTICAS PREPROFESIONALES", code: 1705270,has_laboratory: false, status: :active, description: "")
Course.create(name: "SEMINARIO DE TESIS", code: 1705271,has_laboratory: false, status: :active, description: "")
Course.create(name: "PROYECTO DE INGENIERIA DE SOFTWARE 2", code: 1705272,has_laboratory: false, status: :active, description: "")
Course.create(name: "GESTION DE SISTEMAS Y TECNOLOGIAS DE INFORMACION (E)", code: 1705273,has_laboratory: false, status: :active, description: "")
Course.create(name: "DESARROLLO DE SOFTWARE PARA JUEGOS (E)", code: 1705274,has_laboratory: false, status: :active, description: "")
Course.create(name: "PLATAFORMAS EMERGENTES (E)", code: 1705275,has_laboratory: false, status: :active, description: "")
