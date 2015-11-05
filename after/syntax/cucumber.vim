syn region cucumberGivenString start=/"/ skip=/\\"/ end=/"/ contained containedin=cucumberGivenRegion,cucumberGivenAndRegion,cucumberGivenButRegion
syn region cucumberWhenString start=/"/ skip=/\\"/ end=/"/ contained containedin=cucumberWhenRegion,cucumberWhenAndRegion,cucumberWhenButRegion
syn region cucumberThenString start=/"/ skip=/\\"/ end=/"/ contained containedin=cucumberThenRegion,cucumberThenAndRegion,cucumberThenButRegion

hi def link cucumberGivenString cucumberString
hi def link cucumberWhenString cucumberString
hi def link cucumberThenString cucumberString
