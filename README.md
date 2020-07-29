# Structural Priming

## The study

This project **examines the effect of [structural priming](https://en.wikipedia.org/wiki/Structural_priming#:~:text=Structural%20priming%20is%20a%20form,Bock%20introduced%20it%20in%201986%2C.) on three different groups of speakers**: Spanish native speakers, Spanish heritage speakers, and Spanish second-language speakers.

Participants were **primed with ditransitive constructions in Spanish**, which are characterized by the presence of the dative clitic "le". The study consisted of **four different phases**:

* A **baseline** (to assess average production rates of Spanish ditransitive constructions)
* A **treatment** (to prime participants)
* An **immediate post-test** (to assess priming effects after the priming intervention)
* A **delayed post-test** (to assess long-term effects of priming)

The methodology employed in all phases was an **oral picture description task**.

This study was published and can be found [here](http://www.lingref.com/bucld/44/BUCLD44-17.pdf).

## The data

All sentences produced were transcribed and coded attending to the following variables:

* ***Code***: each participant was assigned an independent code to be anonymously identified.
* ***Type of speaker***: whether the participant was a Spanish native speaker (L1), a Spanish heritage speaker (HS), or a Spanish second-language speaker (L2).
* ***Phase***: whether the sentence was produced in the baseline (1), treatment (2), immediate post-test (3) or delayed post-test (4).
* ***Sentence***: items in each of the phases were numbered.
* ***Repetition***: only applicable to the treatment phase. If the prime sentence contained the same verb as the target sentence, the transcription was coded as repeated (yes). Otherwise, it was coded as non-repeated (no).
* ***Clitic***: whether the sentence produced contained a clitic (yes) or not (no). This was the dependent variable in the study.

## The analysis

The goal of the study was to determine **whether speakers experienced a significant priming effect when exposed to Spanish ditransitive sentences containing dative clitics.**. Another goal of the study was to measure **whether the effect extended to any of the two post-tests**.

**Descriptive and inferential statistics** were run to measure the effect of priming in the three groups. Analyses conducted include:

* Mixed-effects binomial logistic regression models
* Estimated marginal means

## Technical information

All analyses were conducted using [R](https://www.r-project.org) running in [RStudio](https://rstudio.com).

Packages used include:

* [*tidyverse*](https://www.tidyverse.org)
* [*lme4*](https://cran.r-project.org/web/packages/lme4/index.html)
* [*optimx*](https://cran.r-project.org/web/packages/optimx/index.html)
* [*emmeans*](https://cran.r-project.org/web/packages/emmeans/index.html)

The code is documented in an R file.
