
    .section __TEXT,__text,regular,pure_instructions
    .globl  _mul_floats
    .p2align    2

_mul_floats:
    fmul    s0, s0, s1
    ret
