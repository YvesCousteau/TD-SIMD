# TD SIMD by Hugo Henrotte

---

**gcc version 10.2.0**
**clang version 11.0.0-2**
**Intel(R) Core(TM) i7-10700K CPU @ 3.80GHz**
**Products formerly Comet Lake**
**# of Cores 8**

---

Compiler use : gcc and clang
---

## Simple

### gcc

+ O1

  * O1 est le premier niveau d'optimisation, ici nous somme en instructions scalaires (double). ```addsd    %xmm0, %xmm1```

+ O2

  * Il y a eu des modifications avec O1, il n'y a plus que LFBO/L3/L4 et L1 à disparue. Puis il y a des optimisation comme avec le xorl qui a pris la place du movl. ici aussi nous somme avec des instructions scalaires (double). ```addsd    %xmm0, %xmm1```

+ O3

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```movsd    (%rsi,%rax,8), %xmm0``` & ```movapd    %xmm1, %xmm0```

+ Ofast

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```addsd    %xmm0, %xmm1``` &  ```addpd    %xmm0, %xmm2```

+ Okamikaze

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```addsd    %xmm0, %xmm1``` &  ```addpd    %xmm0, %xmm2```

### clang

+ O1

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```movsd    (%rdi,%rax,8), %xmm1``` &  ```xorpd    %xmm0, %xmm0```

+ O2

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```movsd    (%rdi,%rax,8), %xmm1``` &  ```xorpd    %xmm0, %xmm0```

+ O3

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```movsd    (%rdi,%rax,8), %xmm1``` &  ```xorpd    %xmm0, %xmm0```

+ Ofast

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```movsd    (%rdi,%rax,8), %xmm1``` &  ```xorpd    %xmm0, %xmm0```

+ Okamikaze

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```movsd    (%rdi,%rax,8), %xmm1``` &  ```xorpd    %xmm0, %xmm0```

On remarque que il n'y a pas d'optimisation supplementaire entre O2 et O3.

---

## Double

### gcc

+ O1

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```mulsd    8(%rsi,%rax,8), %xmm0``` &  ```movapd    %xmm2, %xmm1```

+ O2

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```mulsd    8(%rsi,%rax,8), %xmm0``` &  ```movapd    %xmm2, %xmm1```

+ O3

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```addsd    %xmm3, %xmm0``` &  ```movupd    16(%rdi,%rax), %xmm0```

+ Ofast

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```addsd    %xmm4, %xmm0``` &  ```movapd    %xmm1, %xmm4```

+ Okamikaze

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```addsd    %xmm4, %xmm0``` &  ```movapd    %xmm1, %xmm4```

### clang

+ O1

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```movsd    (%rdi,%rax,8), %xmm2``` &  ```xorpd    %xmm0, %xmm0```

+ O2

  * Ici aussi nous avons du scalaire (double) mais aussi des instructions vectorielles (packed double). ```addsd    %xmm1, %xmm0``` &  ```xorpd    %xmm1, %xmm1```

+ O3

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```addsd    %xmm1, %xmm0``` &  ```xorpd    %xmm1, %xmm1```

+ Ofast

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```addsd    %xmm1, %xmm0``` &  ```xorpd    %xmm1, %xmm1```

+ Okamikaze

  * Ici aussi nous avons des instructions scalaires (double) mais aussi des instructions vectorielles (packed double). ```addsd    %xmm1, %xmm0``` &  ```xorpd    %xmm1, %xmm1```

On remarque que il n'y a pas d'optimisation supplementaire entre O3 et Ofast.

---

## Conclusion :

+ plus le code est optimiser plus l'utilisation des instructions vectorielles prime sur les instructions scalaires et plus il y a d'alignement.
+ la compilation avec **clang** utilise plus les instructions vectorielles (optimisée) qu'avec **gcc**, cela vaut pour les premiers degrés d'optimisations (O1 & O2) que ce soit en simple ou en double.

---

**@Cousteau**
