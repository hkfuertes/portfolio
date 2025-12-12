#import "widgets.typ": study

#let education-timeline(
  items: (
    (title: "Nebrija", subtitle: "Madrid · 2022", detail: "Teaching Master", studies: true),
    (title: "UPNA", subtitle: "Pamplona · 2019", detail: "Biomedical Engineering Master", studies: true),
    (title: "UPNA", subtitle: "Pamplona · 2014", detail: "Computer Science Major", studies: true),
    (title: "Millersville", subtitle: "Lancaster · 2012", detail: "Year Abroad", studies: false),
    (title: "UPNA", subtitle: "Pamplona · 2011", detail: "Computer Science Minor", studies: true),
  ),
  color: rgb("#2b3440"),
) = {
  set text(font: "Helvetica Neue", fill: white)
  let color = color.lighten(10%)

  box(
    fill: color,
    radius: 5%,
    width: 100%,
    pad(
      8pt,
      stack(
        {
          let text-size = 12pt
          text(size: text-size, weight: "bold")[
            #upper("Edu")
          ]
          h(-3pt)
          text(size: text-size, weight: "light")[
            #upper("cation")
          ]
        },
        v(8pt),
        place(
          dy: 4pt,
          rect(
            width: 100%,
            height: 1pt,
            fill: white,
          ),
        ),
        grid(
          columns: items.len(),
          column-gutter: 6pt,
          ..items.map(it => study(it.title, it.subtitle, it.detail, circle-stroke-color: color)),
        ),
      ),
    ),
  )
}
