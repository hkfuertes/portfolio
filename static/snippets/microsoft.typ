#let microsoft-content() = {
  block(
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
          #block(fill: rgb("#e74c3c"), inset: 0.5em, radius: 3pt, width: 100%)[
            #set text(fill: white, size: 7pt, weight: "bold")
            Program Manager

            #set text(size: 5pt, weight: "regular")
            Coordinate • PoC • Platform
          ]
        ]
      ],

      grid.cell(colspan: 3)[#align(center)[↕]],

      grid.cell(colspan: 3)[
        #align(center)[
          #block(fill: rgb("#2c3e50"), inset: 0.4em, radius: 2pt, width: 100%)[
            #set text(fill: white, size: 6pt, weight: "bold")
            MSDP Platform

            #set text(size: 5pt, weight: "regular")
            Azure • C\# • B2C • DevOps
          ]
        ]
      ],

      align(center)[↑], align(center)[↑], align(center)[ ],

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
    )

    #v(0.2em)

    #align(center)[
      #text(size: 6pt, fill: rgb("#666"), style: "italic")[
        Managed implementations & Azure PoCs
      ]
    ]
  ]
}
