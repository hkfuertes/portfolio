#let photo-element(
  photo-path: "7235263.jpg",
  right-radious: 5%,
  photo-height: 100pt,
  bg-width: 140pt,
  fg-width: 100pt,
  pad-left: -1cm,
  bg-color: rgb("#546e7a"),
  line-color: rgb("#5d4e37"),
  line-width: 3pt,
) = {
  pad(
    left: pad-left,
    stack(
      dir: btt,
      rect(
        width: bg-width - pad-left,
        height: photo-height,
        fill: bg-color,
        radius: (right: right-radious),
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
          radius: (right: right-radious),
          image(photo-path, width: 100%, height: 100%, fit: "cover"),
        ),
      ),
    ),
  )
}

#let header-with-photo(
  name: "Miguel Fuertes",
  tagline: "Let's Talk!",
  email: "mjfuertes@gmail.com",
  github: "hkfuertes",
  phone: "+34 656 616 069",
  photo-path: "7235263.jpg",
  icon-mail: "icons/mail.svg",
  icon-github: "icons/brand-github.svg",
  icon-phone: "icons/phone.svg",
  name-color: rgb("#2c3e50"),
  tagline-color: rgb("#2c3e50"),
  contact-color: rgb("#2c3e50"),
  photo-size: 80pt,
  icon-size: 10pt,
  font-family: "Helvetica Neue",
) = {
  set text(font: font-family)

  grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    align(horizon)[
      #pad(
        left: -1cm,
        photo-element(
          photo-path: "7235263.jpg",
          photo-height: 64pt,
          bg-width: 96pt,
          fg-width: 64pt,
        ),
      )
    ],

    align(left + horizon)[
      #text(size: 14pt, weight: "light", fill: tagline-color)[#tagline]
      #linebreak()
      #text(size: 32pt, weight: "regular", fill: name-color)[
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
          #text(size: 9pt, fill: contact-color)[#email]
        ],
        [
          #box(
            height: icon-size,
            baseline: 20%,
            image(icon-github, width: icon-size, height: icon-size),
          )
          #text(size: 9pt, fill: contact-color)[#github]
        ],
        [
          #box(
            height: icon-size,
            baseline: 20%,
            image(icon-phone, width: icon-size, height: icon-size),
          )
          #text(size: 9pt, fill: contact-color)[#phone]
        ],
      )
    ],
  )
}
