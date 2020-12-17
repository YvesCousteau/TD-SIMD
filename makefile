#Compiler
CC=gcc
CC_2=clang

#Optimization flags
O1_FLAGS=-O1
O2_FLAGS=-O2
O3_FLAGS=-O3
Ofast_FLAGS=-Ofast
Okamikaze_FLAGS=-march=native -mtune=native -Ofast -funroll-loops -finline-functions -ftree-vectorize

#
all: dotprod_O1_gcc.s dotprod_O2_gcc.s dotprod_O3_gcc.s dotprod_Ofast_gcc.s dotprod_double_O1_gcc.s dotprod_double_O2_gcc.s dotprod_double_O3_gcc.s dotprod_double_Ofast_gcc.s dotprod_O1_clang.s dotprod_O2_clang.s dotprod_O3_clang.s dotprod_Ofast_clang.s dotprod_double_O1_clang.s dotprod_double_O2_clang.s dotprod_double_O3_clang.s dotprod_double_Ofast_clang.s dotprod_double_Okamikaze_clang.s dotprod_double_Okamikaze_gcc.s dotprod_Okamikaze_gcc.s dotprod_Okamikaze_clang.s

dotprod_O1_gcc.s: dotprod.c
	$(CC) -S $(O1_FLAGS) $< -o $(CC)/$@

dotprod_O1_clang.s: dotprod.c
	$(CC_2) -S $(O1_FLAGS) $< -o $(CC_2)/$@

dotprod_O2_gcc.s: dotprod.c
	$(CC) -S $(O2_FLAGS) $< -o $(CC)/$@

dotprod_O2_clang.s: dotprod.c
	$(CC_2) -S $(O2_FLAGS) $< -o $(CC_2)/$@

dotprod_O3_gcc.s: dotprod.c
	$(CC) -S $(O3_FLAGS) $< -o $(CC)/$@

dotprod_O3_clang.s: dotprod.c
	$(CC_2) -S $(O3_FLAGS) $< -o $(CC_2)/$@

dotprod_Ofast_gcc.s: dotprod.c
	$(CC) -S $(Ofast_FLAGS) $< -o $(CC)/$@

dotprod_Ofast_clang.s: dotprod.c
	$(CC_2) -S $(Ofast_FLAGS) $< -o $(CC_2)/$@

dotprod_Okamikaze_gcc.s: dotprod.c
	$(CC) -S $(Okamikaze_FLAGS) $< -o $(CC)/$@

dotprod_Okamikaze_clang.s: dotprod.c
	$(CC_2) -S $(Okamikaze_FLAGS) $< -o $(CC_2)/$@

###############################################

dotprod_double_O1_gcc.s: dotprod_double.c
	$(CC) -S $(O1_FLAGS) $< -o $(CC)/$@

dotprod_double_O1_clang.s: dotprod_double.c
	$(CC_2) -S $(O1_FLAGS) $< -o $(CC_2)/$@

dotprod_double_O2_gcc.s: dotprod_double.c
	$(CC) -S $(O2_FLAGS) $< -o $(CC)/$@

dotprod_double_O2_clang.s: dotprod_double.c
	$(CC_2) -S $(O2_FLAGS) $< -o $(CC_2)/$@

dotprod_double_O3_gcc.s: dotprod_double.c
	$(CC) -S $(O3_FLAGS) $< -o $(CC)/$@

dotprod_double_O3_clang.s: dotprod_double.c
	$(CC_2) -S $(O3_FLAGS) $< -o $(CC_2)/$@

dotprod_double_Ofast_gcc.s: dotprod_double.c
	$(CC) -S $(Ofast_FLAGS) $< -o $(CC)/$@

dotprod_double_Ofast_clang.s: dotprod_double.c
	$(CC_2) -S $(Ofast_FLAGS) $< -o $(CC_2)/$@

dotprod_double_Okamikaze_gcc.s: dotprod_double.c
	$(CC) -S $(Okamikaze_FLAGS) $< -o $(CC)/$@

dotprod_double_Okamikaze_clang.s: dotprod_double.c
	$(CC_2) -S $(Okamikaze_FLAGS) $< -o $(CC_2)/$@



clean:
	rm -Rf $(CC)/*
	rm -Rf $(CC_2)/*
