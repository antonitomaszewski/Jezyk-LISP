#lang racket

Przy (mod (fast-expt base exp) m) będziemy robić mnożenia oraz ostateczne dzielenie modulo na bardzo duzych liczbach, co mocno spowolni czas pracy interpretera
dzięki temu, że robimy dzielenie modulo, za każdym razem, nie pozwalamy wyjśc naszej liczbie poza < m