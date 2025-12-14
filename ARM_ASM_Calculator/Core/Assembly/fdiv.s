
    .section __TEXT,__text,regular,pure_instructions
    .globl  _div_floats
    .p2align    2

_div_floats:
    fdiv    s0, s0, s1
    ret
