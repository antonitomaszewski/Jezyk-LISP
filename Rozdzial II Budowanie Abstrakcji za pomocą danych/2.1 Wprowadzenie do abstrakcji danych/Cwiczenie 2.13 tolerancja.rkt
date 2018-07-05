#lang racket

mamy x i y (przedzialły)
i chcemy pokazać, że dla małych niepewności (w %)
T(mult(x,y)) ~~ T(x) + T(y)

mamy x, C(x) T(x), gdzie są to kolejno przedział, środek i tolerancja (dla y analogicznie)
, wtedy:
x = [C(x)*(1-T(x)), C(x)*(1+T(x))]
y = [C(y)*(1-T(y)), C(y)*(1+T(y))], wtedy dla dodatnich wszystkich punktów mamy
x*y = [C(x)*C(y)*(1-T(x))*(1-T(y)), C(x)*C(y)*(1+T(x))*(1+T(y))]
czyli
x*y = [C(x)*C(y)*(1-T(x)-T(y)+T(x)*T(y)), C(x)*C(y)*(1+T(x)+T(y)+T(x)*T(y))]
a skoro T(x) oraz T(y) są niewielkie, wtedy
T(x)*T(y) są na tyle małe, że można przy obliczeniach je pominąć i przybliżyć wynik do
x*y ~~ [C(x)*C(y)*(1-T(x)-T(y)), C(x)*C(y)*(1+T(x)+T(y))]
czyli T(x*y) ~~ (T(x) + T(y))