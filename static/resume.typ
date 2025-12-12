#import "header.typ": header-with-photo
#import "experience.typ": experience-block
#import "education.typ": education-timeline

#let color = rgb("#2c3e50")
#let contrast-color = rgb("#3d2b13")

#let margin-size = 0.5cm
#set page(
  margin: (top: margin-size, left: margin-size, bottom: margin-size, right: margin-size),
)
#set text(font: "Helvetica Neue", size: 10pt, fill: color)
#show raw: set text(
  font: "JetBrains Mono",
  size: 7.5pt,
  features: (calt: 1, liga: 1),
)
#show heading: set text(fill: color)

#header-with-photo(
  name: "Miguel Fuertes",
  tagline: "Let's Talk!",
  email: "mjfuertes@gmail.com",
  github: "hkfuertes",
  phone: "+34 656 616 069",
  bg-color: contrast-color,
)

#v(1em)

#experience-block()

#v(1fr)

#education-timeline(
  color: contrast-color,
)
