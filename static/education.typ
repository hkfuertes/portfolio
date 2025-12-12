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
  set text(font: "Helvetica Neue", fill: color)
  let color = color.lighten(10%)

  box(
    inset: (top: 1em, bottom: 1.5em, left: 0em, right: 0em),
    stack(
      spacing: 1em,
      {
        let n = items.len()

        grid(
          columns: n,
          column-gutter: 0pt,

          ..items
            .enumerate()
            .map(((i, _)) => {
              align(horizon)[
                #stack(
                  rect(
                    width: 100%,
                    height: 1pt,
                    fill: color.darken(20%),
                  ),
                  place(
                    left + horizon,
                    dy: -0.5pt,
                    circle(
                      radius: 5pt,
                      fill: color,
                      stroke: none,
                    ),
                  ),
                )
              ]
            })
        )
      },
      grid(
        columns: items.len(),
        column-gutter: 8pt,
        ..items.map(it => {
          let text-color = if it.studies == false {
            color.lighten(30%)
          } else {
            color
          }

          align(left + top)[
            #text(size: 11pt, weight: "bold", fill: text-color)[
              #upper(it.title)
            ]
            #linebreak()
            #text(size: 9pt, weight: "light", fill: text-color)[#it.subtitle]
            #linebreak()
            #text(size: 9pt, fill: text-color, weight: "bold", style: "italic")[#it.detail]
          ]
        }),
      ),
    ),
  )
}
