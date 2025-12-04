// ─────────────────────────────────────
// Config
// ─────────────────────────────────────

#let lang    = "hu"
#let region  = "HU"
#let product = "YearCompass"
#let kind    = "booklet"
#let paper   = "us-letter" // or "a4"
#let usage   = "printable"

#let doctitle = str(
  lang + "-" + region + "-" + product + "-" + kind + "-" + paper + "-" + usage
)

// ─────────────────────────────────────
// Translations
// ─────────────────────────────────────

#let tr = json(str(lang + "-" + region + "_translation.json"))
#let t(key) = tr.at(key, default: "[" + key + "]")

// ─────────────────────────────────────
// Document settings
// ─────────────────────────────────────

#set document(
  title: doctitle,
)

#set text(
  font: "New Computer Modern",
  lang: lang,
  region: region,
)

#set page(
  paper: paper,

  header: context {
    if counter(page).get().first() > 1 [
      #t("brand")
      #h(1fr)
      #t("year")
    ]
  },

  footer: context {
    let (num,) = counter(page).get()

    if num > 1 [
      #align(horizon)[
        #box(width: 1fr, baseline: -0.2em, line(length: 100%))
        #h(1em)
        « #num »
        #h(1em)
        #box(width: 1fr, baseline: -0.2em, line(length: 100%))
      ]
    ]
  },
)

// ─────────────────────────────────────
// Additional styles
// ─────────────────────────────────────

#show heading.where(level: 1): it => [
  #align(center)[#it.body]
  #line(length: 100%)
]
#show heading: smallcaps

#show rect: set rect(
  width: 100%,
  height: 100%,
  stroke: 0.1em + black,
  radius: 0.5em,
)

// ─────────────────────────────────────
// Content
// ─────────────────────────────────────

// Cover Page
#align(center + horizon)[
    #[
      #set text(size: 5em)
      #t("brand")
    ]
    #image("yc-logo.png", width: 60%)
]

#align(center + bottom)[
    #set text(size: 3em)
    #t("year")
]

// Inner Pages
#pagebreak()

= #t("The past year")
== #t("Going through your calendar")
#t("Go through last year's calendar week by week. If you see an important event, family gathering, friendly get-together or a significant project, write it down here.")
#block(
  height: 1fr,
)[
  #rect()
]