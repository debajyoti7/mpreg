library(rex)

###Engines

##maruti
maruti12 <- rex(

  start,

  #K
  alpha,

  #12, 8, 10
  group(between(digit,1,2)),

  #MN, BIN, DN
  group(between(alpha,2,3)),

  #1260537, 3718985, 4353783
  group(between(digit,6,7)),

  end

)



maruti11 <- rex(

  start,

  #D, F, M, G
  alpha,

  #13A, 8DN, 16A, 12BN
#   group(n_times(digit,2), alpha)
#   %or%
#   group(digit, n_times(alpha,2))
#   %or%
#   group(n_times(digit,2), n_times(alpha,2))
#   %or%
  group(between(digit, 1,2), between(alpha, 1,2)),


  #1626257, 4771268, 421780
  group(between(digit,6,7)),

  end

)


##hyundai
hyundai18 <- rex(

  start,

  #MALBB
  group(between(alpha,4,5)),

  #51
  group(between(digit,1,2)),

  #HLCM
  group(between(alpha,2,3)),

  #753578
  group(between(digit,6,7)),

  #C
  alpha,

  end

)

hyundai12 <- rex(

  start,

  #G
  group(n_times(alpha,1)),

  #3, 4
  group(n_times(digit,1)),

  #HGDM, LAAM, LA9M
  group(n_times(alpha,4))
  %or%
  group(n_times(alpha,2), digit, alpha),

  #group(n_times(alnum, 4)),

  #686151, 343662, 173562
  group(n_times(digit,6)),

  end

)


##Honda
honda12 <- rex(

  start,

  #L15A, J30A, K10B
  group(alpha, n_times(digit,2), alpha),

  #30081427, 45830202, N1271172
  n_times(digit,8)
  %or%
  group(alpha,n_times(digit,7)),

  end

)


honda12_alt <- rex(

  start,

  alpha,

  "128410",

  n_times(digit,5),

  end

)

re_matches(c("L12841017219", "I12841027469"), honda12_alt)



ford_e7 <- rex(
  start,

  ##8K, 6TB, BL
  group(digit,between(alpha, 1,2))
  %or%
  n_times(alpha,2) ,

  #43700, 4070, 44604
  between(digit, 4,5),

  end
)

ford_e17 <- rex(
  start,

  ## over 99 % starts with MAJ
  "MAJ",

  ##
  alpha %or% digit,

  ## over 99% contains X in 5th and 6th positions
  "XX",

  group(between(alpha,3,4), maybe(digit)),

  group(maybe(digit),between(alpha,1,2), between(digit,4,5)),

  end
)

##tata

tata_e18 <- rex(
  start,

  n_times(digit,2),

  group(maybe(digit), between(alpha, 2, 3)),

  group(maybe(digit), between(alpha, 1, 2))
  %or%
  group(alpha, digit),

  n_times(digit,2),

  n_times(alpha, 4),

  n_times(digit, 5),

  end
)

tata_e15 <- rex(
  start,
  n_times(digit, 3),

  maybe(alpha),

  between(digit, 11, 12),
  end
)


tata_e17 <- rex(
  start,
  group(
    between(alpha, 6, 7),
    between(alnum, 10, 11))
  %or%
  group(
    n_times(alpha,3),
    n_times(digit,6),
    n_times(alpha,3),
    n_times(digit,5)
  )
  %or%
  group(
    n_times(alpha,6),
    n_times(digit,2),
    n_times(alpha,4),
    n_times(digit,5)
  )
  %or%
  group(
    n_times(digit,3),
    n_times(alpha,3),
    between(digit, 2, 3),
    group(between(alpha, 3, 5), between(alpha, 4, 5))
  )
  %or%
  group(
    n_times(digit,2),
    group(between(alpha, 5, 6), between(digit, 1, 2)),
    group(between(alpha, 3, 4), between(digit, 4, 5))
  )
  %or%
  group(  between(digit, 2, 4),
          between(alpha, 1, 6),
          maybe(between(digit, 0, 3)),
          between(alpha, 3, 6),
          between(digit, 4, 5)
  ),
  end
)

###Chasis


#maruti 17

maruti_c17 <- rex(
  "MA3",
  group(n_times(alpha, 4), digit) %or%
  group(n_times(alpha, 3), n_times(digit, 2)) %or%
  n_times(alpha, 5),
  group(alpha,n_times(digit, 2)) %or%
  n_times(digit, 3) %or%
  n_times(alpha, 3),
  group(alpha, n_times(digit, 5)) %or%
  n_times(digit, 6)
)


#honda 17

honda_c17 <- rex(

  start,

  ## over 98% begins with MAK, and a sequence of 2 more alphabets
  group("MAK", n_times(alpha, 2)),

  between(digit,2,3),

  between(alnum, 3, 4),

  between(digit, 6,7),

  end

)


##hyundai 17

hyundai_c17 <- rex(
  n_times(alpha, 4),
  group(alpha,n_times(digit, 2)) %or%  n_times(digit, 3),
  n_times(alnum, 4), #potentially alnum
  n_times(digit, 6)
)



###Ford 17

ford_c17 <- rex(
"M",

n_times(alpha,5) %or%
group(n_times(alpha,4), digit) %or%
group(n_times(alpha,2), digit, n_times(alpha,2)),

n_times(alpha,4) %or%
group(n_times(alpha,3), digit) %or%
group(n_times(alpha,2), digit, alpha),

n_times(alpha,2) %or%
group(digit,alpha),

n_times(digit, 5) %or%
group(alpha, n_times(digit, 4))

)

