x= data.frame(x=runif(1000) * 64,y=runif(1000)*64)
y= data.frame(x=runif(1000) * 64,y=runif(1000)*64)
z= data.frame(x=runif(1000) * 64,y=runif(1000)*64)
bbf = data.frame(x1= x, x2 = y, x3 = z)
bbf= bbf[ abs(bbf$x1.x - bbf$x2.x) >3  &  abs(bbf$x1.x - bbf$x3.x) >3 & abs(bbf$x3.x - bbf$x2.x) >3,]
bbf= bbf[ abs(bbf$x1.y - bbf$x2.y) >3  &  abs(bbf$x1.y - bbf$x3.y) >3 & abs(bbf$x3.y - bbf$x2.y) >3,]
cos1 = (((bbf$x2.x - bbf$x1.x)*(bbf$x3.x - bbf$x1.x) + (bbf$x2.y - bbf$x1.y)*(bbf$x3.y - bbf$x1.y))/ (sqrt((bbf$x2.x - bbf$x1.x)^2 + (bbf$x3.x - bbf$x1.x)^2) * sqrt((bbf$x2.y - bbf$x1.y)^2 + (bbf$x3.y - bbf$x1.y)^2)))

cos2 = (((bbf$x1.x - bbf$x2.x)*(bbf$x3.x - bbf$x2.x) + (bbf$x1.y - bbf$x2.y)*(bbf$x3.y - bbf$x2.y))/ (sqrt((bbf$x2.x - bbf$x1.x)^2 + (bbf$x3.x - bbf$x2.x)^2) * sqrt((bbf$x2.y - bbf$x1.y)^2 + (bbf$x3.y - bbf$x2.y)^2)))

cos3 = (((bbf$x2.x - bbf$x3.x)*(bbf$x1.x - bbf$x3.x) + (bbf$x2.y - bbf$x3.y)*(bbf$x1.y - bbf$x3.y))/ (sqrt((bbf$x2.x - bbf$x3.x)^2 + (bbf$x3.x - bbf$x1.x)^2) * sqrt((bbf$x2.y - bbf$x3.y)^2 + (bbf$x3.y - bbf$x1.y)^2)))
p=0.9
triangles = bbf[ cos1 < p & cos1 > -p & cos2 < p & cos2 > -p & cos3 < p & cos3 > -p, ] 
#########################################################

x= data.frame(x=runif(700) * 64,y=runif(700)*64)
z= runif(700) * 32
bbf2 = data.frame(x= x, r = z)
circles= bbf2[ bbf2$r >3  & (bbf2$r + bbf2$x.x) < 64 & (bbf2$r + bbf2$x.y) < 64 & (bbf2$x.x - bbf2$r) > 0 & (bbf2$x.y - bbf2$r) > 0 & bbf2$x.x > 5 & bbf2$x.y > 5 & bbf2$x.x < 59 & bbf2$x.y < 59,]

plot.window(c(0,64), c(0,64))
library(plotrix)

for (i in 1:dim(circles)[1])
{
   
   plot.new()
   plot.window(c(0,64), c(0,64))
   draw.circle(circles[i,1],circles[i,2],circles[i,3],nv=100,border=NULL,col="black",lty=1,lwd=1)
dev.copy(jpeg, paste(c("r", i, ".jpeg"), collapse = ''), bg="white")   
dev.off()
}