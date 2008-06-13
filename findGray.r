findGray.utils <- function(lcDataFile) {
#
	data <- read.table(lcDataFile, header=TRUE)
	nObjFilt <- max(data$ObjFiltId)
	nLcPoints <- length(data$ObjFiltId)
	#
	tGrid <- 0
	kGray <- 0
	fluxMean <- array(0, c(nObjFilt))
	fluxInvSigma <- array(0, c(nLcPoints))

# use the inverse fluxErr for computational efficiency
	fluxInvSigma <- 1.0/data$FluxErr

	deltas <- 0
	cdf <- 0
	cdfGrid <- seq(-10.0, 10.0, 0.05)

	idxObjFilt <- vector("list", nObjFilt)
	seq <- 1:nLcPoints
	#
	for (n in 1:nObjFilt) {
		idx <- data$ObjFiltId==(n-1)
		idxObjFilt[[n]] = seq[idx]
	}

	
	list(
		calcTGrid = function(dtRes) {
			tArray <- sort(data$Time)
			len <- length(tArray)
			tGrid <<- c(tArray[1])
			i <- 1
			j <- 1
			while (i <= len) {
				thisT <- tGrid[j]
				while ( (i <= len) && (thisT + dtRes > tArray[i])) i <- i+1
				tGrid <<- c(tGrid, tArray[i])
				i <- i+1
				j <- j+1
			}
		},

#
# guessKgray forms an initial guess at kGray
#
		guessKgray = function() {
			kGray <<- array(0, c(length(tGrid)))
			navg <- array(0, c(length(tGrid)))
			for (n in 1:nObjFilt) {
				t <- data$Time[idxObjFilt[[n]]]
				flux <- data$Flux[idxObjFilt[[n]]]
				invSigma <- fluxInvSigma[idxObjFilt[[n]]]
				maxFlux = max(flux)
				iseq = 1:length(t)
				for (i in 1:length(t)) {
					# find the point k in tGrid closest to t[i]
					tdiff <- abs(tGrid - t[i])
					idx = rank(tdiff)==1
					k = iseq[idx]
					navg[k] <- navg[k] + invSigma[i]
					kGray[k] <<- kGray[k] + flux[i]/maxFlux * invSigma[i]
				}
			}
			kGray <<- kGray / navg
		},

		getKgray = function() {
			return(approxfun(tGrid, kGray))
		},

#
# given the vector kGrayArg, which specifies kGray at the time points in tGrid,
# calculate the merit function.
#
		calcFOM = function(kGrayArg) {
			kGrayFun = approxfun(tGrid, kGrayArg)
			fluxCorr = data$Flux / kGrayFun(data$Time)
			deltas <<- array(0, c(nLcPoints))
			for (n in 1:nObjFilt) {
				idx <- idxObjFilt[[n]]
				fluxMean[n] <<- mean(fluxCorr[idx])
				deltas[idx] <<- (fluxCorr[idx] - fluxMean[n])
			}
			deltas <<- deltas * fluxInvSigma
			cdf <<- ecdf(deltas)
			xcdf <- mget("x",environment(cdf))
			xcdfvals <- xcdf$x
			ycdf <- mget("y",environment(cdf))
			ycdfvals <- ycdf$y
			cdfapprox <- approx(xcdfvals, ycdfvals, cdfGrid)
			normcdf <- pnorm(cdfGrid,mean=0,sd=1)
			return(sum((cdfapprox$y - normcdf)**2))			
		},

		getDeltas = function() {
			return(deltas)
		},

		getCdf = function() {
			return(cdf)
		},

		getTGrid = function() {
			return(tGrid)
		},

		getData = function() {
			return(data)
		},

		getLcIdx = function(i) {
			return(idxObjFilt[[i+1]])
		}
	)
}

		


		
