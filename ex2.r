demographicData <- read.csv("data/questionarioDemograficoB.csv")
selectionData <- read.csv("data/SelecaoB.csv")
selectionTimeData <- read.csv("data/SelecaoTimeB.csv")
str(mydata)
str(selectionData)
str(selectionTimeData)

usersVisualProblems <- subset(demographicData, E == "Visual nao corrigida")$user
usersVisualProblemsCorrectTasks <- subset(selectionData, selectionData[,1] %in% usersVisualProblems & SOUB == 'correct')[,1]
usersVisualProblemsTimeCorrectTasks <- subset(selectionTimeData, selectionTimeData[,1] %in% usersVisualProblemsCorrectTasks)$SOUB
usersVisualProblemsMeanTimeCorrectTasks <- mean(usersVisualProblemsTimeCorrectTasks)

usersWithoutVisualProblems <- subset(demographicData, E != "Visual nao corrigida")$user
usersWithoutVisualProblemsCorrectTasks <- subset(selectionData, selectionData$ï..user %in% usersWithoutVisualProblems & SOUB == 'correct')[,1]
usersWithoutVisualProblemsTimeCorrectTasks <- subset(selectionTimeData, selectionTimeData[,1] %in% usersWithoutVisualProblemsCorrectTasks)$SOUB
usersWithoutVisualProblemsMeanTimeCorrectTasks <- mean(usersWithoutVisualProblemsTimeCorrectTasks)

drawData <- read.csv("data/DrawB.csv")
drawTimeData <- read.csv("data/DrawTimeB.csv")
str(drawData)
str(drawTimeData)

usersPortugueseEnglishOnly <- subset(demographicData, A == "Portugues-Ingles")$user
usersPortuguesEnglishOnlyDraw <- subset(drawData, drawData[,1] %in% usersPortugueseEnglishOnly)$MMM
usersPortuguesEnglishOnlyDrawSorted <- sort(usersPortuguesEnglishOnlyDraw)
worstTimesDraw <- head(sort(drawData$MMM), n = length(usersPortugueseEnglishOnly))
worstTimesDrawUsers <- head(subset(drawData, drawData$MMM %in% worstTimesDraw)[,1], n = length(worstTimesDraw))