//#let experience-data = json("experience.json")
#let company-logos = (
  "Gartner": "logos/gartner.png",
  "Atos": "logos/atos.png",
  "Microsoft Sports": "logos/microsoft.png",
  "Vitale Inteligent Systems": "logos/vitale.jpg",
  "OpenBravo": "logos/openbravo.png",
  "Systia": "logos/systia.png",
)

#let title-color = rgb("#2c3e50")
// ========== TRIÁNGULOS DECORATIVOS ==========
#let corner-decorations(
  top-right-color: rgb("#546e7a"),    // Azul grisáceo (superior derecha)
  bottom-left-color: rgb("#5d4e37"),  // Marrón oscuro (inferior izquierda)
  triangle-size: 80pt,
  stroke-width: 1mm,                  // Grosor del efecto borde
) = {
  // Triángulo superior derecho - CAPA DE FONDO (marrón)
  place(
    top + right,
    dx: 1cm,    // Desplazar hacia dentro
    dy: -1cm,   // Desplazar hacia abajo
    polygon(
      fill: bottom-left-color,
      stroke: none,              // Sin stroke!
      (0pt, 0pt),
      (-(triangle-size + stroke-width), 0pt),
      (0pt, (triangle-size + stroke-width)),
    )
  )
  
  // Triángulo superior derecho - CAPA SUPERIOR (azul)
  place(
    top + right,
    dx: 1cm,
    dy: -1cm,
    polygon(
      fill: top-right-color,
      stroke: none,              // Sin stroke!
      (0pt, 0pt),
      (-triangle-size, 0pt),
      (0pt, triangle-size),
    )
  )
  
  // Triángulo inferior izquierdo (marrón)
  place(
    bottom + left,
    dx: -1cm,
    dy: 1cm,
    polygon(
      fill: bottom-left-color,
      stroke: none,
      (0pt, 0pt),
      (triangle-size, 0pt),
      (0pt, -triangle-size),
    )
  )
}

#let profile-photo(
  photo-path: "7235263.jpg",
  size: 100pt,              // Tamaño de la foto
  border-width: 2pt,        // Grosor del borde
  border-color: rgb("#5d4e37"),      // Color del borde
  offset-x: -10pt,          // Ajuste horizontal
  offset-y: 45pt,           // Ajuste vertical
) = {
  place(
    bottom + right,
    dx: 1cm + offset-x,
    dy: -1cm + offset-y,
    box(
      width: size,
      height: size,
      radius: 8%,          // Círculo perfecto
      clip: true,           // Recorta al círculo
      stroke: border-width + border-color,
      fill: white,
      image(photo-path, width: 100%, height: 100%, fit: "cover")
    )
  )
}


// ========== FUNCIONES DE EXPERIENCIA ==========
// Función principal para renderizar experiencias laborales
#let experience(
  logo-path: none,
  title: "",
  company: "",
  date-range: "",
  content: none,
  logo-width: 45pt,
  logo-height: 28pt,
) = {
  grid(
    columns: (50pt, 1fr),
    column-gutter: 1em,
    row-gutter: 0.4em,
    
    // Logo
    align(center + horizon)[
      #box(width: logo-width, height: logo-height)[
        #align(center + horizon)[
          #if logo-path != none [
            #image(logo-path, fit: "contain", width: 100%, height: 100%)
          ]
        ]
      ]
    ],
    
    // Header (título + empresa + fechas)
    grid(
      columns: (1fr, auto),
      
      [
        #text(size: 13pt, weight: "bold", fill: title-color)[
          #title
        ]
        #linebreak()
        #text(size: 10pt)[#company]
      ],
      
      align(right + horizon)[
        #text(size: 8pt, fill: rgb("#666"))[
          #date-range
        ]
      ]
    ),
    
    // Content (snippets o contenido personalizado)
    grid.cell(colspan: 2)[
      #content
    ]
  )
}
// Helper para un solo snippet de código
#let code-snippet(file-path, lang: "text") = {
  block(
    fill: rgb("#f8f9fa"),
    width: 100%,
    inset: 0.7em,
    radius: 4pt,
  )[
    #raw(read(file-path), lang: lang, block: true)
  ]
}
// Helper para múltiples snippets
#let code-snippets(..snippets) = {
  let items = snippets.pos()
  for (i, snippet) in items.enumerate() {
    code-snippet(snippet.path, lang: snippet.lang)
  }
}
// ========== CONFIGURACIÓN DE PÁGINA ==========
#set page(
  margin: (x: 1cm, y: 1cm),
  fill: white,
  flipped: true,
)
#set text(font: "Helvetica Neue", size: 10pt, fill: rgb("#2c3e50"))
#show raw: set text(
  font: ("JetBrains Mono"),  // Typst busca automáticamente en ./fonts/
  size: 7.5pt,
  features: (calt: 1, liga: 1)  // Activa ligaduras
)
#show heading: set text(fill: title-color)


// ========== AÑADIR TRIÁNGULOS DECORATIVOS ==========

#corner-decorations()
#profile-photo()

