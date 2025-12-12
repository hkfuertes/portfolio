#import "../snippets/microsoft.typ": microsoft-content
#import "../widgets.typ": code-snippet, code-snippets, experience

#let company-logos = (
  "Gartner": "logos/gartner.png",
  "Atos": "logos/atos.png",
  "Microsoft Sports": "logos/microsoft.png",
  "Vitale Inteligent Systems": "logos/vitale.jpg",
  "OpenBravo": "logos/openbravo.png",
  "Systia": "logos/systia.png",
)

#let experience-block() = {
  grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    [
      // Gartner
      #experience(
        logo-path: company-logos.at("Gartner"),
        title: "Senior Backend Developer",
        company: "Gartner",
        date-range: "Jun 2022\nDec 2025",
        content: code-snippets(
          (path: "snippets/gartner.ex", lang: "elixir"),
          (path: "snippets/gartner.rb", lang: "ruby"),
        ),
      )
      #v(.5em)
      // Atos
      #experience(
        logo-path: company-logos.at("Atos"),
        title: "Lead Developer",
        company: "Atos",
        date-range: "Mar 2019\nJun 2022",
        content: code-snippet("snippets/atos.cs", lang: "cs"),
      )
    ],
    [
      #v(1em)
      // Microsoft Sports
      #experience(
        logo-path: company-logos.at("Microsoft Sports"),
        title: "Program Manager",
        company: "Microsoft Sports",
        date-range: "Oct 2016\nMar 2019",
        content: microsoft-content(),
      )
      #v(.5em)
      // Vitale
      #experience(
        logo-path: company-logos.at("Vitale Inteligent Systems"),
        title: "FullStack Developer",
        company: "Vitale Inteligent Systems",
        date-range: "Oct 2015\nOct 2016",
        content: code-snippet("snippets/vitale.php", lang: "php"),
      )
      #v(.5em)
      // OpenBravo
      #experience(
        logo-path: company-logos.at("OpenBravo"),
        title: "Support Developer",
        company: "OpenBravo",
        date-range: "Jun 2015\nOct 2015",
        content: code-snippet("snippets/openbravo.java", lang: "java"),
      )
      #v(.5em)
      // Systia
      #experience(
        logo-path: company-logos.at("Systia"),
        title: "PM & FullStack Engineer",
        company: "Systia",
        date-range: "Sep 2013\nJun 2015",
        content: "",
      )
    ],
  )
}
