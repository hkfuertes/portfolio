#let photo-element(
  photo-path: "7235263.jpg",
  radious: 5%,
  photo-height: 100pt,
  bg-width: 140pt,
  fg-width: 100pt,
  bg-color: rgb("#546e7a"),
  line-color: rgb("#5d4e37"),
  line-width: 3pt,
) = {
  stack(
    dir: btt,
    rect(
      width: bg-width,
      height: photo-height,
      fill: bg-color,
      radius: radious,
      stroke: none,
    ),
    place(
      right,
      dx: -(fg-width - 1pt),
      dy: 0pt,
      rect(
        width: line-width,
        height: photo-height,
        fill: line-color,
        stroke: none,
      ),
    ),
    place(
      right + top,
      dx: 0pt,
      dy: 0pt,
      box(
        width: fg-width,
        height: photo-height,
        clip: true,
        inset: 0pt,
        radius: radious,
        image(photo-path, width: 100%, height: 100%, fit: "cover"),
      ),
    ),
  )
}

#let experience(
  logo-path: none,
  title: "",
  company: "",
  date-range: "",
  content: none,
  logo-width: 45pt,
  logo-height: 28pt,
  title-color: rgb("#2c3e50"),
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
      ],
    ),

    // Content (snippets o contenido personalizado)
    grid.cell(colspan: 2)[
      #content
    ],
  )
}
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
#let code-snippets(..snippets) = {
  let items = snippets.pos()
  for (i, snippet) in items.enumerate() {
    code-snippet(snippet.path, lang: snippet.lang)
  }
}

#let study(title, subtitle, detail,
  circle-stroke-color: red
) = {
  align(left + top)[
    #circle(
      radius: 5pt,
      fill: white,
      stroke: 2pt + circle-stroke-color,
    )
    #text(size: 11pt, weight: "bold")[
      #upper(title)
    ]
    #linebreak()
    #text(size: 9pt, weight: "light")[#subtitle]
    #linebreak()
    #text(size: 9pt, weight: "bold", style: "italic")[#detail]
  ]
}