// ========== LAYOUT PRINCIPAL ==========


#grid(
  columns: (3fr, 1fr),
  column-gutter: 1.5cm,
  
  // === COLUMNA PRINCIPAL (2/3) - EN 2 SUBCOLUMNAS ===
  [
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 1em,
      
      // ========== SUBCOLUMNA 1 ==========
      [
        // Gartner
        #experience(
          logo-path: company-logos.at("Gartner"),
          title: "Backend Developer",
          company: "Gartner",
          date-range: "Jun 2022\nDec 2025",
          content: code-snippets(
            (path: "snippets/gartner.ex", lang: "elixir"),
            (path: "snippets/gartner.rb", lang: "ruby"),
          )
        )
        #v(.5em)
        // Atos
        #experience(
          logo-path: company-logos.at("Atos"),
          title: "Lead Developer",
          company: "Atos",
          date-range: "Mar 2019\nJun 2022",
          content: code-snippet("snippets/atos.cs", lang: "cs")
        )
        #v(.5em)
      ],
      
      // ========== SUBCOLUMNA 2 ==========
      [
        #v(1em)
        // Microsoft Sports
        #experience(
          logo-path: company-logos.at("Microsoft Sports"),
          title: "Program Manager",
          company: "Microsoft Sports",
          date-range: "Oct 2016\nMar 2019",
          content: block(
            fill: rgb("#f8f9fa"),
            width: 100%,
            inset: 0.7em,
            radius: 4pt,
          )[
            #set text(size: 8pt)
            
            #grid(
              columns: (1fr, 1fr, 1fr),
              column-gutter: 0.4em,
              row-gutter: 0.6em,
              
              align(center)[
                #block(fill: rgb("#3498db"), inset: 0.3em, radius: 2pt)[
                  #set text(fill: white, size: 6pt, weight: "bold")
                  Real Madrid
                ]
              ],
              align(center)[
                #block(fill: rgb("#3498db"), inset: 0.3em, radius: 2pt)[
                  #set text(fill: white, size: 6pt, weight: "bold")
                  LaLiga
                ]
              ],
              align(center)[
                #block(fill: rgb("#3498db"), inset: 0.3em, radius: 2pt)[
                  #set text(fill: white, size: 6pt, weight: "bold")
                  Club Brugge
                ]
              ],
              
              align(center)[↓], align(center)[↓], align(center)[↓],
              
              grid.cell(colspan: 3)[
                #align(center)[
                  #block(fill: rgb("#e74c3c"), inset: 0.5em, radius: 3pt, width: 55%)[
                    #set text(fill: white, size: 7pt, weight: "bold")
                    Program Manager
                    
                    #set text(size: 5pt, weight: "regular")
                    Coordinate • PoC • Platform
                  ]
                ]
              ],
              
              grid.cell(colspan: 3)[#align(center)[↓]],
              
              grid.cell(colspan: 3)[
                #align(center)[
                  #block(fill: rgb("#2c3e50"), inset: 0.4em, radius: 2pt, width: 65%)[
                    #set text(fill: white, size: 6pt, weight: "bold")
                    MSDP Platform
                    
                    #set text(size: 5pt, weight: "regular")
                    Azure • C\# • B2C • DevOps
                  ]
                ]
              ],
              
              align(center)[
                #block(fill: rgb("#3498db"), inset: 0.2em, radius: 2pt)[
                  #set text(fill: white, size: 5pt, weight: "bold")
                  FIVB
                ]
              ],
              align(center)[
                #block(fill: rgb("#3498db"), inset: 0.2em, radius: 2pt)[
                  #set text(fill: white, size: 5pt, weight: "bold")
                  FIT
                ]
              ],
              align(center)[
                #text(size: 5pt)[+ more]
              ],
            )
            
            #v(0.2em)
            
            #align(center)[
              #text(size: 6pt, fill: rgb("#666"), style: "italic")[
                Managed implementations & Azure PoCs
              ]
            ]
          ]
        )
        #v(.5em)
        // Vitale
        #experience(
          logo-path: company-logos.at("Vitale Inteligent Systems"),
          title: "FullStack Developer",
          company: "Vitale Inteligent Systems",
          date-range: "Oct 2015\nOct 2016",
          content: code-snippet("snippets/vitale.php", lang: "php")
        )
        #v(.5em)
        // OpenBravo
        #experience(
          logo-path: company-logos.at("OpenBravo"),
          title: "Support Developer",
          company: "OpenBravo",
          date-range: "Jun 2015\nOct 2015",
          content: code-snippet("snippets/openbravo.java", lang: "java")
        )
        #v(.5em)
        // Systia
        #experience(
          logo-path: company-logos.at("Systia"),
          title: "PM & Fullstack Engineer",
          company: "Systia",
          date-range: "Sep 2013\nJun 2015",
          content: ""
        )
      ]
    )
  ],
  
  // === COLUMNA DERECHA (1/3) - SIDEBAR ===
  [
    // Aquí irá el contenido del sidebar
  ]
)
