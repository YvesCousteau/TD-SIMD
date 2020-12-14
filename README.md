# TD SIMD by Hugo Henrotte
---
**gcc version 10.2.0**
**Intel i7-10700K (16) @ 5.100GHz**
**Products formerly Comet Lake**
**# of Cores 8**
---
Compiler use : gcc and clang
---
## Simple
### gcc
+ O1
  * O1 est le premier niveau d'optimisation, ici nous somme en scalaire (double). ```addsd	%xmm0, %xmm1```
+ O2
  * Il y a eu des modifications avec O1, il n'y a plus que LFBO/L3/L4 et L1 à disparue. Puis il y a des optimisation comme avec le xorl qui a pris la place du movl. ici aussi nous somme en scalaire (double). ```addsd	%xmm0, %xmm1```
+ O3
  * Ici aussi nous avons du scalaire (double) mais aussi du vectoriel (packed double). ```movsd	(%rsi,%rax,8), %xmm0``` & ```movapd	%xmm1, %xmm0```
+ Ofast
  * Ici aussi nous avons du scalaire (double) mais aussi du vectoriel (packed double).
  ```
  movsd	(%rsi,%rax,8), %xmm0
	mulsd	(%rdi,%rax,8), %xmm0
  addsd	%xmm0, %xmm1
  ``` & ```
  mulpd	%xmm3, %xmm0
  addpd	%xmm0, %xmm2
  ```
### clang
+ O1
  *
+ O2
  *
+ O3
  *
+ Ofast
  *  
---
## Double
### gcc
+ O1
  *
+ O2
  *
+ O3
  *
+ Ofast
  *
### clang
+ O1
  *
+ O2
  *
+ O3
  *
+ Ofast
  *
---
@Cousteau
