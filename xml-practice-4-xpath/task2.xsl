<!-- 1 -->
catalog/cd[@id="8c0a600b"]/tracklist/track[@length='4:04']

<!-- 2 -->
catalog/cd/tracklist/track[string-length() mod 2 = 0]

<!-- 3 -->
catalog/cd/tracklist/track[string-length() > 35]

<!-- 4 -->
catalog/cd/tracklist/track[string-length() > 15]/string-length()

<!-- 5 -->
catalog/cd/tracklist/track[last()]

<!-- 6 -->
catalog/cd/tracklist/track[position() = 5]

<!-- 7 -->
catalog/cd/tracklist/count(track)

<!-- 8 -->
catalog/cd/tracklist/track[matches(text(), 'Ya soshla s uma')]

<!-- 9 -->
catalog/cd/tracklist/track[starts-with(text(), 'D')]

<!-- 10 -->
catalog/cd/tracklist/track[ends-with(text(), 'sta')]

<!-- 11 -->
catalog/cd/tracklist/track/upper-case(text())

<!-- 12 -->
catalog/cd[tracklist/track[@length = '3:55' and text() = 'Robot (Robotronik)']]/year

<!-- 13 -->
count(catalog/cd/tracklist/track) div catalog/count(cd)

<!-- 14 -->
.//cd/concat("title : ", title/text(), " | published year : ", year/text()) 