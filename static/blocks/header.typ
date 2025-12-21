#import "../widgets.typ": photo-element

#let header-with-photo(
  name: "Miguel Fuertes",
  tagline: "Let's Talk!",
  email: "mjfuertesf@gmail.com",
  github: "hkfuertes",
  phone: "+34 656 616 069",
  photo-path: "../7235263.jpg",
  icon-mail: "../icons/mail.svg",
  icon-github: "../icons/brand-github.svg",
  icon-phone: "../icons/phone.svg",
  color: rgb("#2c3e50"),
  bg-color: rgb("#ecf0f1"),
  icon-size: 10pt,
  font-family: "Helvetica Neue",
) = {
  set text(font: font-family)

  grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    align(horizon)[
      #photo-element(
          photo-path: "7235263.jpg",
          photo-height: 64pt,
          bg-width: 70pt,
          fg-width: 64pt,
          bg-color: bg-color,
          line-color: bg-color.darken(20%),
          line-width: 2pt
        )
    ],
    align(left + horizon)[
      #text(size: 14pt, weight: "light", fill: color)[#tagline]
      #linebreak()
      #text(size: 32pt, weight: "regular", fill: color)[
        #upper(name)
      ]
      #grid(
        columns: 3,
        column-gutter: .5em,
        [
          #box(
            height: icon-size,
            baseline: 20%,
            image(icon-mail, width: icon-size, height: icon-size),
          )
          #text(size: 9pt, fill: color)[#email]
        ],
        [
          #box(
            height: icon-size,
            baseline: 20%,
            image(icon-github, width: icon-size, height: icon-size),
          )
          #text(size: 9pt, fill: color)[#github]
        ],
        [
          #box(
            height: icon-size,
            baseline: 20%,
            image(icon-phone, width: icon-size, height: icon-size),
          )
          #text(size: 9pt, fill: color)[#phone]
        ],
      )
    ]
  )
}
