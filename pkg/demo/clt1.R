##################################################
# The Central Limit Theorem                       


clt1 <- function(population = "rt",
                 r = 3,
                 sample.size = 2,
                 N.iter = 100000){

#################################################################
# initialize variables
population <- get(population, mode = "function")
xbar <- rep(0, N.iter)
graphics.off()

curve( function(x) dt(x, df = r ),
        xlim = c(-5,5),
        xlab = "Support Set",
        ylab = "Density",
        lwd = 2,
        main = "The Population Distribution \n (while we're waiting)" )
abline( h = 0 , col = "grey" )


########################################
# Label the plot with mu
text(   5, 
        dt(0, df = r )*0.9, 
        bquote( mu ==.(0) ),
        cex = 1.5, 
        pos = 2 )              

# Label the plot with sigma^2
text(   5, 
        dt(0, df = r )*0.8, 
        bquote( sigma^2 ==.(r/(r-2)) ),
        cex = 1.5, 
        pos = 2 )


#################################################
# simulate xbar's

xbar <- rowMeans( matrix(population(sample.size * N.iter, df = r),
                         nrow = N.iter)
                 )

# Find mean and variance of xbar
xbar.mean <- round( mean( xbar ), 4)
xbar.var <- round( var( xbar ), 4)

# window for graph
low <- xbar.mean - 3*sqrt(xbar.var)
up <- xbar.mean + 3*sqrt(xbar.var)

dev.new()
dev.set(3)
# Draw histogram of simulated x-bars
hist(   xbar,
        breaks = 280,
        xlim = c(low,up),
        xlab = "",
        prob = TRUE,
        main = "Sampling Distribution of X-bar",
        sub = "Click to see Limiting Normal Density (in red)")

########################################
# Label the histogram with mean(xbar)
text(   up, 
        dnorm(xbar.mean, mean = xbar.mean, sd = sd(xbar)), 
        bquote( mean(xbar)==.(xbar.mean) ),
        cex = 1, 
        pos = 2 )              

# Label the histogram with var(xbar)
text(   up, 
        dnorm(xbar.mean, mean = xbar.mean, sd = sd(xbar))*0.9, 
        bquote( var(xbar) ==.(xbar.var) ),
        cex = 1, 
        pos = 2 )
        
# Label the histogram with n
text(   up, 
        dnorm(xbar.mean, mean = xbar.mean, sd = sd(xbar))*0.8, 
        bquote( n ==.(sample.size) ),
        cex = 1.85, 
        pos = 2 )              
        
######################################
# Draw limiting Normal curve
z <- locator( n = 1 )      
curve(  function(x) dnorm(x, mean = xbar.mean, sd = sd(xbar)), 
        lwd = 2,
        col = "red",
        add = TRUE )
}


