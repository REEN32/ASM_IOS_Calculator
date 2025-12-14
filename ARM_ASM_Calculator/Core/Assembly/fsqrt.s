
    .section __TEXT,__text,regular,pure_instructions
    .globl  _sqrt_floats
    .p2align    2

_sqrt_floats:
    fsqrt    s0, s0
    ret
