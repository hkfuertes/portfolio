//#let experience-data = json("experience.json")
#import "header.typ": header-with-photo
#import "experience.typ": experience-block

#let title-color = rgb("#2c3e50")

#set page(
  margin: (x: 1cm, y: 1cm),
  fill: white,
)
#set text(font: "Helvetica Neue", size: 10pt, fill: rgb("#2c3e50"))
#show raw: set text(
  font: "JetBrains Mono",
  size: 7.5pt,
  features: (calt: 1, liga: 1),
)
#show heading: set text(fill: title-color)

#header-with-photo(
  name: "Miguel Fuertes",
  tagline: "Let's Talk!",
  email: "mjfuertes@gmail.com",
  github: "hkfuertes",
  phone: "+34 656 616 069",
)

#v(1em)

#experience-block()